package kr.co.soldesk.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.model.Vaccination;

@Repository
public interface VaccinRepository extends JpaRepository<Vaccination, Integer> {
	
	@Modifying
	@Query(value = "truncate table vaccination", nativeQuery = true)
	void deleteAll(); 
	
	@Query(value ="select baseDate,secondCnt from vaccination where sido like '전국' order by baseDate desc limit 14;",nativeQuery = true)
	List<Map<String,Object>> findFirstChart();
	
	@Query(value= "select * from vaccination where sido like '전국' order by baseDate desc limit 1;",nativeQuery = true)
	Vaccination recentVaccineData();
	
	@Query(value="select baseDate, totalSecondCnt from vaccination where sido like '전국' order by baseDate desc limit 1;",nativeQuery = true)
	List<Map<String, Object>> todayVaccineData();
	
	@Query(value="select sido,secondCnt from vaccination where sido not like '전국'and date_format(baseDate,\"%Y-%m-%d\") = DATE_FORMAT(now(),\"%Y-%m-%d\");",nativeQuery = true)
	List<Map<String, Object>> locationData();
	
	
	
	//List<VaccinationDataMapping> findAllBy();
	

}
