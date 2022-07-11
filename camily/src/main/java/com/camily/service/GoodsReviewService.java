package com.camily.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.GoodsReviewDao;
import com.camily.dto.GoodsReviewDto;

@Service
public class GoodsReviewService {
	
	@Autowired
	private GoodsReviewDao grdao;

	public ModelAndView goreviewList() {
		System.out.println("GoodsReviewService.goreviewList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<GoodsReviewDto> goreviewList = grdao.selectGoodsReviewList();
		System.out.println(goreviewList);
		
		mav.addObject("goodsList", goreviewList);
		mav.setViewName("goodsreview/GoReviewPage");
		return mav;
	}


}
