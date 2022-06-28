package com.camping.service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camping.dao.MemberDao;
import com.camping.dto.GoodsDto;

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
    
	// 캠핑 용품 페이지 이동
	public ModelAndView campingShow() throws IOException {
		System.out.println("MemberService.campingShow()호출");		
		ModelAndView mav = new ModelAndView();
		//#contentWrapper > div.mainCategoryLink.mainConBox > div > ul > li > a
		String goodsUrl = "https://www.ocamall.com";
		Document doc = Jsoup.connect(goodsUrl).get();
		Elements goodsList_div = doc.select("div.mainCategoryLink.mainConBox > div > ul > li > a");
		//System.out.println("goodsList_div : "+ goodsList_div);
//		System.out.println(goodsList_div.eq(0).attr("href"));
		
		ArrayList<GoodsDto> goodsList = new ArrayList<GoodsDto>();
		
		for(int i = 0; i < goodsList_div.size()-2; i++) { 
			String detailUrl ="https://www.ocamall.com" + goodsList_div.eq(i).attr("href");
//			System.out.println(detailUrl);
			GoodsDto goodsInfo = new GoodsDto();	
			// 상품코드 생성
			// 테이블 조회 앞에 두글자 자르고 최대값 + 1
			
					//2 insert 캠핑 정보 등록
					
					// 카데고리 입력 (태그위치 따서)
					Document categorydoc = Jsoup.connect(detailUrl).get();
					
//		            Elements gcategoryList = categorydoc.select("div.cate-wrap div.bcate"); // 카테고리
		            String gcategory = categorydoc.select("div.cate-wrap div.bcate").text();		            
					Elements ggg = categorydoc.select("div.textWrap p.companyName"); // 상품이름
					Elements aaa = categorydoc.select("div.imgWrap img.MS_prod_img_m"); // 상품이미지
					Elements ccc = categorydoc.select("div.fr strong.sellPrice"); // 상품가격
					// 상품별
					for(int z = 0; z < ggg.size(); z++) {
						
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
//					goodsList.get(i).setGcode(gcode);
						
						// 카테고리
//						String gcategory = gcategoryList.select("div.bcate").eq(z).text();
					    goodsInfo.setGcategory(gcategory);
//					    System.out.println("gcategory :"+gcategory);
											
						// 이름
						String gname = ggg.select("p.companyName").eq(z).text();
					    goodsInfo.setGname(gname);
//					    System.out.println("gname :"+gname);
					    
						// 상품정보(이미지)
					    String gimage = aaa.select("img.MS_prod_img_m").eq(z).attr("src");
					    goodsInfo.setGimage(gimage);
//					    System.out.println("gimage :"+gimage);
					    
					    // 상품가격
					    String gprice = ccc.select("strong.sellPrice").eq(z).text();
					    goodsInfo.setGprice(gprice);
//					    System.out.println("gprice :"+gprice);
					    
					    goodsList.add(goodsInfo);
					}
					// 상품상세정보(이미지)	>> goodsListWrap안에있는 링크를 detailUrl2 >> 해당 주소의 이미지위치 따서
					//															>> 여러장이면 @붙여서 나누자
  
			}
			
		System.out.println(goodsList);
		//Elements goodsList_ol = goodsList_div.eq(0).select("ul");
		
		/*
		 * ArrayList<GoodsDto> goodsList = new ArrayList<GoodsDto>();
		 * 
		 * for(int i = 0; i < goodsList_ol.select("li").size(); i++) { GoodsDto gs = new
		 * GoodsDto(); String detailUrl = "http://www.cgv.co.kr" +
		 * goodsList_ol.select("li").eq(i).select("div.box-image a").eq(0).attr("href");
		 * Document detailDoc = Jsoup.connect(detailUrl).get(); Elements baseMovie =
		 * detailDoc.select("div.sect-base-movie"); String movieTitle =
		 * baseMovie.select("div.box-contents div.title strong").text();
		 * //System.out.println(" movieTitle : " + movieTitle);
		 * mv.setMvname(movieTitle);
		 * 
		 * String posterUrl =
		 * baseMovie.select("div.box-image span.thumb-image img").attr("src");
		 * //System.out.println(" posterUrl : " + posterUrl); mv.setMvposter(posterUrl);
		 * 
		 * String movieDirector =
		 * baseMovie.select("div.box-contents div.spec dd").eq(0).text();
		 * //System.out.println(" movieDirector : " + movieDirector);
		 * mv.setMvpd(movieDirector);
		 * 
		 * String movieActors =
		 * baseMovie.select("div.box-contents div.spec dd.on").eq(0).text();
		 * //System.out.println(" movieActors : " + movieActors);
		 * mv.setMvactor(movieActors);
		 * 
		 * String movieGenre =
		 * baseMovie.select("div.box-contents div.spec dd.on").eq(0).next().text().
		 * replace("장르 :", "").replaceFirst(" ", "");
		 * //System.out.println(" movieGenre : " + movieGenre);
		 * mv.setMvgenre(movieGenre);
		 * 
		 * String movieGrade =
		 * baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[
		 * 0]; //System.out.println(" movieGrade : " + movieGrade);
		 * mv.setMvage(movieGrade);
		 * 
		 * String movieTime =
		 * baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[
		 * 1].replaceFirst(",", ""); //System.out.println(" movieTime : " + movieTime);
		 * mv.setMvtime(movieTime);
		 * 
		 * String movieOpen =
		 * baseMovie.select("div.box-contents div.spec dd.on").eq(2).text();
		 * //System.out.println(" movieOpen : " + movieOpen); mv.setMvopen(movieOpen);
		 * 
		 * cgvMvList.add(mv); }
		 */
		
		return null;
	}	
	
}















