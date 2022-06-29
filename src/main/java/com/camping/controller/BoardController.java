package com.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.camping.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	BoardService bsvc;
	
	// 게시판 페이지 이동요청
	@RequestMapping(value = "/boardList")
		public String boardList() {
		System.out.println("게시판 페이지 이동요청");
		return "board/BoardList";
	}
}
