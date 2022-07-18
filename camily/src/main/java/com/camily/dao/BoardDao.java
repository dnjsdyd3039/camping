package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.BoardDto;
import com.camily.dto.FAQDto;
import com.camily.dto.ReplyDto;

public interface BoardDao {

	ArrayList<BoardDto> selectBoardList();

	BoardDto selectBoardView(int bocode);

	ArrayList<ReplyDto> selectReplyList(int bocode);

	int insertBoard(BoardDto bo);

	int getMaxBocode();

	void deleteBoard(int bocode);

	BoardDto selectBoard(int bocode);

	int updateBoard(BoardDto board);

	ArrayList<FAQDto> selectFAQList();

	int getFAQMaxBocode();

	int insertFAQ(FAQDto faq);

	FAQDto selectFAQView(int faqcode);
}
