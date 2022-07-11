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
	public ModelAndView campingpurchase(RedirectAttributes ra, String gcode, String gamount) {
		System.out.println("gcode :"+gcode);
		System.out.println("gamount :"+gamount);
		
        ModelAndView mav = csvc.campingpurchase(ra,gcode,gamount);	
        
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
	
	//  찜클릭 state값 증가 ajax
	@RequestMapping(value="/cartInsert")
	public @ResponseBody String cartInsert(String gcode) {
		System.out.println("gcode :"+ gcode);
		
		// 장바구니 서비스 이동 
		String cartInsert = csvc.cartInsert(gcode);
		
		return cartInsert;
	}
	
	// 찜클릭 select ajax
	@RequestMapping(value= "/cartselect")
	public @ResponseBody String cartselect(String loginId) {
		System.out.println("loginId : "+ loginId);
		
		// 장바구니 select 서비스 이동
		String cartselect = csvc.cartselect(loginId);
		System.out.println("cartselect :"+cartselect);
		return cartselect;
	}
	
	// 장바구니 클릭 장바구니에추가!
	@RequestMapping(value="/shoppingbasket")
	public ModelAndView shoppingbasket(RedirectAttributes ra,
			String dicode, String diname, String diimage, String diamount, String diprice) {
		
		System.out.println("dicode :"+ dicode);
		System.out.println("diname :"+ diname);
		System.out.println("diimage :"+ diimage);
		System.out.println("diamount :"+ diamount);
		System.out.println("diprice :"+ diprice);
		
		// 서비스 이동 구매내역 페이지
	    ModelAndView mav = csvc.shoppingbasket(ra,dicode,diname,diimage,diamount,diprice);
		
		return mav;		
	}	
	
	// 장바구니 목록 페이지 출력 
	@RequestMapping(value="/detailinformation")
	public ModelAndView detailinformation(RedirectAttributes ra) {
		
		// 장바구니 서비스 이동 페이지
	    ModelAndView mav = csvc.detailinformation(ra);
		
	    return mav;
	}
	
	// 장바구니 들어 있는 모든값 insert
	@RequestMapping(value="/totalpurchase")
	public ModelAndView totalpurchase(RedirectAttributes ra, String dimid, String diaddr,
			String dicode, String diamount, String ditotalprice, String diname, String diimage) {
		
		System.out.println("dimid :"+ dimid);
		System.out.println("diaddr :"+ diaddr);
		System.out.println("dicode :"+ dicode);
		System.out.println("diamount :"+ diamount);
		System.out.println("ditotalprice :"+ ditotalprice);
		System.out.println("diname :"+ diname);
		System.out.println("diimage :"+ diimage);
		
		// 장바구니 모든 값 insert 서비스 이동 
	    ModelAndView mav = csvc.totalpurchase(ra,dimid,diaddr,dicode,diamount,ditotalprice,diname,diimage);
		
	    return mav;
	}
	
	// 장바구니 삭제
	@RequestMapping(value= "/deletepoket")
	public ModelAndView deletepoket(RedirectAttributes ra, String dicode) {
		System.out.println("dicode : "+ dicode);
		
		// 장바구니 select 서비스 이동
        ModelAndView mav = csvc.deletepoket(ra,dicode);
		
	    return mav;
	}
	
	// 구매목록 삭제하기 ajax
	@RequestMapping(value="/deleteph")
	public @ResponseBody String deleteph(String gocode) {
        System.out.println("gocode :"+ gocode);
		
		// 구매목록 삭제하기 서비스 이동
        String deleteph = csvc.deleteph(gocode);
        System.out.println("deleteph: "+ deleteph);
        
        return deleteph;
	}
}
