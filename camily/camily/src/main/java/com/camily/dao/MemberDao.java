package com.camily.dao;

import org.apache.ibatis.annotations.Param;

import com.camily.dto.MemberDto;

public interface MemberDao {
    
	// 회원가입 아이디 중복체크 
	String memberIdCheck(String inputId);

	// 회원가입 
	int memberJoin(MemberDto member);
    
	// 로그인 
	MemberDto memberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	// 내 정보 조회
	MemberDto selectMemberInfo(String loginId);
    
	// 비밀번호 변경 현재 비밀번호 조회
	String selectLoginPw(String loginId);
	
    // 비밀번호 변경 
	int updateMemberPw(@Param("loginId") String loginId, @Param("modifyPw") String modifyPw);
	
}
