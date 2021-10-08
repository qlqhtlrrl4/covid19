package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/qna")
public class QnaController {
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("active","qna");
		return "/qna/list.do";
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detail(Model model) {
		
		model.addAttribute("active","qna");
		return "/qna/detail.do";
	}

}
