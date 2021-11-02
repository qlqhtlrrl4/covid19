package kr.co.soldesk.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetailsService;

import kr.co.soldesk.model.UserDto;
import kr.co.soldesk.model.Users;

public interface CustomUserDetailsService extends UserDetailsService {
	public void save(UserDto userDto);
	
	public int idCheck(String id);
	
	public List<Map<String,String>> getAllId();
	
	public List<Users> findAll();
}
