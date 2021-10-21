package kr.co.soldesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.model.Board;
import kr.co.soldesk.model.CityStatus;

@Repository
public interface BoardRepository  extends JpaRepository<Board, Long>  {
	
	@Modifying
	@Query(value = "insert into boards(title,content) values(:title, :content)", nativeQuery = true)
	void insertBoard(@Param("title") String title, @Param("content") String content);
}
