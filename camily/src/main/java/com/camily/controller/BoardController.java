package com.camily.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dto.BoardDto;
import com.camily.dto.ReplyDto;
import com.camily.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bsvc;
	
	// 게시판 리스트 기능
	@RequestMapping(value="/boardList")
	public ModelAndView boardList() {
		System.out.println("게시판 리스트 요청");
		ModelAndView mav = bsvc.boardList();
		return mav;
	}
	
	@RequestMapping(value="/boardView")
	public ModelAndView boardView(String bocode) {
		System.out.println("게시판 상세보기 요청");
		ModelAndView mav = bsvc.boardView(bocode);
		return mav;
	}
	
	@RequestMapping(value = "/replyWrite")
	public ModelAndView replyWrite(ReplyDto reply) {
		System.out.println("댓글작성 요청");
		ModelAndView mav = bsvc.replyWrite(reply);
		return mav;
	}
			
}
