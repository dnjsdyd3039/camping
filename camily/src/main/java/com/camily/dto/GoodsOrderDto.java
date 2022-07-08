package com.camily.dto;

import lombok.Data;

@Data
public class GoodsOrderDto {

	private String gocode;    // 주문 코드
	private String gomid;     // 주문자 아이디
	private String gomaddr;   // 주문 주소
	private String gogcode;   // 주문 상품 코드
	private String goamount;  // 주문 수량
	private String goprice;   // 주문 상품 가격
	private String goname;    // 상품 이름
	private String goimage;   // 상품 이미지
	
	private String gostate; // 상품 상태
}
