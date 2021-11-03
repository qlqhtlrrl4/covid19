package kr.co.soldesk.data;

import lombok.Data;

@Data
public class CountryResponse {
	
	private CountryHeader header;
	private CountryBody body;
}
