package com.camily.dto;

import lombok.Data;

@Data
public class GoodsDto {

	private String gcode; // 상품코드
	private String gcompanyname; // 상품회사이름
	private String gprice; // 상품가격
	private String gcategory; // 상품카테고리
	private String gcontents; // 상품정보
	private String gimage; // 상품이미지
	private String gname; // 상품이름
	private String gsideimage; // 상품사이드이미지
	private String gbackimage; // 상품백이미지
	private String gdetailimage; // 상품상세정보이미지

	private String gamount; // 내가 고른 상품 갯수

}
