package kr.co.soldesk.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "contents")
public class Contents{
	
	@Id
	@Column(name = "contentIdx")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int contentIdx;
	
	private String subject;
	private String text;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinColumn(name="writerIdx")
	private Users writerIdx;
	
	@Column(insertable = false)
	private String date;
	
	private int count;
	
	private String open; 
	
	private String writer;
	
	private String ensubject;
	
	private String entext;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "contentIdx", cascade = CascadeType.ALL, orphanRemoval=true)
	private Set<Reply> reply;
}
