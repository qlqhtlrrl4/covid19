package kr.co.soldesk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.model.Covidhospital;


@Repository
public interface CovidHospitalRepository extends JpaRepository<Covidhospital, Integer>{
	
	@Modifying
	@Query(value = "truncate table covidhospital", nativeQuery = true)
	void deleteAll(); 
	
	@Query(value = "select * from covidhospital", nativeQuery = true)
	List<Covidhospital> findAll();

}
