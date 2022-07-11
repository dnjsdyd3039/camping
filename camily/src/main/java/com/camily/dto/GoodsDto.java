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
    private String price2; // ajax 장바구니 담김 가격들 모음
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGcompanyname() {
		return gcompanyname;
	}
	public void setGcompanyname(String gcompanyname) {
		this.gcompanyname = gcompanyname;
	}
	public String getGprice() {
		return gprice;
	}
	public void setGprice(String gprice) {
		this.gprice = gprice;
	}
	public String getGcategory() {
		return gcategory;
	}
	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
	public String getGcontents() {
		return gcontents;
	}
	public void setGcontents(String gcontents) {
		this.gcontents = gcontents;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGsideimage() {
		return gsideimage;
	}
	public void setGsideimage(String gsideimage) {
		this.gsideimage = gsideimage;
	}
	public String getGbackimage() {
		return gbackimage;
	}
	public void setGbackimage(String gbackimage) {
		this.gbackimage = gbackimage;
	}
	public String getGdetailimage() {
		return gdetailimage;
	}
	public void setGdetailimage(String gdetailimage) {
		this.gdetailimage = gdetailimage;
	}
	public String getGamount() {
		return gamount;
	}
	public void setGamount(String gamount) {
		this.gamount = gamount;
	}
	public String getPrice2() {
		return price2;
	}
	public void setPrice2(String price2) {
		this.price2 = price2;
	}
    
    
    
	
}
