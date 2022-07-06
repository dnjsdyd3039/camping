package com.camily.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dao.CampingDao;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.PageDto;
import com.camily.dto.ReservationDto;
import com.google.gson.Gson;

@Service
public class CampingService {

	@Autowired
	private CampingDao cdao;
	
	public void campingListInput(ArrayList<CampingDto> campingList) {
		System.out.println("CampingService.campingListInput() 호출");
		for(int i = 0; i<campingList.size(); i++) {
			String maxCacode = cdao.getMaxCacode();
			String caCode = "";
			if(maxCacode == null) {
				caCode = "CA0001";
			}else {
				int intMaxCacode = Integer.parseInt(maxCacode.substring(2)) + 1;
				if(intMaxCacode < 10) {
					caCode = "CA000" + intMaxCacode;
				}else if(intMaxCacode < 100){
					caCode = "CA00" + intMaxCacode;
				}else if(intMaxCacode <1000) {
					caCode = "CA0" + intMaxCacode;
				}else if(intMaxCacode < 10000){
					caCode = "CA" + intMaxCacode;
				}else {
					System.out.println("범위 초과");
				}
			}
			System.out.println(caCode);
			campingList.get(i)	.setCacode(caCode);
			campingList.get(i).setCaprice("준비중");
			cdao.campingListInput(campingList.get(i));			
		}
		
	}

	public ModelAndView campingList(String page) {
		System.out.println("CampingService.campingList() 호출");
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
		int campTotalCount = cdao.getCampTotalCount();
		
		int pageCount = 20;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campTotalCount) {
			endRow = campTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<CampingDto> campingList = cdao.getCampingList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)campTotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("campingList", campingList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("camping/CampingList");
		return mav;
	}

	public ModelAndView campingView(String cacode) {
		System.out.println("CampingService.campingView() 호출");
		ModelAndView mav = new ModelAndView();
		CampingDto campingInfo = cdao.campingView(cacode);
		System.out.println(campingInfo);
		ArrayList<CampingRoomDto> campingRoomTypeList = cdao.campingRoomTypeList(cacode);
		ArrayList<CampingRoomDto> campingRoomList = cdao.campingRoomList(cacode);
		System.out.println(campingRoomList);
		mav.addObject("campingInfo", campingInfo);
		mav.addObject("campingRoomList", campingRoomList);
		mav.addObject("campingRoomTypeList", campingRoomTypeList);
		mav.setViewName("camping/CampingView");
		return mav;
	}
/*
	public String checkRoomType(String cacode, String startday, String endday) {
		System.out.println("CampingService.checkRoomType() 호출");
		Gson gson = new Gson();
		ArrayList<CampingRoomDto> roomType = cdao.campingRoomList(cacode);
		ArrayList<ReservationDto> reserveType = cdao.getReserveList(cacode, startday, endday);
		for (int i = 0; i < roomType.size(); i++) {
			for (int j = 0; j < reserveType.size();j++) {
				if (roomType[i])
			}
		}
		
		return null;
	}
*/
	
	
}
