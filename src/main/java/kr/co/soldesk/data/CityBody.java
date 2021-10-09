package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.CityStatus;
import lombok.Data;

@Data
public class CityBody {
	
	private List<CityStatus> items;
	
	private int numOfRows;
	
	private int pageNo;
	
	private int totalCount;
}
