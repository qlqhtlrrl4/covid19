package kr.co.soldesk.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import kr.co.soldesk.model.UserDto;
import kr.co.soldesk.model.Users;

public interface CustomUserDetailsService extends UserDetailsService {
	public void save(UserDto userDto);
	
	public int idCheck(String id);
	
	public List<Map<String,String>> getAllId();
	
	public List<Users> findAll();
	
	public Users findByUserId(String email,String name);
	
	public Users findByUserPw(String id,String email,String name);
	
	void updatePw(String password, String id,UserDto user);
}
