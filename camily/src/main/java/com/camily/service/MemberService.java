package com.camily.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.controller.MemberController;
import com.camily.dao.MemberDao;
import com.camily.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	MemberDao mdao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);
	
	
	
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

	public String emailCheck(String email, RedirectAttributes ra) {
		System.out.println("MemberService.emailCheck()호출");
		
		 /* 뷰(View)로부터 넘어온 데이터 확인 */
		LOGGER.info("이메일 데이터 전송 확인");
		LOGGER.info("인증번호 : " + email);
		
		 Random random = new Random();
		 int checkNum = random.nextInt(888888) + 111111;
		 LOGGER.info("인증번호 " + checkNum);
		 
	       /* 이메일 보내기 */
	        String setFrom = "doosung0702@naver.com";
	        String toMail = email;
	        String title = "(CAMILY)회원가입 인증 이메일 입니다.";
	        String content = 
	                "CAMILY 홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        
            
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            System.out.println("메세지 전송 완료");
	        }catch(Exception e) {
	            e.printStackTrace();
	            System.out.println("메세지 전송 실패");
	        }
	        
	        String num = Integer.toString(checkNum);
		return num;
	}	
	
}















