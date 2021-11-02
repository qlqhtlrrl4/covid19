package kr.co.soldesk.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kr.co.soldesk.model.CovidGubun;

public interface CovidGubunRepository extends JpaRepository<CovidGubun, Long>{
	
	@Modifying
	@Query(value = "truncate table covidgubun", nativeQuery = true)
	void deleteAll();
	
	@Query(value="select confCase, gubun from covidgubun where gubun like '%성' order by createDt desc limit 2;",nativeQuery=true)
	List<Map<String,Object>>genderData();
	
	@Query(value ="select confCase,gubun from covidgubun where gubun like '%-%' and date_format(createDt,\"%Y-%m-%d\") = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY),\"%Y-%m-%d\");",nativeQuery=true)
	List<Map<String,Object>>rangeAgeData();
	
	

}
