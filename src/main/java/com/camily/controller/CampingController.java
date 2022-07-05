package com.camily.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dto.CampingDto;
import com.camily.dto.ItemDto;
import com.camily.service.CampingService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class CampingController {

	@Autowired
	private CampingService csvc;
	
	// 캠핑장 목록 페이지 이동 
	@RequestMapping(value = "campingList")
	public ModelAndView campingList(@Param("page") String page) {
		System.out.println("캠핑장 목록 페이지 이동");
		ModelAndView mav = csvc.campingList(page);
		return mav;
	}
	
	@RequestMapping(value = "campingView")
	public ModelAndView campingView(@Param("cacode") String cacode) {
		System.out.println("캠핑장 상세 페이지 이동");
		ModelAndView mav = csvc.campingView(cacode);
		System.out.println("cacode : " + cacode);
		return mav;
	}
	
	@RequestMapping(value = "campingListInput")
	public String campingListInput() throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=HHqHDol0pIFgKcLgUkwyftEkn9KdQG%2B9Dk1rBIaCnh6pH1zG4a3salpnlKSQdZisTR9vUvkb1HUQGsE26bdytw%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*&_type=json*/
		System.out.println(urlBuilder.toString());
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
		Gson gson = new Gson();
		
		JsonObject jobj = (JsonObject) JsonParser.parseString(sb.toString());
		System.out.println("총합 캠핑장 수 : "+jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsInt());	// 총합 캠핑장 개수
		int repeatNum = jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsInt() / 100;
		if(jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsInt() % 100 != 0) {
			repeatNum++;
		}
//		System.out.println(jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject());
		JsonArray jobj_items = jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item").getAsJsonArray();	// 캠핑장 10개 object
		System.out.println("한 페이지에 존재하는 수 : " + jobj_items.size());
		int count = 1;
		ArrayList<CampingDto> campingList = new ArrayList<CampingDto>();
		CampingDto campingInfo = null;
		for(int r = 0; r < repeatNum; r++) {
			for(int i = 0; i < jobj_items.size(); i++) {
				if(jobj_items.get(i).getAsJsonObject().get("induty") != null && jobj_items.get(i).getAsJsonObject().get("intro") != null && jobj_items.get(i).getAsJsonObject().get("lineIntro") != null && jobj_items.get(i).getAsJsonObject().get("sbrsCl") !=null && jobj_items.get(i).getAsJsonObject().get("firstImageUrl") != null) {
					campingInfo = new CampingDto();
					System.out.println("["+count+"] 번째");
					// 캠핑장 이름
					System.out.println("캠핑장 이름 : " + jobj_items.get(i).getAsJsonObject().get("facltNm").getAsString());			
					campingInfo.setCaname(jobj_items.get(i).getAsJsonObject().get("facltNm").getAsString());
					// 캠핑장 위도
					System.out.println("캠핑장 위도 : " + jobj_items.get(i).getAsJsonObject().get("mapY").getAsString());			
					campingInfo.setCalatitude(jobj_items.get(i).getAsJsonObject().get("mapY").getAsString());
					// 캠핑장 경도
					System.out.println("캠핑장 경도 : " + jobj_items.get(i).getAsJsonObject().get("mapX").getAsString());			
					campingInfo.setCalongitude(jobj_items.get(i).getAsJsonObject().get("mapX").getAsString());
					// 캠핑장 타입
					System.out.println("캠핑장 타입 : " + jobj_items.get(i).getAsJsonObject().get("induty").getAsString());			
					campingInfo.setCatype(jobj_items.get(i).getAsJsonObject().get("induty").getAsString());
					// 캠핑장 소개	
					System.out.println("캠핑장 소개 : " + jobj_items.get(i).getAsJsonObject().get("intro").getAsString());				
					campingInfo.setCacontents(jobj_items.get(i).getAsJsonObject().get("intro").getAsString());
					// 캠핑장 한줄소개
					System.out.println("캠핑장 한 줄 소개 : "+ jobj_items.get(i).getAsJsonObject().get("lineIntro").getAsString());	
					campingInfo.setCalinecontents(jobj_items.get(i).getAsJsonObject().get("lineIntro").getAsString());
					// 캠핑장 부대시설정보
					System.out.println("캠핑장 부대시설정보 : " + jobj_items.get(i).getAsJsonObject().get("sbrsCl").getAsString());		
					campingInfo.setCainfo(jobj_items.get(i).getAsJsonObject().get("sbrsCl").getAsString());
					// 캠핑장 사진	
					System.out.println("캠핑장 사진 : " + jobj_items.get(i).getAsJsonObject().get("firstImageUrl").getAsString());		
					campingInfo.setCaimage(jobj_items.get(i).getAsJsonObject().get("firstImageUrl").getAsString());
					System.out.println("==================================================");
					count++;
					campingList.add(campingInfo);
				}
			}	
		}
		System.out.println("campingList.size() : " + campingList.size());
		
		csvc.campingListInput(campingList);
		
		return "camping/CampingList";
	}
	/*
	@RequestMapping("campingReservation")
	public String campingReservation(String dates, String type, String people) {
		System.out.println("캠핑장 예매페이지 이동");
		System.out.println("dates : " + dates);
		System.out.println("type : " + type);
		System.out.println("people : " + people);
		return "camping/CampingReservation";
	}
	*/
	
	@RequestMapping(value = "checkRoomType")
	public @ResponseBody String checkRoomType(String cacode, String startday, String endday) {
		System.out.println("예매가능 캠핑장 타입 ajax");
		
		return null;
	}
	
}
