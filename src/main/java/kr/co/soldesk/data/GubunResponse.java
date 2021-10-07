package kr.co.soldesk.data;

import lombok.Data;

@Data
public class GubunResponse {
	
	private GubunHeader header;
	private GubunBody body;

}
