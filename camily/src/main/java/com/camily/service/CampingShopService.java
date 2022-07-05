package com.camily.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dao.CampingShopDao;
import com.camily.dto.CampingShopDto;

@Service
public class CampingShopService {
    
	@Autowired
	private CampingShopDao cdao;
	
	ArrayList<CampingShopDto> cgvMvList = new ArrayList<CampingShopDto>();
	// 캠핑 용품 이동 페이지
	public ModelAndView campingShopPage() {
		System.out.println("campingShopPage.CampingShopPage() 호출");
		
		
		
		ModelAndView mav = new ModelAndView();
		
		// SELECT 캠핑 용품 
		ArrayList<CampingShopDto> campingShop = cdao.campingShop();
		
		mav.addObject("campingShop", campingShop);
		mav.setViewName("campingshop/CampingShopPage");
				
		return mav;
	}
	
	// 캠핑 용품 상세 페이지
	public ModelAndView campingDetailPage(String gcode) {
		System.out.println("CampingShopService.campingDetailPage() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		CampingShopDto campingDetail = cdao.campingDetail(gcode);
		
		mav.addObject("campingDetail", campingDetail);
		mav.setViewName("campingshop/CampingDetailPage");
		
		return mav;
	}
    
	// 캠핑 구매 요청 페이지 이동요청
	public ModelAndView campingpurchase(String gcode, String gamount) {
		System.out.println("CampingShopService.campingpurchase() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		CampingShopDto campingpurchase = cdao.campingpurchase(gcode);
		campingpurchase.setGamount(gamount); // 상품 갯수 추가
		int price = Integer.parseInt(campingpurchase.getGprice().replace(",", "")); // 1,890,000
		int total = price * Integer.parseInt(gamount);
		
		mav.addObject("campingpurchase", campingpurchase);
		mav.addObject("totalPrice", total);
				
		mav.setViewName("campingshop/CampingPurchase");
		
		return mav;
	}
	
	
	
   
	
}



















