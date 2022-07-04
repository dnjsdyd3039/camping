package com.camily.dto;

import lombok.Data;

@Data
public class GoodsDto {
	
  private String gcode;       // 상품코드
  private String gname;       // 상품이름
  private String gcontents;   // 상품정보
  private String gimage;      // 상품이미지
  private String gprice;      // 상품가격
  private String gcategory;   // 상품카테고리
  
}