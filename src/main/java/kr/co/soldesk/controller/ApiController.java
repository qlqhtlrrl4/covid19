package kr.co.soldesk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.model.CityStatus;
import kr.co.soldesk.model.CovidStatus;
import kr.co.soldesk.model.Covidhospital;
import kr.co.soldesk.model.LatLng;
import kr.co.soldesk.model.SearchKeyword;
import kr.co.soldesk.service.ApiRestService;
import redis.clients.jedis.GeoCoordinate;
import redis.clients.jedis.GeoRadiusResponse;

@Controller
public class ApiController {
	
	@Autowired
	private ApiRestService restService;
	
	@GetMapping("/test")
	public ResponseEntity<?> test() throws Exception {
		
		restService.callApi();
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@GetMapping(value="/leastDay", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<CovidStatus> leastDay() {
		
		List<CovidStatus> covidStatusLeastData = restService.getLeastDayData();
		return covidStatusLeastData;
	}
	
	
	@GetMapping(value="/gender", produces="application/json; charset=utf8")
	@ResponseBody
	public List<Map<String,Object>> gender() {
		
		List<Map<String,Object>> genderData = restService.getGenderData();
		//System.out.println(genderData);
		
		return genderData;
	}
	
	@GetMapping(value="/rangeAge", produces="application/json; charset=utf8")
	@ResponseBody
	public List<Map<String,Object>> rangeAge() {
		List<Map<String,Object>> ageData = restService.getRangeAge();
		
		return ageData;
	}
	
	@GetMapping(value="/sido", produces="application/json; charset=utf8")
	@ResponseBody
	public List<CityStatus> city() {
		List<CityStatus> cityData = restService.getCityData();
		
		return cityData;
	}
	
	
	@GetMapping(value="/covidStatutsLeast7Day", produces="application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> covidStatutsLeast7Day(){
		List<Map<String, Object>> covidStatutsData = restService.getRecentCovidStatutsData();
		
		return  covidStatutsData;
	}
	
	@GetMapping(value = "/insertLatLng")
	@ResponseBody
	public ResponseEntity<?> insertLatLng() {
		restService.insertLatLng();


		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@GetMapping(value = "/insertLatLngToRedis")
	public ResponseEntity<?> insertLatLngToRedis() {
		restService.insertLatLngToRedis();

		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@PostMapping(value = "/getGeoradius1km")
	@ResponseBody
	public ResponseEntity<?> getGeoradius1km(@ModelAttribute("latLng") LatLng latLng) {
		System.out.println("getGeoradius1km start");
		System.out.println("latLng.getLng()");
		System.out.println(latLng.getLng());
		System.out.println("latLng.getLat()");
		System.out.println(latLng.getLat());
		List<GeoRadiusResponse> geoRadiusResponseList = restService.getGeoRadius1km(latLng.getLng(), latLng.getLat());
		System.out.println(geoRadiusResponseList.size());
		List<Map<String, Double>> resultMapList = new ArrayList<>();

		for(GeoRadiusResponse geoRadiusResponse : geoRadiusResponseList) {
			System.out.println("geoRadiusResponse.getDistance()");
			System.out.println(geoRadiusResponse.getDistance());
			GeoCoordinate geoCoordinate = geoRadiusResponse.getCoordinate();
			Map<String, Double> resultMap = new HashMap<>();
			resultMap.put("lat", geoCoordinate.getLatitude());
			resultMap.put("lng", geoCoordinate.getLongitude());
			resultMapList.add(resultMap);
		}

		return new ResponseEntity<>(resultMapList, HttpStatus.OK);
	}
	
	@PostMapping(value = "/findSearchHospital")
	public ResponseEntity<?> findSearchHospital(@ModelAttribute("searchKeyword") SearchKeyword searchKeyword) {

		List<Covidhospital> covidhospitalList = restService.findSearchHospital(searchKeyword.getHospitalText());

		return new ResponseEntity<>(covidhospitalList, HttpStatus.OK);
	}
	
}
