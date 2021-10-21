package kr.co.soldesk.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.model.Board;
import kr.co.soldesk.service.QnaService;

@Controller
@RequestMapping(value="/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
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
	
	@RequestMapping(value="/new", method = RequestMethod.GET)
	public String newBoard(Model model) {
		model.addAttribute("active","qna");
		return "/qna/new.do";
	}

	@RequestMapping(value="/new", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> newBoardPost(Model model, @ModelAttribute("board") Board board) {
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			qnaService.insertBoard(board);
			result.put("result", true);
		} catch(Exception e) {
			result.put("result", false);
		}
		
		return result;
	}
}
