package com.camily.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.service.CampingShopService;


@Controller
public class CampingShopController {
	
	@Autowired
	CampingShopService csvc;
	
    // 캠핑 용품 페이지 이동 요청
	@RequestMapping(value="/campingShopPage")
	public ModelAndView CampingShopPage() {
		System.out.println("campingShopPage 페이지 이동요청");
		
		ModelAndView mav = csvc.campingShopPage();	
		
		return mav;
	}
	
	// 캠핑 용품 상세 페이지 이동 요청
	@RequestMapping(value="/campingDetailPage")
	public ModelAndView campingDetailPage(String gcode) {
	    System.out.println("campingDetailPage 페이지 이동요청");
	 	
		ModelAndView mav = csvc.campingDetailPage(gcode);	
		
		return mav;		
	}
	
	// 캠핑 용품 구매 페이지 이동 요청
	@RequestMapping(value="/campingpurchase")
	public ModelAndView campingpurchase(String gcode, String gamount) {
		System.out.println("gcode :"+gcode);
		System.out.println("gamount :"+gamount);
		
        ModelAndView mav = csvc.campingpurchase(gcode,gamount);	
        
		return mav;
	}
	
	// 캠핑 용품 구매하기 
	@RequestMapping(value="/goodsPurchase")
	public ModelAndView goodsPurchase(RedirectAttributes ra, String loginId, String addr,String gogcode,
			String gamount, String totalPrice, String gname, String gimage) {
		System.out.println("loginId :"+ loginId);
		System.out.println("addr :"+ addr);
		System.out.println("gogcode :"+ gogcode);
		System.out.println("gamount :"+ gamount);
		System.out.println("totalPrice :"+ totalPrice);
		System.out.println("gname :"+ gname);
		System.out.println("gimage :"+ gimage);
		
		// 서비스 이동 아이디부터 이미지 까지
		ModelAndView mav = csvc.goodsPurchase(ra,loginId,addr,gogcode,gamount,totalPrice
				,gname,gimage);	
	        
		return mav;
	}
	
	// 구매내역 페이지 이동
	@RequestMapping(value="/CampingPurchaseListPage")
	public ModelAndView CampingPurchaseListPage() {
		System.out.println("구매내역 페이지 이동요청");
	    
		// 서비스 이동 구매내역 페이지
		ModelAndView mav = csvc.CampingPurchaseListPage();
		
		return mav;
		
	}
	
	// 장바구니 클릭 state값 증가 ajax
	@RequestMapping(value="/cartInsert")
	public @ResponseBody String cartInsert(String gcode) {
		System.out.println("gcode :"+ gcode);
		
		// 장바구니 서비스 이동 
		String cartInsert = csvc.cartInsert(gcode);
		
		return cartInsert;
	}
	
}
