package kr.co.soldesk.util;

import java.io.IOException;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.google.gson.Gson;

@Component
public class RestClient {

	private HttpHeaders headers;
	private RestTemplate restTemplate;
	private HttpEntity<String> entity;

	public RestClient() {
		this.headers = getJsonHeaders();
		this.restTemplate = new RestTemplate();
		this.restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
	}
	
	public RestClient(String type) {
	    if(type.equals("geocoding")) {
	      this.headers = getJsonGeoCodeHeaders();
	      this.restTemplate = new RestTemplate();
	      this.restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
	    }
	}

	public <T> T call(HttpMethod httpMethod, String url, String jsonBody, Class<T> responseType) {

		entity = new HttpEntity<String>(jsonBody, headers);
		ResponseEntity<String> response = restTemplate.exchange(

				url, httpMethod, null, String.class);
		Gson gson = new Gson();
		//System.out.println(response.getBody());
		return gson.fromJson(response.getBody(), responseType);

	}
	
	public <T> T callInsertLatLng(HttpMethod httpMethod, String url, String jsonBody, Class<T> responseType) {
	    entity = new HttpEntity<String>(jsonBody, headers);
	    ResponseEntity<String> response = restTemplate.exchange(
	        url,
	        httpMethod,
	        entity,
	        String.class);

	    Gson gson = new Gson();
	    return gson.fromJson(response.getBody(), responseType);
	  }

	public <T>Object parser(String url, Class<T> responseType) {

		ResponseEntity<String> response1 = restTemplate.exchange(url, HttpMethod.GET, null, String.class);
		//System.out.println(response1.getBody());

		ObjectMapper xmlMapper = new XmlMapper();
		Object response = null;
		try {
			response = xmlMapper.readValue(response1.getBody(), responseType);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(response);
		
		return response;

	}

	private HttpHeaders getJsonHeaders() {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Accept", MediaType.APPLICATION_JSON_VALUE);

		return headers;

	}
	
	 private HttpHeaders getJsonGeoCodeHeaders() {
		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);
		    headers.set("Accept", MediaType.APPLICATION_JSON_VALUE);
		    headers.set("X-NCP-APIGW-API-KEY-ID", "fjpe07eakb");
		    headers.set("X-NCP-APIGW-API-KEY", "ikysRTPv9lL3ofMuOTuuOwQWwVU8IEQHbiAqMCd5");

		    return headers;
	  }

}
