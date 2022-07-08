package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dao.BoardDao;
import com.camily.dao.ReplyDao;
import com.camily.dto.BoardDto;
import com.camily.dto.ReplyDto;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao badao;
	
	@Autowired
	private ReplyDao rdao;
	
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


	//게시글 작성
		public int insertBoard(BoardDto bo) {
			System.out.println("BoardService.insertBoard()호출");
			
			//글번호 조회
			int bno = badao.getMaxBocode() + 1;
			System.out.println("생성된 글번호 :" + bno);		
			bo.setBocode(bno);
	
			String loginId = (String) session.getAttribute("loginId");
			bo.setBomid(loginId);
			System.out.println(bo);
			
			int insertResult = badao.insertBoard(bo);
			
			return insertResult;
			
		}

		//댓글 작성
		public int replyWrite(ReplyDto ro) {
			System.out.println("BoardService.replyWrite()호출");
			
			//댓글 번호 조회
			int reno = rdao.getMaxRpcode() + 1;
			System.out.println("생성된 댓글번호 :" + reno);
			ro.setRpcode(reno);
			
			String loginId = (String) session.getAttribute("loginId");
			ro.setRpmid(loginId);
			System.out.println(ro);
			
			int replyWriteResult = rdao.insertReplyWrite(ro);
			
			return replyWriteResult;
		}

		public int replyDelte(int delRno) {
			System.out.println("BoardService.replyDelete()호출");
			
			int deleteReplyResult = rdao.deleteReply(delRno);
			
			return deleteReplyResult;
		}



}
