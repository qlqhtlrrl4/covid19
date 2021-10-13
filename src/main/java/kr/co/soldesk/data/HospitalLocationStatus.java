package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.HospitalLocation;
import lombok.Data;

@Data
public class HospitalLocationStatus {
	
	private int currentCount;
	
	private List<HospitalLocation> data;
	
	private int matchCount;
	
	private int page;
	
	private int perPage;
	
	private int totalCount;
}
