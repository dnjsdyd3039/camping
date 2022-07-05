package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.CampingShopDto;

public interface CampingShopDao {
    
	// 캠핑 용품 select
	ArrayList<CampingShopDto> campingShop();

	CampingShopDto campingDetail(String gcode);

	CampingShopDto campingpurchase(@Param("gcode") String gcode);
    

	



}