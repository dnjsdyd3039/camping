package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CampingReviewController {
	
	@RequestMapping(value="/cgreviewpage")
	public String cgreviewpage() {
		System.out.println("캠핑장 리뷰사이트 이동요청");
		
		return "campingreview/CgReviewPage";
	}
	
	@RequestMapping(value="/cgreviewdetailpage")
	public String cgreviewdetailpage() {
		System.out.println("캠핑장 리뷰 상세페이지 이동요청");
		
		return "campingreview/CgReviewDetailPage";
	}
	
	/*
	 * @RequestMapping(value="/cgreviewdetail") public ModelAndView cgreviewdetail()
	 * { System.out.println("게시판 상세글 조회"); ModelAndView mav = new ModelAndView();
	 * 
	 * return mav; }
	 */
}