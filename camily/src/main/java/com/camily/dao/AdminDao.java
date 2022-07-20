package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.camily.dto.CampingDto;

public interface AdminDao {

	// 캠핑장 목록
	ArrayList<CampingDto> getCampingList(@Param("startRow")int startRow, @Param("endRow")int endRow);
    // 캠핑장 목록 페이징 처리
	int getCampTotalCount();
	// 캠핑장 상태 변경
	int updateCampingState(@Param("cacode")String cacode, @Param("castate")String castate);
	// 캠핑장 상세정보
	CampingDto selectCampingInfo(String cacode);
	// 캠핑장 상세정보 변경
	int updateCampingInfo(CampingDto camping);
	// 캠핑장 코드 최댓값 조회
	String getMaxCacode();
	// 캠핑장 등록
	int insertCamping(CampingDto camping);

}
