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
import kr.co.soldesk.model.LatLng;
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
		//restService.vaccionCallApi();
		
		
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
	/*@GetMapping(value="/vaccineStatus", produces="application/json; charset=utf8")
	@ResponseBody
	public List<Vaccination> vaccination() {
		List<Vaccination> vaccinationData = restService.getRecentVaccinationData();
		
		return vaccinationData;
	}
	
	
	
	
	
	@GetMapping("/covidStatusDataDownLoad")
	public void excelDownLoad(HttpServletResponse response) throws IOException {
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet();
		Row row = null;
		Cell cell = null;
		int rowNum=0;
		
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("누적 확진률");
		
		cell = row.createCell(1);
		cell.setCellValue("번호");
		
		cell = row.createCell(2);
		cell.setCellValue("누적 검사 수");
		
		cell = row.createCell(3);
		cell.setCellValue("누적 검사 완료 수");
		
		cell = row.createCell(4);
		cell.setCellValue("치료중 환자 수");
		
		cell = row.createCell(5);
		cell.setCellValue("격리 해제수");
		
		cell = row.createCell(6);
		cell.setCellValue("등록 일시분초");
		
		cell = row.createCell(7);
		cell.setCellValue("기준일");
		
		cell = row.createCell(8);
		cell.setCellValue("기준 시간");
		
		cell = row.createCell(9);
		cell.setCellValue("수정일시분초");
		
		cell = row.createCell(10);
		cell.setCellValue("사망자 수");
		
		cell = row.createCell(11);
		cell.setCellValue("확진자 수");
		
		cell = row.createCell(12);
		cell.setCellValue("검사 진행 수");
		
		cell = row.createCell(13);
		cell.setCellValue("결과 음성 수");
		
		cell = row.createCell(14);
		cell.setCellValue("게시글 번호");
		
		for(int i=0;i<restService.getLeastDay().size();i++) {
			
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue(restService.getLeastDayData().get(i).getAccDefRate());
			
			cell = row.createCell(1);
			cell.setCellValue(restService.getLeastDayData().get(i).getId());
			
			cell = row.createCell(2);
			cell.setCellValue(restService.getLeastDayData().get(i).getAccExamCnt());
			
			cell = row.createCell(3);
			cell.setCellValue(restService.getLeastDayData().get(i).getAccExamCompCnt());
			
			cell = row.createCell(4);
			cell.setCellValue(restService.getLeastDayData().get(i).getCareCnt());
			
			cell = row.createCell(5);
			cell.setCellValue(restService.getLeastDayData().get(i).getClearCnt());
			
			cell = row.createCell(6);
			cell.setCellValue(restService.getLeastDayData().get(i).getCreateDt());
			
			cell = row.createCell(7);
			cell.setCellValue(restService.getLeastDayData().get(i).getStateDt());
			
			cell = row.createCell(8);
			cell.setCellValue(restService.getLeastDayData().get(i).getStateTime());
			
			cell = row.createCell(9);
			cell.setCellValue(restService.getLeastDayData().get(i).getUpdateDt());
			
			cell = row.createCell(10);
			cell.setCellValue(restService.getLeastDayData().get(i).getDeathCnt());

			cell = row.createCell(11);
			cell.setCellValue(restService.getLeastDayData().get(i).getDecideCnt());
			
			cell = row.createCell(12);
			cell.setCellValue(restService.getLeastDayData().get(i).getExamCnt());
			
			cell = row.createCell(13);
			cell.setCellValue(restService.getLeastDayData().get(i).getResutlNegCnt());
			
			cell = row.createCell(14);
			cell.setCellValue(restService.getLeastDayData().get(i).getSeq());
			
		}
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=14DaysData.xlsx");
		
		wb.write(response.getOutputStream());
		wb.close();
	}*/
}
