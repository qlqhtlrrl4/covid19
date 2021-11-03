package kr.co.soldesk.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import lombok.Data;

@Data
@Entity
@TableGenerator(
		name = "country_seq_generator",
		table = "country_sequence",
		pkColumnValue = "country_seq",
		valueColumnName = "next_val",
		allocationSize = 1000)
@Table(name="country")
public class Country {
	
	@GeneratedValue(strategy=GenerationType.TABLE, generator = "country_seq_generator")
	@Id
	@Column(name="country_id", nullable=false , updatable=false)
	private Long id;
	
	private String areaNm;
	
	private String areaNmCn;
	
	private String areaNmEn;
	
	private String createDt;
	
	private int natDeathCnt;
	
	private double natDeathRate;
	
	private int natDefCnt;
	
	private String nationNm;
	
	private String nationNmCn;
	
	private String nationNmEn;
	
	private int seq;
	
	private String stdDay;
	
	private String updateDt;
	
	private String imageFilepath;

}
