package kr.co.soldesk.controller;

import java.util.List;

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

import kr.co.soldesk.model.UserDto;
import kr.co.soldesk.model.Users;
import kr.co.soldesk.service.CustomUserDetailsService;

@Controller
@RequestMapping("/auth")
public class LoginController {

	@Autowired
	@Qualifier("userDetailsService")
	private CustomUserDetailsService userService;

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {

		if (error != null) {
			model.addAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다");

		}

		if (logout != null) {
			model.addAttribute("logoutMsg", "You have been logged out successfully");
		}

		return "/auth/login";
	}

	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String findid(@ModelAttribute("findid") UserDto findid) {

		return "/auth/findid.do";
	}

	@RequestMapping(value = "/findid_pro", method = RequestMethod.POST)
	public String findid_pro(@ModelAttribute("findid") UserDto findid, Model model) {

		Users user = new Users();

		user = userService.findByUserId(findid.getEmail(), findid.getName());

		model.addAttribute("user", user);

		return "/auth/findid_success.do";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findpw(@ModelAttribute("findpw") UserDto findpw) {

		return "/auth/findpw.do";
	}

	@RequestMapping(value = "/findpw_pro", method = RequestMethod.GET)
	public String findpw_pro(@ModelAttribute("findpw") UserDto findpw, Model model,
							 @RequestParam("id")String id,
							 @RequestParam("email")String email,
							 @RequestParam("name")String name) {

		List<Users> userlist=userService.findAll();
		Users user=new Users();
		
		for(Users ul : userlist) {
			if(ul.getId().equals(id) && ul.getEmail().equals(email) && ul.getName().equals(name)) {
				
				
				model.addAttribute("user", user);
				model.addAttribute("id",id);
				model.addAttribute("email",email);
				model.addAttribute("name",name);
				
				return "/auth/findpw_success.do";
			}
		}
		
		
		model.addAttribute("errorMsg", "Invalid Id and Email and Name");

		return "/auth/findpw.do";
	}

	@RequestMapping(value = "/findpw_pro2", method = RequestMethod.POST)
	public String findpw_pro2(@Valid @ModelAttribute("findpw") UserDto findpw, Model model,BindingResult result,
							  @RequestParam("id") String id) {
		if (result.hasErrors()) {

			return "/auth/findpw_success.do";
		}
		
		
		System.out.println("asdasd"+id);
		
		if(findpw.getPassword().equals(findpw.getFind_password_check())) {

		String passwd = findpw.getPassword();

		userService.updatePw(passwd, id, findpw);
		
		return "/auth/findpw_update.do";
		}
		
		model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다");
		
		return "/auth/findpw_success.do";
		
	}

}
