package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping(value="/boardList")
	public String boardList() {
		System.out.println("게시판 이동 요청");
		
		return "board/BoardList";
	}
}
