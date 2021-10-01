package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.domain.CovidData;
import lombok.Data;

@Data
public class CovidHospital {
	
	private int currentCount;
	private List<CovidData> data;
	private int matchCount;
	private int page;
	private int perPage;
	private int totalCount;

}
	