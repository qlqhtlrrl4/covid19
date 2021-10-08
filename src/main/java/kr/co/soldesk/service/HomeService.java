package kr.co.soldesk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.model.CovidStatus;
import kr.co.soldesk.repository.HomeRepository;

@Service
public class HomeService {
	
	@Autowired
	private HomeRepository homeRepository;

	public CovidStatus findRecentData() {
		return homeRepository.findRecentData();
	} 
}
