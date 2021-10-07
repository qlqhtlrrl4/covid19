package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.Covidhospital;
import lombok.Data;

@Data
public class CovidHospitalData {
	
	private int currentCount;
	private List<Covidhospital> data;
	private int matchCount;
	private int page;
	private int perPage;
	private int totalCount;

}
	