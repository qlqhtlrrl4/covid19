package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.Vaccination;
import lombok.Data;

@Data
public class VaccinationStatus {
	
	private int currentCount;
	
	private List<Vaccination> data;
	
	private int matchCount;
	
	private int page;
	
	private int perPage;
	
	private int totalCount;
}
