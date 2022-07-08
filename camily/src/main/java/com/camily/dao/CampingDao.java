package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.CampingDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.MemberDto;
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

	@Select("SELECT * FROM CAMPINGROOM WHERE CRCACODE = #{cacode} ORDER BY LPAD(CRNUM, 2, '0')")
	ArrayList<CampingRoomDto> campingRoomList(String cacode);

	@Select("SELECT DISTINCT CRNAME, CRPRICE, CRIMAGE FROM CAMPINGROOM WHERE CRCACODE = #{cacode}")
	ArrayList<CampingRoomDto> campingRoomTypeList(String cacode);

	@Select("SELECT RECRNAME, RECRNUM, REDAY FROM RESERVATION WHERE RECACODE = #{cacode} AND (REDAY BETWEEN TO_DATE(#{startday}, 'MM/DD/YY') AND TO_DATE(#{endday}, 'MM/DD/YY'))")
	ArrayList<ReservationDto> getReserveList(@Param("cacode") String cacode, @Param("startday") String startday, @Param("endday") String endday);

	@Select("SELECT MAX(RECODE) FROM RESERVATION")
	String getmaxrecode();

	@Select("SELECT * FROM CAMPINGROOM WHERE CRCACODE = #{cacode} AND CRNAME = #{roomSel} AND CRNUM = #{numSel}")
	CampingRoomDto getRoomInfo(@Param("cacode") String cacode, @Param("roomSel") String roomSel, @Param("numSel") String numSel);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto getMyInfo(String loginId);

}
