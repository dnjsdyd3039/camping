package com.camily.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class CampingReviewController {
	
	@RequestMapping(value="/cgreviewpage")
	public String cgreview() {
		System.out.println("캠핑장 리뷰사이트 이동요청");
		
		return "CgReview/CgReviewPage";
	}
	
	@RequestMapping(value="/cgreviewdetail")
	public ModelAndView cgreviewdetail() {
		System.out.println("게시판 상세글 조회");		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
