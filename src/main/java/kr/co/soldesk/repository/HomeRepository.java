package kr.co.soldesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.domain.CovidStatusData;

@Repository
public interface HomeRepository extends JpaRepository<CovidStatusData, Long>{
	
	@Query(value = "select  "+
					"	*  "+
					"from covidstatus "+
					"order by createDt desc "+
					"limit 1; ", nativeQuery=true)
	CovidStatusData findRecentData();
	
	
}
