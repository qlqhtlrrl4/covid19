package kr.co.soldesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kr.co.soldesk.model.CovidGubun;

public interface CovidGubunRepository extends JpaRepository<CovidGubun, Long>{
	
	@Modifying
	@Query(value = "truncate table covidgubun", nativeQuery = true)
	void deleteAll();

}
