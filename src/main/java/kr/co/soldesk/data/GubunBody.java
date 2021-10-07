package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.CovidGubun;
import lombok.Data;

@Data
public class GubunBody {
	
	private List<CovidGubun> items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
	
	

}
