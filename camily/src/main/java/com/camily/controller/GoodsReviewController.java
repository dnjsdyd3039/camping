package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsReviewController {
	
	@RequestMapping(value="/goreviewpage")
	public String goreviewpage() {
		System.out.println("게시판 이동 요청");
		
		return "GoodsReview/GoReviewPage";
	}
	
	@RequestMapping(value="/goreviewdetail")
	public ModelAndView goreviewdetail() {
		System.out.println("게시판 상세글 조회");		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
