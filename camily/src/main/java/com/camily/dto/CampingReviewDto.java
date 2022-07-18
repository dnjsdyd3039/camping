package com.camily.dto;

import lombok.Data;

@Data		
public class CampingReviewDto {
	private String cgrvcode;		// 캠핑장 리뷰 코드 (PK)
	private String cgrvmid;			// 캠핑장 리뷰 작성자 (FK)
	private String cgrvcacode;		// 리뷰 쓸 캠핑장 코드 (FK)
	private String cgrvtitle;		// 캠핑장 리뷰 제목 (NOT NULL)
	private String cgrvcontents;	// 캠핑장 리뷰 내용 (NOT NULL)
	private String cgrvdate;		// 캠핑장 리뷰 날짜
	private int cgrvlike;			// 캠핑장 좋아요(0: 없음, 1: 좋아요)
}
