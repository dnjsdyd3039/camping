package com.camily.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dao.BoardDao;
import com.camily.dto.BoardDto;
import com.camily.dto.ReplyDto;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao badao;
	
	// 게시판 리스트 기능
	public ModelAndView boardList() {
		System.out.println("BoardService.boardList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<BoardDto> boardList = badao.selectBoardList();
		
		mav.addObject("boardList", boardList);
		mav.setViewName("board/BoardList");
		return mav;
	}

	public ModelAndView boardView(String bocode) {
		System.out.println("BoardService.boardView() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판코드 : " + bocode);
		BoardDto boardView = badao.selectBoardView(bocode);
		System.out.println(boardView);
		
		ArrayList<ReplyDto> replyList = badao.selectReplyList(bocode);
		
		mav.addObject("boardView", boardView);
		mav.addObject("replyList", replyList);
		mav.setViewName("board/BoardView");
		return mav;
	}

	public ModelAndView replyWrite(ReplyDto reply) {
		System.out.println("BoardService.replyWrite() 호출");
		ModelAndView mav = new ModelAndView();
		badao.insertReply(reply);
		System.out.println("댓글작성 : " + reply);
		
		mav.setViewName("redirect:/BoardView");
		return mav;
	}

	

	

}
