package kr.co.soldesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	// Member findMemberByMemberId(String id);
	@Query("SELECT u FROM User u LEFT JOIN FETCH u.roles WHERE u.id = (:userId)")
	User findById(@Param("userId") String userId);

	@Query("SELECT m FROM User m  WHERE m.id = (:userId)")
	User findAdmin(@Param("userId") String userId);

}
