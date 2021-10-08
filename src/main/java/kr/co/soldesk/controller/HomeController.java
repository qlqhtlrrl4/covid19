package kr.co.soldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.soldesk.domain.CovidStatusData;
import kr.co.soldesk.service.HomeService;

@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		CovidStatusData covidStatusData = homeService.findRecentData();
		
		model.addAttribute("active", "home");
		model.addAttribute("covidStatusData", covidStatusData);/*JSP에게 데이터를 주는 코드*/
		
		return "/home.do"; //이건 tiles.xml 보고 이해 해야합니다
	}
	
}
