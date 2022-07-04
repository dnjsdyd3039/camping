package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.CampingDto;

public interface CampingDao {

	@Insert("INSERT INTO CAMPING(CACODE, CANAME, CALATITUDE, CALONGITUDE, CATYPE, CACONTENTS, CALINECONTENTS, CAPRICE, CAINFO, CAIMAGE) VALUES(#{cacode}, #{caname}, #{calatitude}, #{calongitude}, #{catype}, #{cacontents}, #{calinecontents}, #{caprice}, #{cainfo}, #{caimage})")
	void campingListInput(CampingDto campingDto);

	@Select("SELECT MAX(CACODE) FROM CAMPING")
	String getMaxCacode();

	@Select("SELECT * FROM (SELECT ROWNUM RN, CAMPING.* FROM CAMPING ORDER BY CACODE) WHERE RN BETWEEN #{startRow} AND #{endRow}")
	ArrayList<CampingDto> getCampingList(@Param("startRow") int startRow, @Param("endRow") int endRow);

	@Select("SELECT * FROM CAMPING WHERE CACODE = #{cacode}")
	CampingDto campingView(String cacode);

	@Select("SELECT COUNT(*) FROM CAMPING")
	int getCampTotalCount();

}
