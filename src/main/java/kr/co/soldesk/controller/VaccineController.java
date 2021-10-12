package kr.co.soldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.soldesk.model.Vaccination;
import kr.co.soldesk.service.ApiRestService;

@Controller
public class VaccineController {
	
	@Autowired
	private ApiRestService restService;
	
	@RequestMapping(value = "/vaccine", method = RequestMethod.GET)
	public String vaccine(Model model) {
		
		Vaccination vaccineData = restService.getRecentVaccinationData();
		System.out.println(vaccineData);
		model.addAttribute("vaccineData", vaccineData);
		return "/vaccine.do";
	}
	
}