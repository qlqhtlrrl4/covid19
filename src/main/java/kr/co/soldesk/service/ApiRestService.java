package kr.co.soldesk.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import kr.co.soldesk.data.CityResponse;
import kr.co.soldesk.data.CovidHospitalData;
import kr.co.soldesk.data.CovidStatusResponse;
import kr.co.soldesk.data.GubunResponse;
import kr.co.soldesk.data.VaccinationStatus;
import kr.co.soldesk.model.CityStatus;
import kr.co.soldesk.model.CovidGubun;
import kr.co.soldesk.model.CovidStatus;
import kr.co.soldesk.model.Covidhospital;
import kr.co.soldesk.model.GeoCodingResult;
import kr.co.soldesk.model.GeoCodingResultLatLng;
import kr.co.soldesk.model.Vaccination;
import kr.co.soldesk.repository.CityStatusRepository;
import kr.co.soldesk.repository.CovidGubunRepository;
import kr.co.soldesk.repository.CovidHospitalRepository;
import kr.co.soldesk.repository.CovidStatusRepository;
import kr.co.soldesk.repository.VaccinRepository;
import kr.co.soldesk.util.RestClient;
import lombok.extern.slf4j.Slf4j;
import redis.clients.jedis.GeoRadiusResponse;
import redis.clients.jedis.GeoUnit;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.params.geo.GeoRadiusParam;

@Service
@PropertySource("classpath:db/props/application.properties")
@Slf4j
public class ApiRestService {

	@Autowired
	private CovidHospitalRepository covidRepository;

	@Autowired
	private VaccinRepository vaccinRepository;

	@Autowired
	private CovidStatusRepository covidStatusRepository;
	
	@Autowired
	private CovidGubunRepository covidGubunRepository;
	
	@Autowired
	private CityStatusRepository cityStatusRepository;

	private List<Covidhospital> covidList;
	private List<Vaccination> vaccinList;
	private List<CovidStatus> itemList;
	private List<CovidGubun> gubunList;
	private List<CityStatus> cityList;

	@Value("${api.covidHospitalKey}")
	private String covidHospitalKey;

	@Value("${api.covidstatusKey}")
	private String covidstatusKey;

	@Value("${api.vaccinationKey}")
	private String vaccinationKey;
	
	@Value("${api.covidGubunKey}")
	private String gubunKey;
	
	@Value("${api.cityStatusKey}")
	private String cityStatusKey;

	private Date date = new Date();

	private static final Logger logger = LoggerFactory.getLogger(ApiRestService.class);
	private static final String apiRestServiceTag = "------------------[[apiRestServiceTag]]-----------------";
	private static final String redisGeoKey = "hospital";
	
	public void callApi() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

		String nowDate = dateFormat.format(date);

		logger.debug(apiRestServiceTag + "callApi");

		if (covidList == null) {
			covidList = new ArrayList<>();
		}

		if (vaccinList == null) {
			vaccinList = new ArrayList<>();
		}

		if (itemList == null) {
			itemList = new ArrayList<>();
		}
		
		if(gubunList == null) {
			gubunList = new ArrayList<>();
		}
		
		if(cityList == null) {
			cityList = new ArrayList<>();
		}

		CovidHospitalData result = null;
		VaccinationStatus result2 = null;
		CovidStatusResponse parseResult = null;
		GubunResponse gubunResult = null;
		CityResponse cityResult = null;
		

		RestClient restClient = new RestClient();

		JSONObject jsonObject = new JSONObject();

		String hospitalUrl = covidHospitalKey;
		String vaccinUrl = vaccinationKey;
		String covidStatus = covidstatusKey + nowDate;
		String gubunUrl = gubunKey+ nowDate;
		String cityUrl = cityStatusKey+nowDate;

		result = restClient.call(HttpMethod.GET, hospitalUrl, jsonObject.toString(), CovidHospitalData.class);
		result2 = restClient.call(HttpMethod.GET, vaccinUrl, jsonObject.toString(), VaccinationStatus.class);
		parseResult = (CovidStatusResponse) restClient.parser(covidStatus,CovidStatusResponse.class);
		gubunResult = (GubunResponse) restClient.parser(gubunUrl,GubunResponse.class);
		cityResult = (CityResponse) restClient.parser(cityUrl, CityResponse.class);
		
		
		if (covidList != null) {
			covidRepository.deleteAll();
		}

		if (vaccinList != null) {
			vaccinRepository.deleteAll();
		}

		if (itemList != null) {
			covidStatusRepository.deleteAll();
		}
		
		if(gubunList != null) {
			covidGubunRepository.deleteAll();
		}
		
		if(cityList != null) {
			cityStatusRepository.deleteAll();
		}

		for (int i = 0; i < result.getData().size(); i++) {
			covidList.add(result.getData().get(i));
		}

		for (int i = 0; i < result2.getData().size(); i++) {
			vaccinList.add(result2.getData().get(i));
		}

		for (int i = 0; i < parseResult.getBody().getItems().size(); i++) {
			itemList.add(parseResult.getBody().getItems().get((parseResult.getBody().getItems().size() - 1) - i));

		}
		
		for(int i=0;i<cityResult.getBody().getItems().size();i++) {
			cityList.add(cityResult.getBody().getItems().get(i));
		}
		
		for(int i=0; i<gubunResult.getBody().getItems().size();i++) {
			gubunList.add(gubunResult.getBody().getItems().get((gubunResult.getBody().getItems().size()-1)-i));
		}

		logger.debug(apiRestServiceTag + "CovidData saveAll Start");
		covidRepository.saveAll(covidList);
		logger.debug(apiRestServiceTag + "CovidData saveAllEnd");
		
		logger.debug(apiRestServiceTag + "vaccinationData saveAll Start");
		vaccinRepository.saveAll(vaccinList);
		logger.debug(apiRestServiceTag + "vaccinationData saveAll End");

		logger.debug(apiRestServiceTag + "covidStatusData saveAll Start");
		covidStatusRepository.saveAll(itemList);
		logger.debug(apiRestServiceTag + "covidStatusData saveAll End");
		
		logger.debug(apiRestServiceTag + "covidGubunRepository saveAll Start");
		covidGubunRepository.saveAll(gubunList);
		logger.debug(apiRestServiceTag + "covidGubunRepository saveAll End");

		logger.debug(apiRestServiceTag + "cityStatusRepository saveAll Start");
		cityStatusRepository.saveAll(cityList);
		logger.debug(apiRestServiceTag + "cityStatusRepository saveAll End");
		
	}

	public List<Map<String, Object>> getVaccinData() {

		return vaccinRepository.findFirstChart();
	}

	public List<CovidStatus> getStatusData() {
		// TODO Auto-generated method stub
		return covidStatusRepository.findAll();
	}

	public List<Map<String, Object>> getLeastDay() {

		
		return covidStatusRepository.leastDayData();
	}

	public List<CovidStatus> getLeastDayData() {
		// TODO Auto-generated method stub
		return covidStatusRepository.leastDayFullData();
	}
	
	public List<CovidStatus> getLeastTwoDay() {
		return covidStatusRepository.leastTwoDay();
	}
	
	public List<Map<String,Object>> getGenderData(){
		return covidGubunRepository.genderData();
	}

	public List<Map<String,Object>> getRangeAge() {
		return covidGubunRepository.rangeAgeData();
	}

	public List<CityStatus> getCityData() {
		
		return cityStatusRepository.currentCityData();
	}
	
	public Vaccination getRecentVaccinationData() {
		return vaccinRepository.recentVaccineData();
	}
	
	public List<Map<String, Object>> getRecentCovidStatutsData(){
		return covidStatusRepository.getRecentCovidStatutsData();
	}
	
	public void insertLatLng() {
		
		List<Covidhospital> covidhospitalList = covidRepository.findAll();
		RestClient restClient = new RestClient("geocoding");
		JSONObject jsonObject = new JSONObject();
		GeoCodingResult geoCodingResult = new GeoCodingResult();
		for(Covidhospital covidhospital : covidhospitalList) {
			try {
				String addr = covidhospital.getOrgZipaddr();
				String url = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr;
				geoCodingResult = restClient.callInsertLatLng(HttpMethod.GET, url, jsonObject.toString(), GeoCodingResult.class);
				GeoCodingResultLatLng geoCodingResultLatLng = geoCodingResult.getAddresses().get(0);
				System.out.println(geoCodingResultLatLng.getX());
				System.out.println(geoCodingResultLatLng.getY());
				System.out.println(Integer.toString(covidhospital.getId()));
				covidRepository.updateLatLng(geoCodingResultLatLng.getY(), geoCodingResultLatLng.getX(), Integer.toString(covidhospital.getId()));
			} catch (Exception e) {
				continue;
			}
		}
	}

	public List<Map<String, Object>> getTodayVaccineData() {
		
		return vaccinRepository.todayVaccineData();
	}

	public List<Map<String, Object>> getDayLocationData() {
		
		return vaccinRepository.locationDayData();
	}

	public List<Map<String, Object>> getWeekLocationeData() {
		
		return vaccinRepository.locationWeekData();

	}
	
	public List<Map<String,Object>> getMonthLocationData() {
		
		return vaccinRepository.locationMonthData();
	}

	public List<CityStatus> getLocationData() {
		
		return cityStatusRepository.locationData();
	}

	public void insertLatLngToRedis() {
		Jedis jedis = new Jedis("localhost");
		List<Map<String, String>> latLngList = covidRepository.findAllLatLngNotNull();

		for(Map<String, String> latLngMap : latLngList) {
//			double lng = (double) latLngMap.get("lng");
//			double lat = (double) latLngMap.get("lat");
			double lng = Double.parseDouble(latLngMap.get("lng"));
			double lat = Double.parseDouble(latLngMap.get("lat"));
			String orgnm = (String) latLngMap.get("orgnm");

			jedis.geoadd(redisGeoKey, lng, lat, orgnm);
		}
		System.out.println("complete");
	}
	
	public List<GeoRadiusResponse> getGeoRadius1km(double lng, double lat) {
		Jedis jedis = new Jedis("localhost");
		GeoRadiusParam geoRadiusParam = GeoRadiusParam.geoRadiusParam().withCoord();

		List<GeoRadiusResponse> geoRadiusResponseList = jedis.georadius(redisGeoKey, lng, lat, 1, GeoUnit.KM, geoRadiusParam);


		return geoRadiusResponseList;
	}

	/*public CityStatus getTodayCityData() {
		
		return cityStatusRepository.todayData();
	}

	public CityStatus getYesterDayCityData() {
		// TODO Auto-generated method stub
		return cityStatusRepository.yesterDayData();
	}*/

}
