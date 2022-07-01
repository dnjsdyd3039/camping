package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsReviewController {
	
	@RequestMapping(value="/goreviewpage")
	public String goreviewpage() {
		System.out.println("캠핑용품 리뷰 페이지 이동 요청");
		
		return "goodsreview/GoReviewPage";
	}
	
	@RequestMapping(value="/goreviewdetailpage")
	public String goreviewdetailpage() {
		System.out.println("캠핑용품 리뷰 상세페이지 이동요청");
		
		return "goodsreview/GoReviewDetailPage";
	}
	
	/*
	 * @RequestMapping(value="/goreviewdetail") public ModelAndView goreviewdetail()
	 * { System.out.println("게시판 상세글 조회"); ModelAndView mav = new ModelAndView();
	 * 
	 * return mav; }
	 */
}
