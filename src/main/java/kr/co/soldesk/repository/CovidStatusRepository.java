package kr.co.soldesk.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kr.co.soldesk.model.CovidStatus;

public interface CovidStatusRepository extends JpaRepository<CovidStatus, Long> {

	@Modifying
	@Query(value = "truncate table covidstatus", nativeQuery = true)
	void deleteAll();

	@Query(value = "select createDt,decideCnt from covidstatus where stateDt between DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 13 DAY),\"%Y%m%d\") and DATE_FORMAT(NOW(), \"%Y%m%d\")", nativeQuery = true)
	List<Map<String, Object>> leastDayData();

	@Query(value = "select * from covidstatus where stateDt between DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 13 DAY),\"%Y%m%d\") and DATE_FORMAT(NOW(), \"%Y%m%d\")", nativeQuery = true)
	List<CovidStatus> leastDayFullData();

	@Query(value = "select  " + "   *  " + "from covidstatus " + "order by createDt desc "
			+ "limit 2; ", nativeQuery = true)
	List<CovidStatus> leastTwoDay();
	
}
