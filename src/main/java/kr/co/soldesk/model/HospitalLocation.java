package kr.co.soldesk.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

/*
@Entity
@TableGenerator(
		name = "hospitalLocation_seq_generator",
		table= "hospitalLocation_sequence",
		pkColumnValue = "hospitalLocation_seq",
		valueColumnName = "next_val",
		allocationSize = 1000)
@Table(name="hospitalLocation")*/
@Data
public class HospitalLocation {
	
	@GeneratedValue(strategy=GenerationType.TABLE, generator="hospitalLocation_seq_generator")
	@Id
	@Column(name = "hospitalLocation_id", nullable=false, updatable=false)
	private Long Lid;
	
	private String address; //주소
	
	private String centerName; //병원명
	
	private String centerType; //지역
	
	private String createAt; //데이터 생성 날짜
	
	private String facilityName; // 
	
	private int id;
	
	private double lat;
	
	private double lng;
	
	private String org;
	
	private String phoneNumber;
	
	private String sido;
	
	private String sigungu;
	
	private String updateAt;
	
	private String zipCode;
	
	
	
}
