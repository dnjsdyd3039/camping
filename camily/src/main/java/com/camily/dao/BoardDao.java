package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.BoardDto;
import com.camily.dto.ReplyDto;

public interface BoardDao {

	ArrayList<BoardDto> selectBoardList();

	BoardDto selectBoardView(String bocode);

	ArrayList<ReplyDto> selectReplyList(String bocode);

	int insertBoard(BoardDto bo);

	int getMaxBocode();

	int getMaxRpcode();
	
	int insertReplyWrite(ReplyDto ro);
}
