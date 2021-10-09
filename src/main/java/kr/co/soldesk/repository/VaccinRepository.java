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
	
	@Query(value ="select sido,accumulatedFirstCnt from vaccination",nativeQuery = true)
	List<Map<String,Object>> findFirstChart();
	
	
	
	//List<VaccinationDataMapping> findAllBy();
	

}
