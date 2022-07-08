package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;
import com.camily.dto.MemberDto;

public interface CampingShopDao {
    
	// 캠핑 용품 select
	ArrayList<GoodsDto> campingShop();

	GoodsDto campingDetail(String gcode);

	GoodsDto campingpurchase(@Param("gcode") String gcode);

	MemberDto addselect(String loginId);

	int goodsPurchase(
			@Param("gocode") String gocode, @Param("loginId") String loginId, @Param("addr") String addr, @Param("gogcode") String gogcode, 
			@Param("gamount") String gamount, @Param("totalPrice") String totalPrice, @Param("gname") String gname,
			@Param("gimage") String gimage);

	String MaxGocode();

	ArrayList<GoodsOrderDto> PurchaseList(String loginId);

	int cartInsert(@Param("gcode") String gcode, @Param("gocode") String gocode,
			@Param("loginId") String loginId, @Param("gorice") String gorice,
			@Param("goname") String goname, @Param("goimage") String goimage);

	GoodsDto getCampingInfo(String gcode);

    

	



}