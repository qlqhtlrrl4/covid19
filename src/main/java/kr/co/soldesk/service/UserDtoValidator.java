package kr.co.soldesk.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.soldesk.model.UserDto;

@Service
public class UserDtoValidator implements Validator {


	private static final String emailRegExp = "^[0-9a-zA-Z]([-_\\\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\\\.]?[0-9a-zA-Z])*\\\\.[a-zA-Z]{2,3}$";

	private Pattern pattern;

	public UserDtoValidator() {
		pattern = Pattern.compile(emailRegExp);

	}

	@Autowired
	private HttpServletRequest request;

	@Override
	public boolean supports(Class<?> clazz) {

		return UserDto.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {

		UserDto userDto = (UserDto) target;

		String id = userDto.getId();
		String email = userDto.getEmail();
		String password = userDto.getPassword();
		String name = userDto.getName();
		String answer = userDto.getAnswer();

		if (id.length() < 6 || id.length() > 15) {
			errors.rejectValue("id", "user.id.range.invalid");
		} else if (id == null || id.trim().isEmpty()) {
			errors.rejectValue("id", "user.id.required");
		}

		if (email == null || email.trim().isEmpty()) {
			errors.rejectValue("email", "user.email.required");
		} else {
			Matcher matcher = pattern.matcher(email);
			if (!matcher.matches()) {
				errors.rejectValue("email", "user.email.bad");
			}
		}
		if (answer == null || answer.trim().isEmpty()) {
			errors.rejectValue("answer", "user.answer.required");
		} else if (!answer.equals(request.getSession().getAttribute("captcha"))) {
			errors.rejectValue("answer", "user.answer.mismatch");
		}

		if (password == null || password.trim().isEmpty()) {
			errors.rejectValue("password", "user.password.required");
		}

		else if (password.length() < 8 || password.length() > 15) {
			errors.rejectValue("password", "user.password.range.invalid");
		}



		if (name == null || name.trim().isEmpty()) {
			errors.rejectValue("name", "user.name.required");
		} else if (name.length() < 2 || name.length() > 15) {
			errors.rejectValue("name", "user.name.range.invalid");
		}
	}

}
