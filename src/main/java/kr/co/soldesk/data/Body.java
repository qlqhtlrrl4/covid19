package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.domain.CovidStatusData;
import lombok.Data;

@Data
public class Body {
	
	private List<CovidStatusData> items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
	
	
	
}
