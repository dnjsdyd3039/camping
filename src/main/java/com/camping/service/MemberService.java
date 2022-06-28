package com.camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.dao.MemberDao;
import com.camping.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	MemberDao mdao;
	
	// 회원가입 아이디 중복 체크
	public String memberIdCheck(String inputId) {
        System.out.println("MemberService.memberIdCheck()호출");
		// memberIdCheck dao 호출
		String memberIdCheck = mdao.memberIdCheck(inputId);
		System.out.println(memberIdCheck);
		if(memberIdCheck == null) {
			return "OK";			
		}else {
			return "NO";
		}
		
	}

	public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra) {
		System.out.println("MemberService.memberJoin()호출");
		ModelAndView mav = new ModelAndView();
		
		// 주소 
		member.setMaddr( member.getMpostcode()+"_"+member.getMaddress()+"_"+member.getMdetailAddr()+"_"+member.getMextraAddr() );
		
		// 이메일
		member.setMemail( member.getMemailid()+"@"+member.getMemaildomain() );
		
		int joinResult = mdao.memberJoin(member);
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		mav.setViewName("redirect:/");
		
		return mav;
	}	
	
}















