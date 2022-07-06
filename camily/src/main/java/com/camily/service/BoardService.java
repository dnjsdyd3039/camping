package com.camily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camily.dao.BoardDao;
import com.camily.dto.BoardsDto;

@Service
public class BoardService {

	@Autowired
	private BoardDao bdao;
	
	public int insertBoard(BoardsDto bo) {
		System.out.println("BoardService.insertBoard()호출");
		System.out.println(bo);
		int insertResult = bdao.insertBoard(bo);
		
		return insertResult;
		
	}
	
}
