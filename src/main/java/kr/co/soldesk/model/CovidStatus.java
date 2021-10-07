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
		name = "covidstatus_seq_generator",
		table = "covidstatus_sequence",
		pkColumnValue = "covidstatus_seq",
		valueColumnName = "next_val",
		allocationSize = 1000)
@Table(name = "covidstatus")
public class CovidStatus {
	
	@GeneratedValue(strategy=GenerationType.TABLE, generator = "covidstatus_seq_generator")
	@Id
	@Column(name="covidstatus_id", nullable=false , updatable=false)
	private Long id;
	
	private double accDefRate;
	private int accExamCnt;
	private int accExamCompCnt;
	private int careCnt;
	private int clearCnt;
	private String createDt;
	private int deathCnt;
	private int decideCnt;
	private int examCnt;
	private int resutlNegCnt;
	private int seq;
	private String stateDt;
	private String stateTime;
	private String updateDt;

}
