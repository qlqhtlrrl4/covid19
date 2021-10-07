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
		name = "covidgubun_seq_generator",
		table = "covidgubun_sequence",
		pkColumnValue = "covid_seq",
		valueColumnName = "next_val",
		allocationSize = 1000)
@Table(name="covidgubun")
public class CovidGubun {
	
	@GeneratedValue(strategy=GenerationType.TABLE, generator = "covidgubun_seq_generator")
	@Id
	@Column(name="covidgubun_id", nullable=false , updatable=false)
	private Long id;
	
	private int confCase;
	private double confCaseRate;
	private String createDt;
	private double criticalRate;
	private int death;
	private double deathRate;
	
	private String gubun;
	private int seq;
	private String updateDt;
	
	

}
