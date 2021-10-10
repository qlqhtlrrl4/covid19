package kr.co.soldesk.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.model.CityStatus;
import kr.co.soldesk.model.CovidGubun;
import kr.co.soldesk.model.CovidStatus;
import kr.co.soldesk.model.Vaccination;
import kr.co.soldesk.service.ApiRestService;

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
	public List<CovidGubun> gender() {
		
		List<CovidGubun> genderData = restService.getGenderData();
		//System.out.println(genderData);
		
		return genderData;
	}
	
	@GetMapping(value="/rangeAge", produces="application/json; charset=utf8")
	@ResponseBody
	public List<CovidGubun> rangeAge() {
		List<CovidGubun> ageData = restService.getRangeAge();
		
		return ageData;
	}
	
	@GetMapping(value="/sido", produces="application/json; charset=utf8")
	@ResponseBody
	public List<CityStatus> city() {
		List<CityStatus> cityData = restService.getCityData();
		
		return cityData;
	}
	
	@GetMapping(value="/vaccineStatus", produces="application/json; charset=utf8")
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
	}
}
