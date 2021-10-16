package kr.co.soldesk.model;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class GeoCodingResult {
	
	private String status;
    private List<GeoCodingResultLatLng> addresses;
}
