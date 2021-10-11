package kr.co.soldesk.service;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soldesk.model.Roles;
import kr.co.soldesk.model.Users;
import kr.co.soldesk.model.UserDto;
import kr.co.soldesk.repository.RoleRepository;
import kr.co.soldesk.repository.UserRepository;

@Service("userDetailsService")
public class UserDetailsServiceImp implements CustomUserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

		System.out.println(userRepository.findById(id));
		
		Users user = userRepository.findById(id);
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		for (Roles role : user.getRoles()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
		}

		return new org.springframework.security.core.userdetails.User(user.getId(), user.getPassword(),
				grantedAuthorities);
	}

	@Transactional("jpatransactionManager")
	public void save(UserDto memberDto) {

		memberDto.setPassword(encoder.encode(memberDto.getPassword()));

		Users member = new Users();
		member.setPassword(memberDto.getPassword());
		member.setId(memberDto.getId());
		member.setEmail(memberDto.getEmail());
		member.setName(memberDto.getName());
		userRepository.save(member);

		Roles role = new Roles();
		role.setUser(member);
		role.setRole("ROLE_USER");
		roleRepository.save(role);

	}

	@PostConstruct
	@Transactional("jpatransactionManager")
	public void initialize() {
		Users admin = userRepository.findAdmin("admin");

		String password = encoder.encode("123456789");

		if (admin == null) {

			admin = new Users();
			admin.setId("admin");
			admin.setEmail("admin@test");

			admin.setName("admin");
			admin.setPassword(password);
			System.out.println(admin);
			userRepository.save(admin);

			Roles role = new Roles();
			role.setUser(admin);
			role.setRole("ROLE_ADMIN");
			roleRepository.save(role);

		}
	}

	@Override
	public int idCheck(String id) {
		System.out.println(id);
		int cnt;
		
		if(userRepository.findById(id) != null) {
			cnt = 1;
		}
		else {
			cnt  = 0;
		}
		System.out.println(cnt);
		return cnt;
	}
}
