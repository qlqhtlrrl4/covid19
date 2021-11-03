package kr.co.soldesk.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soldesk.model.Contents;
import kr.co.soldesk.model.Users;

@Repository
public interface ContentRepository extends JpaRepository<Contents, Integer> {

//	@Query(value = "SELECT * FROM contents", nativeQuery = true)
//	@Query(value = "SELECT c FROM Users u LEFT JOIN FETCH u.roles LEFT JOIN FETCH u.content c order by c.id desc")
//	List<Contents> getContentList(@Param(value="contentIdx") int contentIdx);

	@Query(value = "SELECT * From contents WHERE contentIdx=:contentIdx order by contentIdx desc", nativeQuery = true)
	Contents readContent(@Param(value = "contentIdx") int contentIdx); // read에서 띄우기 위한 쿼리문

	@Transactional("jpatransactionManager")
	@Modifying
	@Query(value = "UPDATE contents SET subject = :subject, text = :text, date = now(), ensubject =:ensubject, entext=:entext WHERE contentIdx=:contentIdx", nativeQuery = true)
	void modifyContent(@Param("subject") String subject, @Param("text") String text,
			@Param("contentIdx") int contentIdx,@Param("ensubject") String ensubject, @Param("entext") String entext); // 글 업데이트, text만

	@Modifying
	@Query(value = "UPDATE contents SET count=count+1 WHERE contentIdx=:contentIdx", nativeQuery = true)
	void getCount(@Param("contentIdx") int contentIdx);
	

	@Transactional("jpatransactionManager")
	@Modifying
	@Query(value = "DELETE FROM contents WHERE contentIdx=:contentIdx", nativeQuery = true)
	void deleteContent(@Param("contentIdx") int contentIdx); // 글 삭제

	@Transactional
	@Modifying
	@Query(value = "INSERT INTO contents c (c.subject,c.text,c.writerIdx,c.date,c.count,c.open) "
			+ "VALUES(subject = :subject, text = :text, writerIdx = :writerIdx, date = now(),count= :count, open = :open) ", nativeQuery = true)
	void insertContent(@Param("subject") String subject, @Param("text") String text,
			@Param("writerIdx") Users writerIdx, @Param("count") int count, @Param("open") String open); // insert
	
	Page<Contents> findAll(Pageable pageable);
	
	Page<Contents> findBySubjectContaining(String subject, Pageable pageable);
	
	Page<Contents> findByTextContaining(String text, Pageable pageable);
	
	Page<Contents> findByWriterContaining(String writer, Pageable pageable);

	
	
	
	//@Query(value="select c from contents c where c.subject like '%:word%' or c.text like '%:word%' ",nativeQuery = true)
	//Page<Contents> findBySubjectOrTextContaining(String word,Pageable pageable);

	
	
}
