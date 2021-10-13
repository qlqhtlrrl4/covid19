package kr.co.soldesk.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.model.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Long> {
	// Member findMemberByMemberId(String id);
	@Query("SELECT u FROM Users u LEFT JOIN FETCH u.roles WHERE u.id = (:userId)")
	Users findById(@Param("userId") String userId);

	@Query("SELECT m FROM Users m  WHERE m.id = (:userId)")
	Users findAdmin(@Param("userId") String userId);
	
	@Query(value="select user_id from users",nativeQuery=true)
	List<Map<String, String>> findAllById();

}
