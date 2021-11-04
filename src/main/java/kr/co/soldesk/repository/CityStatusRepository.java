package kr.co.soldesk.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kr.co.soldesk.model.CityStatus;

public interface CityStatusRepository extends JpaRepository<CityStatus, Long> {
	
	@Modifying
	@Query(value = "truncate table citystatus", nativeQuery = true)
	void deleteAll();

	@Query(value="select * from citystatus where date_format(createDt,\"%Y-%m-%d\") = DATE_FORMAT(now(),\"%Y-%m-%d\") and gubun not like '검역' and gubun not like '합계';",nativeQuery=true)
	List<CityStatus> currentCityData();
	
	@Query(value="select * from citystatus where date_format(createDt,\"%Y-%m-%d\")  between DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY),\"%Y-%m-%d\")and DATE_FORMAT(now(),\"%Y-%m-%d\");",nativeQuery=true)
	List<CityStatus> locationData();
	
	@Query(value="select gubun,defCnt from citystatus where date_format(createDt,\"%Y-%m-%d\") = DATE_FORMAT(now(),\"%Y-%m-%d\") and gubun not like '검역' and gubun not like '합계';",nativeQuery=true)
	List<Map<String, Object>> areaData();
	
	@Query(value="select * from citystatus where date_format(createDt,\"%Y-%m-%d\")  between DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY),\"%Y-%m-%d\")and DATE_FORMAT(now(),\"%Y-%m-%d\")and gubun like '서울' ;",nativeQuery=true)
	List<CityStatus> seoulData();
	
	@Query(value="select * from citystatus where date_format(createDt,\"%Y-%m-%d\")  = DATE_FORMAT(now(),\"%Y-%m-%d\")and gubun like '서울' ;",nativeQuery=true)
	CityStatus toDay();
	
}
