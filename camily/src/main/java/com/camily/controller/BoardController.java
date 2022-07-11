package com.camily.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 게시판 상세보기 기능
	@RequestMapping(value="/boardView")
	public ModelAndView boardView(int bocode) {
		System.out.println("게시판 상세보기 요청");
		ModelAndView mav = bsvc.boardView(bocode);
		return mav;
	}
		
	@GetMapping("write")
	public String boardWrite() {
		System.out.println("BoardController.boardwrite()호출");
		return "board/BoardWrite";
	}

	@RequestMapping("write2")
	public String boardWrite(BoardDto bo, RedirectAttributes ra) {
		System.out.println("BoardController.boardwrite()호출");
		System.out.println(bo);
		int insertResult = bsvc.insertBoard(bo, ra);
		return "redirect:/boardView?bocode=" + bo.getBocode();
	}
			
	// 게시글 삭제 기능
	@RequestMapping(value="/boardDelete")
	public ModelAndView boardDelete(int bocode,RedirectAttributes ra) {
		System.out.println("게시글 삭제 요청");
		ModelAndView mav = bsvc.boardDelete(bocode, ra);
		return mav;
	}
	
	
	
}
