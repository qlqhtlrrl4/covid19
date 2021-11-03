package kr.co.soldesk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import kr.co.soldesk.model.Country;

public interface CountryRepository extends JpaRepository<Country, Long>{
	@Modifying
	@Query(value = "truncate table country", nativeQuery = true)
	void deleteAll();
	
	@Query(value = "select * from country where areaNmEn = :name", nativeQuery = true)
	List<Country> findCountryList(@Param("name") String name);
}
