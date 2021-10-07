package kr.co.soldesk.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import kr.co.soldesk.model.UserDto;

public interface CustomUserDetailsService extends UserDetailsService {
	public void save(UserDto userDto);
}
