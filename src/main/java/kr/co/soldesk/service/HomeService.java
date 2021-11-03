package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.model.Country;
import kr.co.soldesk.model.CovidStatus;
import kr.co.soldesk.repository.CountryRepository;
import kr.co.soldesk.repository.HomeRepository;

@Service
public class HomeService {
	
	@Autowired
	private HomeRepository homeRepository;
	
	@Autowired
	private CountryRepository countryRepository;

	public CovidStatus findRecentData() {
		return homeRepository.findRecentData();
	}

	public CovidStatus findYesterDay() {
		
		return homeRepository.findYesterData();
	} 
	
	public List<Country> findCountryList(String name) { return countryRepository.findCountryList(name); }
}
