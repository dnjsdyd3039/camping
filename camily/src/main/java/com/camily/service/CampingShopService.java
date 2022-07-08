package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.CampingShopDao;
import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;
import com.camily.dto.MemberDto;

@Service
public class CampingShopService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CampingShopDao cdao;
	
	ArrayList<GoodsDto> cgvMvList = new ArrayList<GoodsDto>();
	// 캠핑 용품 이동 페이지
	public ModelAndView campingShopPage() {
		System.out.println("campingShopPage.CampingShopPage() 호출");	
		ModelAndView mav = new ModelAndView();
		
		// SELECT 캠핑 용품 
		ArrayList<GoodsDto> campingShop = cdao.campingShop();
		
	    session.setAttribute("shopList", campingShop);
		mav.addObject("campingShop", campingShop);
		mav.setViewName("campingshop/CampingShopPage");	
		return mav;
	}
	
	// 캠핑 용품 상세 페이지
	public ModelAndView campingDetailPage(String gcode) {
		System.out.println("CampingShopService.campingDetailPage() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		GoodsDto campingDetail = cdao.campingDetail(gcode);
		
		mav.addObject("campingDetail", campingDetail);
		mav.setViewName("campingshop/CampingDetailPage");
		
		return mav;
	}
    
	// 캠핑 구매 요청 페이지 이동요청
	public ModelAndView campingpurchase(String gcode, String gamount) {
		System.out.println("CampingShopService.campingpurchase() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		GoodsDto campingpurchase = cdao.campingpurchase(gcode);
		campingpurchase.setGamount(gamount); // 상품 갯수 추가
		int price = Integer.parseInt(campingpurchase.getGprice().replace(",", "")); // 1,890,000
		int total = price * Integer.parseInt(gamount);
		
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId :"+ loginId);
		
		MemberDto addselect = cdao.addselect(loginId);  // 세션 아이디를 이용해서 주소 찾기
		System.out.println("addselect :"+ addselect);
		
		//주소 분리 (우편번호, 주소, 상세주소, 참고주소)
		String maddress = addselect.getMaddr();
		
		if( maddress != null) {
			String[] maddress_arr = maddress.split("_");
			System.out.println(maddress_arr.length);
			String addr = "";
			for(int i = 0; i<maddress_arr.length; i++) {
				if(i == 0) {
					addr += "("+maddress_arr[i]+")";
				}else {
					addr += " " + maddress_arr[i];
				}
			}
			System.out.println("addr : " + addr);
			addselect.setMaddr(addr);
			/*
			if( maddress_arr.length >= 4 ) {
				System.out.println("("+maddress_arr[0]+") "+ maddress_arr[1] + " " + maddress_arr[2] + "maddress_arr[3]");
				addselect.setMaddress("("+maddress_arr[0]+") "+ maddress_arr[1] + " " + maddress_arr[2] + "maddress_arr[3]");
				addselect.setMpostcode(maddress_arr[0]);
				addselect.setMaddr(maddress_arr[1]);
				addselect.setMdetailAddr(maddress_arr[2]);
				addselect.setMextraAddr(maddress_arr[3]);
			}
			 */
		}
		
		mav.addObject("addselect", addselect);
		mav.addObject("campingpurchase", campingpurchase);
		mav.addObject("totalPrice", total);
				
		mav.setViewName("campingshop/CampingPurchase");
		
		return mav;
	}
    
	// 캠핑 용품 구매하기 Insert
	public ModelAndView goodsPurchase(RedirectAttributes ra, String loginId, String addr, String gogcode, String gamount, String totalPrice,
			String gname, String gimage) {
		System.out.println("CampingShopService.goodsPurchase() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		//1. 구매 코드 생성 (select)
	    String maxgoCode = cdao.MaxGocode(); // 구매 코드 최대값 생성
	    String gocode = "GO";
	    if(maxgoCode == null) {
	    	gocode = gocode + "001";
	    } else {    
	    	maxgoCode = maxgoCode.substring(2); 
	    	int codeNum = Integer.parseInt(maxgoCode) + 1;
	    	if( codeNum < 10) {
	    		gocode = gocode + "00" + codeNum;
	    	} else if(codeNum < 100) {
	    		gocode = gocode + "0" + codeNum;
	    	} else {
	    		gocode = gocode + codeNum;
	    	}
	    }
	    
	    try {
	    	// dao 전송 주문 코드부터 이미지 까지		
	    	int goodsPurchase = cdao.goodsPurchase(gocode,loginId,addr,gogcode,gamount,totalPrice
	    			,gname,gimage);	
	    	  System.out.println("goodsPurchase :"+ goodsPurchase);
	    	  ra.addFlashAttribute("msg", "구매를 성공하셨습니다.");	        	 
		      mav.setViewName("redirect:/CampingPurchaseListPage");
		} catch (Exception e) {
			  ra.addFlashAttribute("msg", "구매를 실패하였습니다.");
		      mav.setViewName("redirect:/campingDetailPage");
		}			
		return mav;
	}
	
	// 구매내역 보기 Select
	public ModelAndView CampingPurchaseListPage() {
		 System.out.println("CampingShopService.CampingPurchaseListPage() 호출");
		 ModelAndView mav = new ModelAndView();
		 
		 String loginId = (String) session.getAttribute("loginId");
		 System.out.println("loginId :"+ loginId);
		 
		 ArrayList<GoodsOrderDto> PurchaseList = cdao.PurchaseList(loginId); // 해당하는 아이디의 구매내역 값 출력	    	 
		 System.out.println("PurchaseList :"+ PurchaseList);
		 mav.addObject("PurchaseList", PurchaseList);
		 mav.setViewName("campingshop/CampingPurchaseListPage"); // 페이지 이동
		 
		return mav;
	}
	
	// 장바구니 클릭 state값 증가 ajax
	public String cartInsert(String gcode) {
		 System.out.println("CampingShopService.cartInsert() 호출");
		 
		 
		//1. 구매 코드 생성 (select)
		    String maxgoCode = cdao.MaxGocode(); // 구매 코드 최대값 생성
		    String gocode = "GO";
		    if(maxgoCode == null) {
		    	gocode = gocode + "001";
		    } else {    
		    	maxgoCode = maxgoCode.substring(2); 
		    	int codeNum = Integer.parseInt(maxgoCode) + 1;
		    	if( codeNum < 10) {
		    		gocode = gocode + "00" + codeNum;
		    	} else if(codeNum < 100) {
		    		gocode = gocode + "0" + codeNum;
		    	} else {
		    		gocode = gocode + codeNum;
		    	}
		    }
			 String loginId = (String) session.getAttribute("loginId");
		    // 장바구니 dao 페이지 이동
			 
			// SELECT 캠핑 용품 
			GoodsDto campingShop2 = cdao.getCampingInfo(gcode); 
			
			
			
		    int cartInsert = cdao.cartInsert(gcode,gocode,loginId, campingShop2.getGprice(),campingShop2.getGname(),campingShop2.getGimage());
		    System.out.println("cartInsert :"+ cartInsert);
		 
		 return cartInsert+"";
	}
	
}



















