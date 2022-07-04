package com.camily.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.MemberDto;
import com.camily.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService msvc;
	
	  @Autowired
	  private JavaMailSender mailSender;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);

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
	
	// 회원가입 이메일 인증
	@RequestMapping(value="/mailCheck")
	public @ResponseBody String mailCheck(String email, RedirectAttributes ra) {
		System.out.println("이메일 인증 요청");
		
		String checkNum = msvc.emailCheck(email, ra);
     
		return checkNum;
	}
		
	
    // 회원가입
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
