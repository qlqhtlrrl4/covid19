package kr.co.soldesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.co.soldesk.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
	
	
}
