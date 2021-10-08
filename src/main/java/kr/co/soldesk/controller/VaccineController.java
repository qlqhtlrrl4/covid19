package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VaccineController {
	
	@RequestMapping(value = "/vaccine", method = RequestMethod.GET)
	public String vaccine(Model model) {
		
		model.addAttribute("active","vaccine");
		return "/vaccine.do";
	}
	
}