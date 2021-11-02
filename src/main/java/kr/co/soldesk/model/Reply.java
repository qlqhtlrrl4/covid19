package kr.co.soldesk.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
//import lombok.ToString;

@Getter
@Setter
@Entity
//@ToString
@Table(name="reply")
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	
	@Id
	@Column(name="replyIdx")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int replyIdx;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="contentIdx")
	private Contents contentIdx;
	
	private String content;
	private String name;
	
	@Column(insertable = false)
	private String date;

}
