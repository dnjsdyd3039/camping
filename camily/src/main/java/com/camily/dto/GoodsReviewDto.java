package com.camily.dto;

import lombok.Data;

@Data
public class GoodsReviewDto {
	private String gorvcode;		// 상품 리뷰 코드
	private String gorvmid;			// 상품 리뷰 작성자
	private String gorvgccode;		// 리뷰 쓸 상품 코드
	private String gorvcontents;	// 상품 리뷰 내용
}
