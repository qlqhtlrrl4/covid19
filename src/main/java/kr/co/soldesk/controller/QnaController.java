package kr.co.soldesk.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.soldesk.model.ContentDto;
import kr.co.soldesk.model.Contents;
import kr.co.soldesk.model.Reply;
import kr.co.soldesk.model.Users;
import kr.co.soldesk.service.ContentDetailsService;
import kr.co.soldesk.service.CustomUserDetailsService;
import kr.co.soldesk.service.ReplyServiceImp;
import kr.co.soldesk.service.TextTrans;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {

	@Autowired
	@Qualifier("contentDetailService")
	private ContentDetailsService contentDetailServiceImp;

	@Autowired
	@Qualifier("userDetailsService")
	private CustomUserDetailsService userService;

	@Autowired
	private ReplyServiceImp replyServiceImp;
	
	@Autowired
	private TextTrans textTrans;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@Transactional
	public String index(@ModelAttribute("contentList") Contents contentList,
			@PageableDefault(size = 10, sort = "contentIdx", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word, Model model,
			HttpServletRequest req
			) {
		
		String lang=req.getParameter("lang");
//		List<Contents> list=contentDetailServiceImp.getContentList();
//		model.addAttribute("list", list);
//		
//		System.out.println(list);

		Page<Contents> contentlist = contentDetailServiceImp.paging(pageable, field, word);
		
		
		int pageNumber = contentlist.getPageable().getPageNumber(); // 현재페이지
		int totalPages = contentlist.getTotalPages(); // 총 페이지 수. 검색에따라 10개면 10개..
		int pageBlock = 10; // 블럭의 수 1, 2, 3, 4, 5
		int startBlockPage = ((pageNumber) / pageBlock) * pageBlock + 1; // 현재 페이지가 7이라면 1*5+1=6
		int endBlockPage = startBlockPage + pageBlock - 1; // 6+5-1=10. 6,7,8,9,10해서 10.
		endBlockPage = totalPages < endBlockPage ? totalPages : endBlockPage;
		
		model.addAttribute("lang",lang);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("startBlockPage", startBlockPage);
		model.addAttribute("endBlockPage", endBlockPage);
		model.addAttribute("contentlist", contentlist);
		model.addAttribute("active", "qna");
		
		return "/qna/list.do";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(@ModelAttribute("writeContent") ContentDto writeContent) {

		return "/qna/write.do";
	}

	@RequestMapping(value = "/write_pro", method = RequestMethod.POST)
	public String write_pro(@Valid @ModelAttribute("writeContent") ContentDto writeContent, BindingResult result,
			@RequestParam(name = "userName") String userName,
			Locale locale) {
		
		if (result.hasErrors()) {

			return "/qna/write.do";
		}
		
		List<Users> userList = userService.findAll();
		for (Users ul : userList) {
			if (userName.equals(ul.getId())) {
				
				System.out.println(locale);
				contentDetailServiceImp.addContent(writeContent, ul,locale);
			}
		}

		// contentDetailServiceImp.addContent(writeContent);

		/*
		 * List<Users> userList = userService.findAll();
		 * 
		 * int count = 0;
		 * 
		 * for (Users ul : userList) { System.out.println(ul.getId());
		 * System.out.println(userName); if (userName.equals(ul.getId())) {
		 * 
		 * contentDetailServiceImp.insertContent(writeContent.getSubject(),
		 * writeContent.getText(),ul, count,writeContent.getOpen()); } }
		 */

		return "/qna/write_success.do";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam(name = "contentIdx") int contentIdx,
			@ModelAttribute("contentList") Contents contentList, Model model,
			HttpServletRequest req) {
		
		
		String lang=req.getParameter("lang");
		model.addAttribute("lang",lang);

		contentDetailServiceImp.getCount(contentList.getContentIdx());
		System.out.println(contentList.getContentIdx());
		model.addAttribute("contentList", contentList);

		Contents readContent = contentDetailServiceImp.readContent(contentIdx);
		model.addAttribute("readContent", readContent);

		List<Reply> replyList = replyServiceImp.readReply(contentIdx);
		model.addAttribute("replyList", replyList);
		
		model.addAttribute("path","read");

		return "/qna/read.do";
	}

	@RequestMapping(value = "/reply_write", method = RequestMethod.GET)
	public String reply_write(@ModelAttribute("writeReply") Reply writeReply,
			@RequestParam("contentIdx") int contentIdx, Model model
			) {

		model.addAttribute("contentIdx", contentIdx);
		
		

		return "/qna/reply_write.do";
	}

	@RequestMapping(value = "/reply_write_pro", method = RequestMethod.POST)
	public String write_pro(@Valid @ModelAttribute("writeReply") Reply writeReply, BindingResult result,
							@RequestParam(name = "userName") String userName) {

		if (result.hasErrors()) {

			return "/qna/reply_write.do";
		}

		List<Users> userList = userService.findAll();
		for (Users ul : userList) {
			if (userName.equals(ul.getId())) {
				replyServiceImp.addReply(writeReply, ul.getName());
			}
		}

		return "/qna/reply_write_success.do";
	}
	
	
	@RequestMapping(value="/reply_delete", method = RequestMethod.GET)
	   public String reply_delete(@RequestParam("replyIdx") int replyIdx) {
	      
	      replyServiceImp.deleteReply(replyIdx);
	      
	      return "/qna/reply_delete.do";
	   }

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("contentIdx") int contentIdx,
			@ModelAttribute("modifyContent") Contents modifyContent, Model model) {

		model.addAttribute("contentIdx", contentIdx);

		Contents modiContent = contentDetailServiceImp.readContent(contentIdx);
		model.addAttribute("modiContent", modiContent);

		modifyContent.setSubject(modiContent.getSubject());
		modifyContent.setText(modiContent.getText());
		modifyContent.setWriterIdx(modiContent.getWriterIdx());
		modifyContent.setDate(modiContent.getDate());
		modifyContent.setContentIdx(contentIdx);

		return "/qna/modify.do";
	}

	@RequestMapping(value = "/modify_pro", method = RequestMethod.GET)
	public String modify_pro(@RequestParam("subject") String subject, @RequestParam("text") String text,
			@RequestParam("contentIdx") int contentIdx, @Valid @ModelAttribute("modifyContent") Contents modifyContent,
			BindingResult result) {

		if (result.hasErrors()) {
			return "/qna/modify.do";
		}

		contentDetailServiceImp.modifyContent(subject, text, contentIdx);

		return "/qna/modify_success.do";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("contentIdx") int contentIdx) {

		contentDetailServiceImp.deleteContent(contentIdx);

		return "/qna/delete.do";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model) {

		model.addAttribute("active", "qna");
		return "/qna/detail.do";
	}

}
