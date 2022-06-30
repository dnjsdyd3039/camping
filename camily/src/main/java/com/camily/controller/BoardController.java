package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping(value="/boardList")
	public String boardList() {
		System.out.println("게시판 이동 요청");
		
		return "board/BoardList";
	}
	
	@RequestMapping(value="/boardDetail")
	public ModelAndView boardDetail() {
		System.out.println("게시판 상세글 조회");
		
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}
}

