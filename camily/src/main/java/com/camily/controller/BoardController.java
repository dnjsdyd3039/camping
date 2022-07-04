package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.camily.dto.BoardsDto;
import com.camily.service.BoardService;

@Controller
public class BoardController {


	@GetMapping("write")
	public String boardWrite() {
		return "board/BoardWrite";
	}
	
	@Override
	public int insertBoard(BoardsDto bo) {
		return mapper.insertBoard(bo);
	}
	
	@PostMapping("write")
	public String write(BoardsDto bo) {
		BoardService.insertBoard(bo);
		return "redirect: /detail?seq="+ bo.getSeq();
	}
	
}
