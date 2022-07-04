package com.camily.dao;

import org.apache.ibatis.annotations.Param;

import com.camily.dto.MemberDto;

public interface MemberDao {
    
	// xml 회원가입 아이디 중복 
	String memberIdCheck(String inputId);

	// 회원가입 
	int memberJoin(MemberDto member);
	
	// 로그인 기능
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	// 내정보 
	MemberDto selectMemberInfo(String loginId);
    
	
	
	
}
