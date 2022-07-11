package com.camily.dto;

import lombok.Data;

@Data
public class GoodsReviewDto {
	private String gorvcode;		// 상품 리뷰 코드
	private String gorvmid;			// 상품 리뷰 작성자
	private String gorvgccode;		// 리뷰 쓸 상품 코드
	private String gorvcontents;	// 상품 리뷰 내용
	public String getGorvcode() {
		return gorvcode;
	}
	public void setGorvcode(String gorvcode) {
		this.gorvcode = gorvcode;
	}
	public String getGorvmid() {
		return gorvmid;
	}
	public void setGorvmid(String gorvmid) {
		this.gorvmid = gorvmid;
	}
	public String getGorvgccode() {
		return gorvgccode;
	}
	public void setGorvgccode(String gorvgccode) {
		this.gorvgccode = gorvgccode;
	}
	public String getGorvcontents() {
		return gorvcontents;
	}
	public void setGorvcontents(String gorvcontents) {
		this.gorvcontents = gorvcontents;
	}
	
	
	
}
