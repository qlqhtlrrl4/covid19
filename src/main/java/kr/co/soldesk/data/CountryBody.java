package kr.co.soldesk.data;

import java.util.List;

import kr.co.soldesk.model.Country;
import lombok.Data;

@Data
public class CountryBody {
	
	private List<Country> items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
}
