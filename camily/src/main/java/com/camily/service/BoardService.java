package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.BoardDao;
import com.camily.dto.BoardDto;
import com.camily.dto.ReplyDto;

@Service
public class BoardService {

	@Autowired
	private BoardDao badao;
	
	@Autowired
	private HttpSession session;
	
	// 게시판 리스트 기능
	public ModelAndView boardList() {
		System.out.println("BoardService.boardList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<BoardDto> boardList = badao.selectBoardList();

		mav.addObject("boardList", boardList);
		mav.setViewName("board/BoardList");
		return mav;
	}

	public ModelAndView boardView(int bocode) {
		System.out.println("BoardService.boardView() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판코드 : " + bocode);
		BoardDto boardView = badao.selectBoardView(bocode);
		System.out.println(boardView);

		ArrayList<ReplyDto> replyList = badao.selectReplyList(bocode);
		System.out.println(replyList);

		mav.addObject("boardView", boardView);
		mav.addObject("replyList", replyList);
		mav.setViewName("board/BoardView");
		return mav;
	}

	// 게시글 작성
	public int insertBoard(BoardDto bo, RedirectAttributes ra) {
		System.out.println("BoardService.insertBoard()호출");

		// 글번호 조회
		int bno = badao.getMaxBocode() + 1;
		System.out.println("생성된 글번호 :" + bno);
		bo.setBocode(bno);

		String loginId = (String) session.getAttribute("loginId");
		bo.setBomid(loginId);
		System.out.println(bo);

		int insertResult = badao.insertBoard(bo);
		ra.addFlashAttribute("msg","게시글이 등록되었습니다!");
		return insertResult;

	}

	public ModelAndView boardDelete(int bocode, RedirectAttributes ra) {
		System.out.println("BoardService.boardModify()호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 게시물 : " + bocode);
		badao.deleteBoard(bocode);
		
		ra.addFlashAttribute("msg", "게시글이 삭제 되었습니다!");
		mav.setViewName("redirect:/boardList");
		return mav;
	}

	

}
