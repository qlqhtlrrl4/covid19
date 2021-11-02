package kr.co.soldesk.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
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
	@Transactional("jpatransactionManager")
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		System.out.println("sdaaaaaaaaaaaaaaaaaaaaaaaaaa"+id);
		System.out.println(userRepository.findById(id));
		
		Users user = userRepository.findById(id);
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		for (Roles role : user.getRoles()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
		}
		
		return new User(user.getId(), user.getPassword(),
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
		
		int cnt;
		
		if(userRepository.findById(id) != null) {
			cnt = 1;
		}
		else {
			cnt  = 0;
		}
		return cnt;
	}

	@Override
	public List<Map<String, String>> getAllId() {
		List<Map<String,String>> allUserIdList = userRepository.findAllById();
		
		System.out.println(allUserIdList);
		return allUserIdList;
	}
	
	@Override
	public List<Users> findAll(){
		return userRepository.findAll();
	}

	@Override
	public Users findByUserId(String email,String name) {
		
		List<Users> userlist=userRepository.findAll();
		Users user=new Users();
		
		for(Users ul : userlist) {
			if(ul.getEmail().equals(email) && ul.getName().equals(name)) {
				
				
				user.setId(ul.getId());
				
			}
		}
		
		
		return user;
	}
	
	
	@Override
	public Users findByUserPw(String id,String email,String name) {
		
		List<Users> userlist=userRepository.findAll();
		Users user=new Users();
		
		for(Users ul : userlist) {
			if(ul.getId().equals(id) && ul.getEmail().equals(email) && ul.getName().equals(name)) {
				
				
			}
		}
		
		
		return user;
	}

	@Override
	@Transactional("jpatransactionManager")
	public void updatePw(String password, String id,UserDto userDto) {
		
		
		Users user=new Users();
		
		String pass = encoder.encode(password);
		user.setEmail(userDto.getEmail());
		user.setName(userDto.getName());
		user.setPassword(pass);
		System.out.println(id);
		user.setId(id);
		
		
		userRepository.updatePw(user.getPassword(),user.getId());
	}
}
