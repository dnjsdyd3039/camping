package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.camily.dto.CampingDetailInformationDto;
import com.camily.dto.CampingDto;
import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;
import com.camily.dto.MemberDto;

public interface CampingShopDao {
    
	// 캠핑 용품 페이지 이동요청 (SELECT) 페이징 처리
	@Select("SELECT * FROM GOODS")
	ArrayList<GoodsDto> getCampingList2();  	
    
	// 캠핑 용품 상세 페이지 이동 요청 (SELECT)
	GoodsDto campingDetail(String gcode);
    
	// 캠핑 구매 요청 페이지 이동요청 (SELECT) B
	GoodsDto campingpurchase(@Param("gcode") String gcode);
    
	// 구매 요청 페이지 이동하기 전에 세션 아이디를 이용해서 주소 찾기 ( 위에거 연장선 ) (SELECT) B
	MemberDto addselect(String loginId);
    
	// 구매 코드 최대값 생성 (SELECT) C
	String MaxGocode();
	
	// 캠핑 용품 구매하기 구매 코드 생성한거 가지고 사용함 (INSERT) C
	int goodsPurchase(
			@Param("gocode") String gocode, @Param("loginId") String loginId, @Param("addr") String addr, @Param("gogcode") String gogcode, 
			@Param("gamount") String gamount, @Param("totalPrice") String totalPrice, @Param("gname") String gname,
			@Param("gimage") String gimage);
    
	// 구매내역 보기 (SELECT) 페이징 처리
	ArrayList<GoodsOrderDto> PurchaseList(@Param("loginId") String loginId, @Param("startRow") int startRow, @Param("endRow") int endRow);
    
	// 구매목록 삭제하기 dao 호출 ajax (DELETE)
	int deleteph(String gocode);
    
	// 구매목록페이지 페이징처리
	@Select("SELECT COUNT(*) FROM GOODSORDER")
	int getCampTotalCount2();
	
	// 캠핑 용품 (SELECT) AA
	GoodsDto getCampingInfo(String gcode);
	
    // 찜클릭 state값 증가 ajax (INSERT) 캠핑용품에서 필요한 값 가져 온것 AA
	int cartInsert(@Param("gcode") String gcode, @Param("gocode") String gocode,
			@Param("loginId") String loginId, @Param("gorice") String gorice,
			@Param("goname") String goname, @Param("goimage") String goimage);
    
	// 찜목록 보기 (SELECT)
	ArrayList<GoodsOrderDto> cartselect(String loginId);
    
	// 찜삭제 (DELETE)
	int calldibs(@Param("gocode") String gocode, @Param("loginId") String loginId);
	
	// 장바구니 추가하기 전 장바구니 안에 같은 물건이 있는지 없는지 아이디로 확인 (SELECT) ZZ
	CampingDetailInformationDto selectdto(@Param("dicode")String dicode, @Param("loginId")String loginId);
    
    // 값이 없으면 장바구니 추가 (INSERT) ZZ
	int insertinformation(
			@Param("loginId") String loginId, @Param("dicode") String dicode, @Param("diname") String diname, 
			@Param("diimage") String diimage, @Param("diamount") String diamount, @Param("diaddr") String diaddr,
			@Param("diprice") String diprice, @Param("ditotalprice") int ditotalprice);

	// 값이 있으면 해당하는 상품이 있으니까 수량만 늘려줌 (UPDATE) ZZ
	int update(@Param("diamount") String diamount, @Param("old") String old, @Param("loginId") String loginId);
	
	// 장바구니 목록 페이지 출력 (SELECT)
	ArrayList<CampingDetailInformationDto> detailinformation(String loginId);
   
    // 장바구니 들어 있는 모든 값 (INSERT)
	int totalpurchase(GoodsOrderDto goInfo);
    
	// 장바구니 삭제 (DELETE)
	int deletepoket(String dicode);
   
    

	



    

	



}