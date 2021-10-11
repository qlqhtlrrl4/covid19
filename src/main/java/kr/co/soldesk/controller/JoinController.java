package kr.co.soldesk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.captcha.CaptchaUtil;
import kr.co.soldesk.model.UserDto;
import kr.co.soldesk.service.CustomUserDetailsService;
import kr.co.soldesk.service.UserDtoValidator;



@Controller
@RequestMapping("/auth")
public class JoinController {
	
	@Autowired
	@Qualifier("userDetailsService")
	private CustomUserDetailsService userService;
	
	@Autowired
	private UserDtoValidator userDtoValidator = new UserDtoValidator();
	
	@Autowired
	private HttpServletRequest req;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String doJoin(Model model) {

		UserDto userInfomation = new UserDto();
		model.addAttribute("userInfomation", userInfomation);
		

		return "/auth/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String doJoin(@ModelAttribute("userInfomation")@Valid UserDto userInfomation, BindingResult result) {
		
		userDtoValidator.validate(userInfomation, result);
		
		if(result.hasErrors()) {
			return "/auth/join";
		}	
		userService.save(userInfomation);
		
		return "redirect:/auth/login"; 
	
	}
	
	@RequestMapping(value="/captchaImg")
	public void captchaImg(HttpServletResponse res) throws Exception {
		new CaptchaUtil().getImgCaptCha(req, res);
	}
	
	
	@RequestMapping(value="/captchaAudio")
	public void captchaAudio(HttpServletResponse res) throws Exception {
		
		new CaptchaUtil().getAudioCaptCha(req, res);
	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int cnt = userService.idCheck(id);
		return cnt;
	}
}
