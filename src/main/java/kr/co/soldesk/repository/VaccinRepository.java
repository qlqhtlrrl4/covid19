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
	
	@Query(value="select baseDate, totalSecondCnt from vaccination where sido like '전국' order by baseDate desc limit 7;",nativeQuery = true)
	List<Map<String, Object>> locationDayData();
	
	@Query(value="select sido,secondCnt from vaccination where sido not like '전국'and date_format(baseDate,\"%Y-%m-%d\") = DATE_FORMAT(now(),\"%Y-%m-%d\");",nativeQuery = true)
	List<Map<String, Object>> todayVaccineData();
	
	@Query(value="select date_format(date_sub(baseDate, interval(DAYOFWEEK(baseDate)-1)DAY),'%Y-%m-%d')AS start,"
			+ "date_format(date_sub(baseDate, interval(DAYOFWEEK(baseDate)-7)DAY),'%Y-%m-%d')as end,"
			+ "date_format(baseDate,'%Y%U')as 'date',"
			+ "sum(secondCnt) from vaccination where sido like '전국'"
			+ " group by start, end, date\r\n" + 
			"order by  date desc limit 7; ",nativeQuery=true)
	List<Map<String, Object>> locationWeekData();
	
	@Query(value="SELECT sum(secondCnt),date_format((baseDate),'%Y-%m')as month FROM covid.vaccination where sido like '전국' group by date_format((baseDate),'%Y-%m'); ", nativeQuery = true)
	List<Map<String, Object>> locationMonthData();
	
	
	
	//List<VaccinationDataMapping> findAllBy();
	

}
