package kr.co.soldesk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kr.co.soldesk.model.CovidGubun;

public interface CovidGubunRepository extends JpaRepository<CovidGubun, Long>{
	
	@Modifying
	@Query(value = "truncate table covidgubun", nativeQuery = true)
	void deleteAll();
	
	@Query(value="select * from covidgubun where gubun like '%성'",nativeQuery=true)
	List<CovidGubun>genderData();
	
	@Query(value ="select * from covidgubun where gubun like '%-%'",nativeQuery=true)
	List<CovidGubun>rangeAgeData();

}
