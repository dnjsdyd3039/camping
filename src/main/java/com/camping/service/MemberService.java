package com.camping.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.controller.MemberController;
import com.camping.dao.MemberDao;
import com.camping.dto.GoodsDto;
import com.camping.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	MemberDao mdao;
	
	@Autowired
	private HttpSession session;
	
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
	        
	        String num = Integer.toString(checkNum);
            
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            System.out.println("메세지 전송 완료");
	            return num;
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	            System.out.println("메세지 전송 실패");
	            return null;
	        }
	        
	}
	
		// 캠핑 용품 페이지 이동
		public ModelAndView campingShow() throws IOException {
			System.out.println("MemberService.campingShow()호출");		
			ModelAndView mav = new ModelAndView();
			//#contentWrapper > div.mainCategoryLink.mainConBox > div > ul > li > a
			String goodsUrl = "https://www.ocamall.com";   // 홈페이지
			Document doc = Jsoup.connect(goodsUrl).get();  // 홈페이즈를 문서 형태로 사용한다.
			Elements goodsList_div = doc.select("div.mainCategoryLink.mainConBox > div > ul > li > a"); // 캠핑 정보 페이지
//			System.out.println("goodsList_div : "+ goodsList_div);
//			System.out.println(goodsList_div.eq(0).attr("href"));
			
			Elements goodsList_div2 = doc.select("div.goodsListWrap > ul > li > a");
//			System.out.println(goodsList_div2.eq(0).attr("href"));
			ArrayList<GoodsDto> goodsList = new ArrayList<GoodsDto>();
			
			for(int i = 0; i < goodsList_div.size()-2; i++) { 
				String detailUrl ="https://www.ocamall.com" + goodsList_div.eq(i).attr("href");
//				System.out.println(detailUrl);
				GoodsDto goodsInfo = new GoodsDto();	
				// 상품코드 생성
				
				// 테이블 조회 앞에 두글자 자르고 최대값 + 1
				
						//2 insert 캠핑 정보 등록
						
						// 캠핑 정보 페이지 문서화
						Document categorydoc = Jsoup.connect(detailUrl).get();
						
						
						//#productClass > div.page-body > div.item-wrap > div.goodsListWrap.grid4 > ul:nth-child(1) > li:nth-child(1) > a
//			            Elements gcategoryList = categorydoc.select("div.cate-wrap div.bcate"); // 카테고리
			            String gcategory = categorydoc.select("div.cate-wrap div.bcate").text();		            
						Elements ggg = categorydoc.select("div.textWrap p.companyName"); // 상품이름
						Elements aaa = categorydoc.select("div.imgWrap img.MS_prod_img_m"); // 상품이미지
						Elements ccc = categorydoc.select("div.fr strong.sellPrice"); // 상품가격      
						
						// 캠핑 상세 정보 페이지
						Elements detailimage = categorydoc.select("#productClass > div.page-body > div.item-wrap > div.goodsListWrap.grid4 > ul > li > a");
						
						// 캠핑 상세정보 콘텐츠 내용
						for(int j = 0; j < detailimage.size(); j++) {
							String detailUrl2 ="https://www.ocamall.com" + detailimage.eq(i).attr("href");
							//System.out.println(detailUrl2);
							
							// 캠핑 상세 페이지 문서화
							Document categorydoc2 = Jsoup.connect(detailUrl2).get();
							
							Elements xxx = categorydoc2.select("div.prd-detail img"); // 상품 상세 정보 페이지 콘텐츠내용
							//System.out.println("xxx :"+xxx.size());
						//	System.out.println("=============");
							
							// 상품정보(이미지)
							String gcontents = "";
							for (int k = 0; k<xxx.size(); k++) {
								gcontents += xxx.eq(k).attr("src") + "@";							
							}
							 goodsInfo.setGcontents(gcontents);
						    //System.out.println("gcontents :"+gcontents);
						}
						
						// 상품별
						for(int z = 0; z < ggg.size(); z++) {
							
//						goodsList.get(i).setGcode(gcode);
							
							// 카테고리
//							String gcategory = gcategoryList.select("div.bcate").eq(z).text();
						    goodsInfo.setGcategory(gcategory);
//						    System.out.println("gcategory :"+gcategory);
												
							// 이름
							String gname = ggg.select("p.companyName").eq(z).text();
						    goodsInfo.setGname(gname);
//						    System.out.println("gname :"+gname);
						    
							// 상품정보(이미지)
						    String gimage = aaa.select("img.MS_prod_img_m").eq(z).attr("src");
						    goodsInfo.setGimage(gimage);
//						    System.out.println("gimage :"+gimage);
						    
						    // 상품가격
						    String gprice = ccc.select("strong.sellPrice").eq(z).text();
						    goodsInfo.setGprice(gprice);
//						    System.out.println("gprice :"+gprice);
						    
						    
						  //1. 캠핑코드 생성 (select )
						    String maxgdCode = mdao.MaxGdcode(); // 캠핑 코드 최대값 생성
						    String gcode = "GD";
						    if(maxgdCode == null) {
						    	gcode = gcode + "001";
						    } else {
						    	//maxMvCode = maxMvCode.split("MV")[1];
						    	maxgdCode = maxgdCode.substring(2); // 'MV002' >> '002' 
						    	int codeNum = Integer.parseInt(maxgdCode) + 1;
						    	if( codeNum < 10) {
						    		gcode = gcode + "00" + codeNum;
						    	} else if(codeNum < 100) {
						    		gcode = gcode + "0" + codeNum;
						    	} else {
						    		gcode = gcode + codeNum;
						    	}
						    }
						    goodsInfo.setGcode(gcode);
						    
						    goodsList.add(goodsInfo);
						}
						// 상품상세정보(이미지)	>> goodsListWrap안에있는 링크를 detailUrl2 >> 해당 주소의 이미지위치 따서
						//															>> 여러장이면 @붙여서 나누자
	  
				}
				
			System.out.println(goodsList);
			
		return null;
	}
		
		// 로그인
		public ModelAndView memberLogin(MemberDto member, RedirectAttributes ra) {
			System.out.println("MemberService.memberLogin() 호출");
			MemberDto loginResult = mdao.memberLogin(member);
			ModelAndView mav = new ModelAndView();
			System.out.println(loginResult);
			if(loginResult != null) {
				String memberState  = loginResult.getMstate().substring(2);
				System.out.println(memberState);
				int memberState2 = Integer.parseInt(memberState); 
				if(memberState2 == 00) {
					ra.addFlashAttribute("msg", "이용이 정지된 회원입니다.");
					mav.setViewName("redirect:/memberLoginForm");
				} else {
				// 로그인 성공
					System.out.println("로그인 성공");
					session.setAttribute("loginId", loginResult.getMid());
					ra.addFlashAttribute("msg", "로그인 되었습니다");
					mav.setViewName("redirect:/");					
				}
			} else {
				// 로그인 실패
				System.out.println("로그인 실패");
				ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
				mav.setViewName("redirect:/memberLoginForm");
			}
			return mav;
		}
		
		// 로그아웃
		public ModelAndView memberLogout(RedirectAttributes ra) {
			System.out.println("MemberService.memberLogout() 호출");
			ModelAndView mav = new ModelAndView();
			session.invalidate();// session 초기화
			ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
			mav.setViewName("redirect:/");
			return mav;
		}	
	
}















