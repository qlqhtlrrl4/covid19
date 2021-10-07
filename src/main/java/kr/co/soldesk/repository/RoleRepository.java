package kr.co.soldesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.co.soldesk.model.Roles;

public interface RoleRepository extends JpaRepository<Roles, Long>{
	
	
}
