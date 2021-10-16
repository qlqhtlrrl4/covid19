package kr.co.soldesk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soldesk.model.Covidhospital;


@Repository
public interface CovidHospitalRepository extends JpaRepository<Covidhospital, Integer>{
	
	@Modifying
	@Query(value = "truncate table covidhospital", nativeQuery = true)
	void deleteAll(); 
	
	@Query(value = "select * from covidhospital", nativeQuery = true)
	List<Covidhospital> findAll();
	
	@Modifying
	@Transactional
	@Query(value = "update covidhospital set lat = :lat, lng = :lng where covid_id = :covid_id", nativeQuery = true)
	void updateLatLng(@Param("lat") String lat, @Param("lng") String lng, @Param("covid_id") String covid_id);

}
