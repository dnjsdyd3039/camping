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
	
	// 게시판 상세보기 기능
	@RequestMapping(value="/boardView")
	public ModelAndView boardView(String bocode) {
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
	public String boardWrite(BoardDto bo) {
		System.out.println("BoardController.boardwrite()호출");
		System.out.println(bo);
		int boardWritetResult = bsvc.insertBoard(bo);
		return "redirect:/boardView?bocode=" + bo.getBocode();
	}
	
	@RequestMapping("replyWrite")
	public String replyWrite(ReplyDto ro) {
		System.out.println("댓글 작성 요청");
		System.out.println(ro);
		
		int replyReplyResult = bsvc.replyWrite(ro);
		
		return "redirect:/boardView?bocode=" + ro.getRpbocode();
	}
	
	@RequestMapping("deleteReply")
	public String deleteReply(int delRno,int bocode) {
		System.out.println("댓글 삭제 요청");
		int deleteReplyResult = bsvc.replyDelte(delRno);
		
		return "redirect:/boardView?bocode=" + bocode;
		
	}
}
