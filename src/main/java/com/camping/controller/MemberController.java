package com.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.dto.MemberDto;
import com.camping.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService msvc;

	// 메인 페이지 이동
	@RequestMapping(value = "/main")
		public String main() {
		System.out.println("메인 페이지 이동");
		return "main";
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/memberJoinForm")
		public String memberLoginForm() {
		System.out.println("회원가입 페이지 이동");
		return "member/MemberJoinForm";
	}

	@RequestMapping (value ="/memberJoin")
		public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra) {
		System.out.println("회원가입 요청");
		ModelAndView mav = msvc.memberJoin(member,ra);
		return mav;
	}
	
	
	// 로그인 페이지 이동
	@RequestMapping (value ="/memberLoginForm")
	  	public String MemberLoginForm() {
		System.out.println("로그인 페이지 이동");
		return "member/MemberLoginForm";
	}

	// 내정보 페이지 이동
	@RequestMapping(value = "/memberInfo")
		public String MemberInfo() {
		System.out.println("내정보 페이지 이동");
		return "member/MemberInfo";
	}

	// 회원가입 아이디 중복 체크
	@RequestMapping(value = "/memberIdCheck")
		public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("inputId : " + inputId);
		// memberIdCheck 서비스 호출
		String memberIdCheck = msvc.memberIdCheck(inputId);

		return memberIdCheck;
	}
}
