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
	
	//@NotEmpty(message="비밀번호를 적어주세요")
	//@Size(min=8,max=20,message="pw는 최소 8글자 최대 20글자로 적어주세요.")
	private String password;
	
	/*@NotEmpty(message="이름을 적어주세요")
	@Size(min=2,max=5,message="이름은 2~5글자로 적어주세요")*/
	private String name;
	
	private String answer;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
