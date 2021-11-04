package kr.co.soldesk.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.model.CityStatus;
import kr.co.soldesk.model.Country;
import kr.co.soldesk.model.CovidStatus;
import kr.co.soldesk.service.ApiRestService;
import kr.co.soldesk.service.CustomUserDetailsService;
import kr.co.soldesk.service.HomeService;

@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	@Autowired
	private ApiRestService restService;
	
	@Autowired
	@Qualifier("userDetailsService")
	private CustomUserDetailsService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		CovidStatus covidStatusData = homeService.findRecentData();
		CovidStatus covidYesterDayData = homeService.findYesterDay();
		
		List<CityStatus> seoulData = restService.getSeoulData();
		
		int seoul = seoulData.get(0).getDefCnt()-seoulData.get(1).getDefCnt();
		
		System.out.println(seoul);
		
		
		List<Country> asiaCountryList = homeService.findCountryList("Asia");
		List<Country> eastCountryList = homeService.findCountryList("Middle East");
		List<Country> americaCountryList = homeService.findCountryList("America");
		List<Country> europeCountryList = homeService.findCountryList("Europe");
		List<Country> oceaniaCountryList = homeService.findCountryList("Oceania");
		List<Country> africaCountryList = homeService.findCountryList("Africa");
		
		Date now = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd E요일");
		String today = format1.format(now);
		
		model.addAttribute("seoul", seoul);
		model.addAttribute("now",today);
		model.addAttribute("active", "home");
		model.addAttribute("covidStatusData", covidStatusData);
		model.addAttribute("covidYesterDayData", covidYesterDayData);
		model.addAttribute("asiaCountryList", asiaCountryList);
		model.addAttribute("eastCountryList", eastCountryList);
		model.addAttribute("americaCountryList", americaCountryList);
		model.addAttribute("europeCountryList", europeCountryList);
		model.addAttribute("oceaniaCountryList", oceaniaCountryList);
		model.addAttribute("africaCountryList", africaCountryList);
		
		return "/home.do"; //이건 tiles.xml 보고 이해 해야합니다
	}
	
	@GetMapping(value= "/userInfo",produces="application/json; charset=utf8")
	@ResponseBody
	public List<Map<String,Object>> allUser() {
		
		List<Map<String,Object>> all = userService.findAllUser();
		
		return all;
	}
	
	@RequestMapping(value="/detailsData", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, List<Map<String,Object>>> detailsData() {
		
		List<Map<String,Object>> sexData = restService.getSexData();
		List<Map<String,Object>> areaData = restService.getAreaData();
		List<Map<String,Object>> ageData = restService.getAgeData();
		
		Map<String, List<Map<String,Object>>> detailsData = new HashMap<String, List<Map<String,Object>>>();
		detailsData.put("sexData",sexData);
		detailsData.put("areaData",areaData);
		detailsData.put("ageData",ageData);
		System.out.println(detailsData);
		return detailsData;
	}
	
}
