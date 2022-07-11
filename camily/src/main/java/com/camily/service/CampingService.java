package com.camily.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dao.CampingDao;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.MemberDto;
import com.camily.dto.PageDto;
import com.camily.dto.ReservationDto;
import com.google.gson.Gson;

@Service
public class CampingService {

	@Autowired
	private CampingDao cdao;
	
	@Autowired
	private HttpSession session;
	
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

	public String checkRoomType(String cacode, String startday, String endday) {
		System.out.println("CampingService.checkRoomType() 호출");
		Gson gson = new Gson();
		ArrayList<CampingRoomDto> roomType = cdao.campingRoomList(cacode);
		ArrayList<ReservationDto> reserveType = cdao.getReserveList(cacode, startday, endday);
		for (int i = 0; i < roomType.size(); i++) {
			for (int j = 0; j < reserveType.size();j++) {
				if (roomType.get(i).getCrname().equals(reserveType.get(j).getRecrname()) && roomType.get(i).getCrnum().equals(reserveType.get(j).getRecrnum())) {
					roomType.remove(i);
				}
			}
		}
		System.out.println(roomType);
		String roomType_json = gson.toJson(roomType);
		return roomType_json;
	}
	
	public ModelAndView campingReservationPage(String cacode, String startday, String endday, String roomSel, String numSel, int people) {
		System.out.println("CampingService.campingReservationPage() 호출");
		ModelAndView mav = new ModelAndView();
		CampingDto campingInfo = cdao.campingView(cacode);
		CampingRoomDto RoomInfo = new CampingRoomDto();
		RoomInfo = cdao.getRoomInfo(cacode, roomSel, numSel);
		mav.addObject("cacode", cacode);
		mav.addObject("caname", campingInfo.getCaname());
		mav.addObject("RoomInfo", RoomInfo);
		startday = startday.substring(6,10) + "-" + startday.substring(0,2) + "-" + startday.substring(3,5);
		mav.addObject("startday", startday);
		endday = endday.substring(6,10) + "-" + endday.substring(0,2) + "-" + endday.substring(3,5);
		mav.addObject("endday", endday);
		int totalPrice = 0;
		for (LocalDate date = LocalDate.of(Integer.parseInt(startday.substring(0,4)), Integer.parseInt(startday.substring(5,7)), Integer.parseInt(startday.substring(8,10))); date.isBefore(LocalDate.of(Integer.parseInt(endday.substring(0,4)), Integer.parseInt(endday.substring(5,7)), Integer.parseInt(endday.substring(8,10)))); date = date.plusDays(1)) {
			DayOfWeek dayOfWeek = date.getDayOfWeek();
			int dayOfWeekNumber = dayOfWeek.getValue();
			System.out.println(date);
			System.out.println(dayOfWeekNumber);
			if(dayOfWeekNumber == 5 || dayOfWeekNumber == 6) {
				totalPrice += Integer.parseInt(RoomInfo.getCrprice())  * 1.2;
			}else {
				totalPrice += Integer.parseInt(RoomInfo.getCrprice());				
			}
		}
		System.out.println(totalPrice);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("people", people);
		mav.setViewName("camping/CampingReservation");
		return mav;
	}
	
	public ModelAndView campingReservation(String recacode, String remid, String recrname, String recrnum, String startday, String endday, int repeople, String remtel, String rememail, String rerequest) {
		System.out.println("CampingService.campingReservation() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId : " + loginId);
		ReservationDto reservationInfo = new ReservationDto();
		for (LocalDate date = LocalDate.of(Integer.parseInt(startday.substring(0,4)), Integer.parseInt(startday.substring(5,7)), Integer.parseInt(startday.substring(8,10))); date.isBefore(LocalDate.of(Integer.parseInt(endday.substring(0,4)), Integer.parseInt(endday.substring(5,7)), Integer.parseInt(endday.substring(8,10)))); date = date.plusDays(1)) {
			String maxRecode = cdao.getmaxrecode();
			String reCode = "";
			if(maxRecode == null) {
				reCode = "RE001";
			}else {
				int intMaxRecode = Integer.parseInt(maxRecode.substring(2)) + 1;
				if(intMaxRecode < 10) {
					reCode = "RE00" + intMaxRecode;
				}else if(intMaxRecode < 100){
					reCode = "RE0" + intMaxRecode;
				}else if(intMaxRecode <1000) {
					reCode = "RE" + intMaxRecode;
				}else {
					System.out.println("범위 초과");
				}
			}
			reservationInfo.setRecode(reCode);
			reservationInfo.setRecacode(recacode);
			reservationInfo.setRemid(loginId);
			reservationInfo.setRepeople(repeople);
			reservationInfo.setRecrname(recrname);
			reservationInfo.setRecrnum(recrnum);
			reservationInfo.setRemid(remid);
			reservationInfo.setRemtel(remtel);
			reservationInfo.setRerequest(rerequest);
			System.out.println(date.toString());
			
			reservationInfo.setReday(date.toString());
			System.out.println(reservationInfo);
			
		}
		return null;
	}

	// 내정보 불러오기 >> 회원가입쪽과 비교해서 같은 함수 존재시 제거?
	public String getMyInfo(String loginId) {
		System.out.println("CampingService.campingReservation() 호출");
		MemberDto memberInfo = cdao.getMyInfo(loginId);
		Gson gson = new Gson();
		String myInfo_json = gson.toJson(memberInfo);
		return myInfo_json;
	}
	
}
