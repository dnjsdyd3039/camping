package com.camping.dao;

import com.camping.dto.MemberDto;

public interface MemberDao {
    
	// xml 회원가입 아이디 중복 
	String memberIdCheck(String inputId);
    
	// xml 캠핑 코드 최대값
	String MaxGdcode();
    
}
