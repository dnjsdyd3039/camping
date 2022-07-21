package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.camily.dto.CampingDto;

public interface AdminDao {

	// ķ���� ���
	ArrayList<CampingDto> getCampingList(@Param("startRow")int startRow, @Param("endRow")int endRow);
    // ķ���� ��� ����¡ ó��
	int getCampTotalCount();
	// ķ���� ���� ����
	int updateCampingState(@Param("cacode")String cacode, @Param("castate")String castate);
	// ķ���� ������
	CampingDto selectCampingInfo(String cacode);
	// ķ���� ������ ����
	int updateCampingInfo(CampingDto camping);
	// ķ���� �ڵ� �ִ� ��ȸ
	String getMaxCacode();
	// ķ���� ���
	int insertCamping(CampingDto camping);

}
