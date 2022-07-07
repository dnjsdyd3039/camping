package com.camily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camily.dao.BoardDao;
import com.camily.dto.BoardsDto;

@Service
public class BoardService {

	@Autowired
	private BoardDao bdao;
	
	//게시글 작성
	public int insertBoard(BoardsDto bo) {
		System.out.println("BoardService.insertBoard()호출");
		System.out.println(bo);
		
		//글번호 조회
		int bno = bdao.getMaxBocode() + 1;
		System.out.println("생성된 글번호 :" + bno);
		bo.setBocode(bno);
		
		int insertResult = bdao.insertBoard(bo);
		
		return insertResult;
		
	}
	
}
