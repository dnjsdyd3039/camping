package com.camily.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.CampingDto;
import com.camily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService advc;
	
	// 관리자 캠핑장 목록 페이지
	@RequestMapping(value="/adminCamping")
	public ModelAndView adminCamping(String page){
		System.out.println("관리자 캠핑장 목록 페이지 이동 요청");
		ModelAndView mav = advc.getCampingList(page);
		
		return mav;
	}
	
	// 관리자 캠핑장 상태 변경
	@RequestMapping(value="/modifyCampingState")
	public @ResponseBody String modifyCampingState(String cacode, String castate){
		System.out.println("관리자 캠핑장 상태 변경 요청");
		
		String updateResult = advc.modifyCampingState(cacode,castate);
		
		return updateResult;
	}
	
	// 관리자 캠핑장 상세보기
	@RequestMapping(value="/adminCampingInfo")
	public ModelAndView adminCampingInfo(String cacode) {
		System.out.println("관리자 캠핑장 상세보기 요청");
		
		ModelAndView mav = advc.getCampingInfo(cacode);
		return mav;
	}
	
	// 관리자 캠핑장 정보수정
	@RequestMapping(value="/modifyCampingInfo")
	public ModelAndView modifyCampingInfo(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException{
		System.out.println("관리자 캠핑장 정보수정 요청");
		
		ModelAndView mav = advc.modifyCampingInfo(camping,ra);
		return mav;
	}
	
	// 관리자 캠핑장 등록 페이지 이동
	@RequestMapping(value="/adminCampingInsertPage")
	public String adminCampingInsertPage() {
		System.out.println("관리자 캠핑장 등록 페이지 이동요청");
		
		return "admin/AdminCampingInsert";
	}
	
	@RequestMapping(value="/adminCampingRegister")
	public ModelAndView adminCampingRegister(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("관리자 캠핑장 등록 요청");
		
		ModelAndView mav = advc.registerCamping(camping,ra);
		return mav;
	}
	
    

}
