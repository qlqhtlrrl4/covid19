package kr.co.soldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.soldesk.model.Covidhospital;
import kr.co.soldesk.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("active", "search");
		List<Covidhospital> covidhospitals = searchService.findAllCovidhospital();
		
		model.addAttribute("covidhospitals", covidhospitals);
		
		
		
		
		return "/search.do";
		
	}
	
	
}
