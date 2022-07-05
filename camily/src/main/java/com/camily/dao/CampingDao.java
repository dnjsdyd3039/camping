package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.CampingDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.ReservationDto;

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

	@Select("SELECT * FROM CAMPINGROOM WHERE CRCACODE = #{cacode} ORDER BY CRNAME")
	ArrayList<CampingRoomDto> campingRoomList(String cacode);

	@Select("SELECT DISTINCT CRNAME, CRPRICE, CRIMAGE FROM CAMPINGROOM WHERE CRCACODE = #{cacode}")
	ArrayList<CampingRoomDto> campingRoomTypeList(String cacode);

	@Select("SELECT RECRNAME, RECRNUM, REDAY FROM RESERVATION WHERE RECACODE = #{cacode} AND RECRNAME = '방갈로' AND RECRNUM = '1번' AND (REDAY BETWEEN TO_CHAR(#{startday}, 'YYYY-MM-DD') AND TO_CHAR(#{endday}, 'YYYY-MM-DD'));")
	ArrayList<ReservationDto> getReserveType(String cacode, String startday, String endday);

	@Select("SELECT CRNAME, COUNT(*) FROM CAMPINGROOM GROUP BY CRNAME")
	ArrayList<ReservationDto> getTotalType();

}
