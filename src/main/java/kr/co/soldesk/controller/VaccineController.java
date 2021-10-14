package kr.co.soldesk.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.model.Vaccination;
import kr.co.soldesk.service.ApiRestService;

@Controller
public class VaccineController {
	
	@Autowired
	private ApiRestService restService;
	
	@RequestMapping(value = "/vaccine", method = RequestMethod.GET)
	public String vaccine(Model model) {
		
		Vaccination vaccineData = restService.getRecentVaccinationData();
		model.addAttribute("active", "vaccine");
		model.addAttribute("vaccineData", vaccineData);
		return "/vaccine.do";
	}
	
	@RequestMapping(value="/vaccineStatus",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> vaccineClassify() {
		
		List<Map<String,Object>> vaccineClassifyData = restService.getVaccinData();
		
		return vaccineClassifyData;
	}
	
	@RequestMapping(value="/todayVaccine", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> todayVaccine() {
		
		List<Map<String,Object>> today = restService.getTodayVaccineData();
		
		return today;
	}
	
}