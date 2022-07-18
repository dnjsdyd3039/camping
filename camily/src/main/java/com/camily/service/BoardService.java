package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.BoardDao;
import com.camily.dao.ReplyDao;
import com.camily.dto.BoardDto;
import com.camily.dto.FAQDto;
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

	// 게시글 상세보기
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
		ra.addFlashAttribute("msg", "게시글이 등록되었습니다!");
		return insertResult;

	}

	public ModelAndView boardMoidfy(int bocode) {
		System.out.println("boardService.boardModify()호출");
		ModelAndView mav = new ModelAndView();
		BoardDto board = badao.selectBoard(bocode);
		System.out.println("board : " + board);

		mav.addObject("board", board);
		mav.setViewName("board/BoardModify");

		return mav;
	}

	public ModelAndView boardMoidfyForm(BoardDto board, RedirectAttributes ra) {
		System.out.println("boardService.boardModifyForm()호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = badao.updateBoard(board);
		
		ra.addFlashAttribute("msg", "게시글이 수정되었습니다!");
		mav.setViewName("redirect:/boardView?bocode=" + board.getBocode());
		return mav;
	}

	// 게시글 삭제
	public ModelAndView boardDelete(int bocode, RedirectAttributes ra) {
		System.out.println("BoardService.boardModify()호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 게시물 : " + bocode);
		badao.deleteBoard(bocode);

		ra.addFlashAttribute("msg", "게시글이 삭제 되었습니다!");
		mav.setViewName("redirect:/boardList");
		return mav;
	}

	// 댓글 작성
	public int replyWrite(ReplyDto ro) {
		System.out.println("BoardService.replyWrite()호출");

		// 댓글 번호 조회
		int reno = rdao.getMaxRpcode() + 1;
		System.out.println("생성된 댓글번호 :" + reno);
		ro.setRpcode(reno);

		String loginId = (String) session.getAttribute("loginId");
		ro.setRpmid(loginId);
		System.out.println(ro);

		int replyWriteResult = rdao.insertReplyWrite(ro);

		return replyWriteResult;
	}

	// 댓글 삭제
	public int replyDelte(int delRno) {
		System.out.println("BoardService.replyDelete()호출");

		int deleteReplyResult = rdao.deleteReply(delRno);

		return deleteReplyResult;
	}

	// 게시판 리스트 기능
	public ModelAndView FAQList() {
		System.out.println("BoardService.FAQList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<FAQDto> FAQList = badao.selectFAQList();

		mav.addObject("FAQList", FAQList);
		mav.setViewName("faq/FAQList");
		return mav;
	}
	
	//FAQ 글작성
		public int insertFAQ(FAQDto faq, RedirectAttributes ra) {
			System.out.println("BoardService.insertFAQ()호출");

			// 글번호 조회
			int faqno = badao.getFAQMaxBocode() + 1;
			System.out.println("생성된 글번호 :" + faqno);
			faq.setFaqcode(faqno);

			String loginId = (String) session.getAttribute("loginId");
			faq.setFaqmid(loginId);

			int insertResult = badao.insertFAQ(faq);
			ra.addFlashAttribute("msg", "게시글이 등록되었습니다!");
			return insertResult;

		}

		public ModelAndView FAQView(int faqcode) {
			System.out.println("BoardService.FAQView()호출");
			
				ModelAndView mav = new ModelAndView();
				System.out.println("게시판코드 : " + faqcode);
				FAQDto FAQView = badao.selectFAQView(faqcode);
				System.out.println(FAQView);

				mav.addObject("FAQView", FAQView);
				mav.setViewName("faq/FAQView");
				return mav;
			
		}

}
