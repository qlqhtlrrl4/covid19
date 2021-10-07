package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.CovidStatus;
import lombok.Data;

@Data
public class CovidStatusBody {
	
	private List<CovidStatus> items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
	
	
	
}
