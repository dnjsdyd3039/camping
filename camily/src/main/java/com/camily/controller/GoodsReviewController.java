package com.camily.controller;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.GoodsReviewDto;
import com.camily.service.GoodsReviewService;

@Controller
public class GoodsReviewController {
	
	@Autowired
	GoodsReviewService grvc;
	
	@RequestMapping(value="/goreviewpage")
	public ModelAndView goreviewList() {
		System.out.println("캠핑용품 리뷰 페이지 이동 요청");
		ModelAndView mav = grvc.goreviewList();
		
		return mav;
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
