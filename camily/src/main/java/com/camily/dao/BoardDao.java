package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.BoardDto;
import com.camily.dto.ReplyDto;

public interface BoardDao {

	ArrayList<BoardDto> selectBoardList();

	BoardDto selectBoardView(int bocode);

	ArrayList<ReplyDto> selectReplyList(int bocode);

	int insertBoard(BoardDto bo);

	int getMaxBocode();

	void deleteBoard(int bocode);

	

	
}
