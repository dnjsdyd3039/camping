package com.camily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camily.dto.BoardsDto;
import com.camily.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService bsvc;

	@GetMapping("write")
	public String boardWrite() {
		System.out.println("BoardController.boardwrite()호출");
		return "board/BoardWrite";
	}

	@RequestMapping("write2")
	public String boardWrite(BoardsDto bo) {
		System.out.println("BoardController.boardwrite()호출");
		System.out.println(bo);
		int insertResult = bsvc.insertBoard(bo);
		return "redirect:/detail?seq=" + bo.getBocode();
	}

}
