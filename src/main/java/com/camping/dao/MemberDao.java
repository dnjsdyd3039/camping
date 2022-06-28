package com.camping.dao;

import com.camping.dto.MemberDto;

public interface MemberDao {
    
	// xml 회원가입 아이디 중복 
	String memberIdCheck(String inputId);

	// 회원가입 
	int memberJoin(MemberDto member);
    
	
	
	
}
