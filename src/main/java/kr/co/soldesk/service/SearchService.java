package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.model.Covidhospital;
import kr.co.soldesk.repository.CovidHospitalRepository;

@Service
public class SearchService {
	@Autowired
	private CovidHospitalRepository covidHospitalRepository;
	
	public List<Covidhospital> findAllCovidhospital() {
		return covidHospitalRepository.findAll();
	}
	
	
}
