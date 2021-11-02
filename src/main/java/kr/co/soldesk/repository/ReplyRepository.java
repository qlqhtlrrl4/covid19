package kr.co.soldesk.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.model.Reply;

@Repository
public interface ReplyRepository extends JpaRepository<Reply, Integer>{
	
	@Query(value="SELECT * FROM reply WHERE contentIdx = :contentIdx", nativeQuery = true)
	List<Reply> readReply(@Param("contentIdx") int contentIdx);
	
	@Query(value="SELECT count(*) FROM reply where contentIdx = :contentIdx", nativeQuery = true)
	void countReply(@Param("contentIdx") int contentIdx);

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM reply WHERE replyIdx = :replyIdx", nativeQuery = true)
	void deleteReply(@Param("replyIdx") int replyIdx);
		
}
