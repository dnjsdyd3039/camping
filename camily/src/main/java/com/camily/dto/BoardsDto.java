package com.camily.dto;

import lombok.Data;

@Data
public class BoardsDto {
	private String bocode;    	// 게시판 코드  
	private String bomid;		// 게시판 작성자 
	private int botype;			// 게시판 종류 (0: 공지게시판, 1: 자유게시판, 2: 질문게시판, 3: 건의게시판)
	private String botitle;		// 게시판 이름 
	private String bocontents;	// 게시판 글내용
	private String date;		// 게시판 작성일
	private int bostate;		// 게시판 상태 
}
