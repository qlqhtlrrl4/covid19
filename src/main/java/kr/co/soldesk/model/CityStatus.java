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
		name = "citystatus_seq_generator",
		table = "citystatus_sequence",
		pkColumnValue = "citystatus_seq",
		valueColumnName = "next_val",
		allocationSize = 1000)
@Table(name="citystatus")
public class CityStatus {
	
	@GeneratedValue(strategy=GenerationType.TABLE, generator = "citystatus_seq_generator")
	@Id
	@Column(name="citystatus_id", nullable=false , updatable=false)
	private Long id;
	
	private String createDt;
	
	private int deathCnt;
	
	private int defCnt;
	
	private String gubun;
	
	private String gubunCn;
	
	private String gubunEn;
	
	private int incDec;
	
	private int isolClearCnt;
	
	private int isolIngCnt;
	
	private int localOccCnt;
	
	private int overFlowCnt;
	
	private String qurRate;
	
	private int seq;
	
	private String stdDay;
	
	private String updateDt;

}
