package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.domain.VaccinationData;
import lombok.Data;

@Data
public class VaccinationStatus {
	
	private int currentCount;
	
	private List<VaccinationData> data;
	
	private int matchCount;
	
	private int page;
	
	private int perPage;
	
	private int totalCount;
}
