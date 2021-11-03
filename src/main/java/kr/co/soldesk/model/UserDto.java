package kr.co.soldesk.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto {
	
	//@Size(min=6,max=15,message="id는 최소6글자 최대15글자로 적어주세요")
	private String id;

	//@NotEmpty(message="The Email must not be null")
	//@Email(message="이메일 형식으로 적어주세요")

	private String email;
	
	private String password;
	
	private String find_password_check;
		
	private String name;
	
	private String answer;
	
	
}
