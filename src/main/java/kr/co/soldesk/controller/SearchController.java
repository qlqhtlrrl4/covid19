package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("active", "search");
		return "/search.do";
		
	}
}
