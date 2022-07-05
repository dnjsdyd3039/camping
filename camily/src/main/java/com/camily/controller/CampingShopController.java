package com.camily.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camily.service.CampingShopService;


@Controller
public class CampingShopController {
	
	@Autowired
	CampingShopService csvc;
	
    // 캠핑용품 페이지 이동 요청
	@RequestMapping(value="/campingShopPage")
	public ModelAndView CampingShopPage() {
		System.out.println("campingShopPage 페이지 이동요청");
		
		ModelAndView mav = csvc.campingShopPage();	
		
		return mav;
	}
	
	// 캠핑용품 상세 페이지 이동 요청
	@RequestMapping(value="/campingDetailPage")
	public ModelAndView campingDetailPage(String gcode) {
	    System.out.println("campingDetailPage 페이지 이동요청");
	 	
		ModelAndView mav = csvc.campingDetailPage(gcode);	
		
		return mav;		
	}
	
	// 캠핑용품 구매 페이지 이동 요청
	@RequestMapping(value="/	")
	public ModelAndView campingpurchase(String gcode, String gamount) {
		System.out.println("gcode :"+gcode);
		System.out.println("gamount :"+gamount);
		
        ModelAndView mav = csvc.campingpurchase(gcode,gamount);	
        
		return mav;
	}
}
