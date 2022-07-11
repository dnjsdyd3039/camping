<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
/* 전화번호 input number 버튼 지우기*/
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}

/* 생년월일 placeholder 적용 */
.date_empty:before {
  content: attr(data-placeholder);
  width: calc(100%);
}
</style>
	
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
			<c:if test="${sessionScope.loginId != null }">
				${sessionScope.loginId }님 환영합니다.
			</c:if>
				</div>

				<div class="right-top-bar flex-w h-full">
					<!-- <span class="flex-c-m trans-04 p-lr-25">
							sessionId님 환영합니다.
						</span> -->

					<c:choose>
                        <c:when test="${sessionScope.loginId == null }">
                        <a href="#" class="flex-c-m trans-04 p-lr-25" onclick="memberJoin();">회원가입</a>
                        <a href="#" class="flex-c-m trans-04 p-lr-25" onclick="memberLogin();">로그인</a>
                        </c:when>
                        
                        <c:otherwise>
                        <a href="#" class="flex-c-m trans-04 p-lr-25" onclick="memberInfo('${sessionScope.loginId}')">내정보</a>
                        <a href="memberLogout" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
                        </c:otherwise>
                    </c:choose>	

					<!-- <a href="#" class="flex-c-m trans-04 p-lr-25">
							EN
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							USD
						</a> -->
				</div>


			</div>
		</div>



		<!-- 회원가입 모달 -->
		<form action="memberJoin" method="post" id="joinForm"
			onsubmit="return memberCheck()">
		<div class="modal fade" id="JoinModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1500">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:35%">
						</a>
						<!-- <h4 class="modal-title w-100 font-weight-bold">회원가입</h4> -->
						<!-- <button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button> -->

					</div>
					<div class="modal-body mx-3">
						<div class="md-form mb-3">
							<input type="text" id="inputMid" class="form-control validate"
								placeholder="아이디" name="mid"  onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">
							<span id="idCheckMsg" style="font-size:13px"></span>
						</div>

						<div class="md-form mb-3">
							<input type="password" id="inputMpw" class="form-control validate"
								placeholder="비밀번호" name="mpw">
						</div>
						<div class="md-form mb-3">
							<input type="password" id="inputMpwCheck" class="form-control validate"
								placeholder="비밀번호 확인" >
								<span id="pwCheckMsg" style="font-size:13px"></span>
						</div>
						<div class="md-form mb-3">
							<input type="text" id="inputMname" class="form-control validate"
								placeholder="이름" name="mname"  onkeyup="this.value=this.value.replace(/[^ㄱ-ㅎ|가-힣]/g,'');">
								<span id="nameCheckMsg" style="font-size:13px"></span>
						</div>
						<div class="md-form mb-3">
							<input type="number" id="inputMtel" class="form-control validate"
								placeholder="전화번호 / 숫자만 입력해주세요" name="mtel">
						</div>
						<div class="row">
						<div class="col-sm-8 md-form mb-3">
							<input type="email" id="inputMemail"
								class="form-control validate" placeholder="이메일" name="memail">
							<input type="hidden" id="inputCheckNum" class="form-control validate" placeholder="인증번호 입력">	
							<span id="emailCheckMsg"></span>
						</div>
						
						<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark" type="button" id="mail_check_button">인증번호 발송</button>
							</div>
						</div>
						<div class="md-form mb-3">
							<input type="date" id="inputBirth" 
								class="form-control validate date_empty placeholder-date" name="mbirth" data-placeholder="생년월일">
						</div>
						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_postcode"
									class="form-control validate" placeholder="우편번호" name="mpostcode">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="button" class="btn btn-dark btn-user btn-block"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>
						<div class="md-form mb-3">
							<input type="text" id="sample6_address"
								class="form-control validate" placeholder="주소" name="maddress">
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_detailAddress"
									class="form-control validate" placeholder="상세주소" name="mdetailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_extraAddress"
									class="form-control validate" placeholder="참고항목" name="mextraAddr">
							</div>
						</div>
					</div>

					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-dark" type="submit">회원가입</button>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- 회원가입 모달 끝 -->
		
		<!-- 로그인 모달 -->
		<form action="memberLogin" method="post">
		<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1200">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:50%">
						</a>
						<!-- <h4 class="modal-title w-100 font-weight-bold">회원가입</h4> -->
						<!-- <button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button> -->

					</div>
					<div class="modal-body mx-3">

						<div class="md-form mb-3">
							<input type="text" 
								class="form-control validate loginInput" placeholder="아이디" name="mid">
						</div>

						<div class="md-form mb-3">
							<input type="password" 
								class="form-control validate loginInput" placeholder="비밀번호" name="mpw" onkeyup="checkCapsLock(event)">
						<span id="capslockCheckMsg"></span>
						</div>
					 	<div class="md-form mb-1 text-center">
							<button class="btn btn-dark">로그인</button>
							<br> <br> <a class="small" id="kakaoLoginBtn"></a>
						</div> 
						<div class="md-form mb-1 text-center">
						    <a href="#" onclick="findIdForm();">아이디 찾기</a> | <a href="#" onclick="findPwForm();">비밀번호 찾기</a> | <a href="#" onclick="memberJoin();">회원가입</a>
						</div> 
						
						
					</div>

					<!-- 	<div class="modal-footer d-flex justify-content-center">
						<div class="md-form mb-3">
							<a class="medium" id="kakaoLoginBtn"></a>
						</div>

						
					</div> -->

					<!-- <div class="md-form mb-1 text-center">
						<a href="#"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
					</div> -->
					<!-- <div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-dark">로그인</button>
						<button class="btn btn-dark" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">취소</span>
						</button>
						
					</div>
					<div class="text-center">
                        <a class="small" id="kakaoLoginBtn"></a>
                    </div> -->

				</div>
			</div>
		</div>
		</form>
		<!-- 로그인 모달 끝 -->

		<!-- 내정보 모달 -->
		<div class="modal fade" id="InfoModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1200">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:35%">
						</a>
						<!-- <h4 class="modal-title w-100 font-weight-bold">회원가입</h4> -->
						<!-- <button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button> -->

					</div>
					<div class="modal-body mx-3">
						<div class="md-form mb-3">
							<label class="small mb-1" for="mid">아이디</label>
							<input class="form-control" id="infoMid" name="mid" type="text"  readonly="readonly" >
						</div>
						<div class="md-form mb-3">
							<!-- <label class="small mb-1" for="mpw">비밀번호</label>
							<input class="form-control" id="inputMpw" name="mpw" type="password" readonly="readonly" > -->
							<input type="button" id="modifyBtn" class="btn btn-dark btn-user btn-block" value="비밀번호 변경" onclick="openModifyInput();">
							<input type="hidden" id="modifySubmitBtn" class="btn btn-dark btn-user btn-block" value="비밀번호 변경하기" onclick="modifyPw('${sessionScope.loginId}')">
						</div>
					    
						<div class="md-form mb-3">
							<input type="hidden" class="form-control modifyNowPw" id="loginPw" name="mpw" type="password" placeholder="현재 비밀번호">
							<input type="hidden" class="form-control modifyPw" id="modifyPwInput" name="mpw" type="password" placeholder="새 비밀번호">
							<input type="hidden" class="form-control modifyPw" id="modifyPwInputCheck" name="mpw" type="password" placeholder="새 비밀번호 확인">
							<span id="modifyPwCheckMsg" style="font-size:13px"></span>
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1" >이름</label>
							<input class="form-control" id="infoMname" name="mname" type="text" readonly="readonly" >
						</div>
						
						<div class="md-form mb-3">
							<label class="small mb-1" >전화번호</label>
							<input type="text" id="infoMtel" class="form-control validate" name="mtel" readonly="readonly">
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1" >이메일</label>
							<input type="text" id="infoMemail"
								class="form-control validate" placeholder="이메일" name="memail" readonly="readonly">
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1" >생년월일</label>
							<input type="text" id="infoMbirth"
								class="form-control validate" name="mbirth" readonly="readonly">
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1" >주소</label>
							<input type="text" id="infoMaddr"
								class="form-control validate" name="maddr" readonly="readonly">
						</div>
					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-dark" type="submit">정보수정</button>
						<button class="btn btn-dark" onclick="deleteMemberCheck();">회원탈퇴</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 내정보 모달 끝 -->
		
		<!-- 회원탈퇴 모달-->
<div class="modal fade" id="deleteMember" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 5000">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight:bold">정말로 회원탈퇴 하시겠습니까?</h5>
				
			</div>
			<div class="modal-body"> 사용하고 계신 아이디
			      <span style="color :green;"> (${sessionScope.loginId })</span> 
			       는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
                   <span style="color : red;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</span>
                </div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteMember?loginId=${sessionScope.loginId}">회원탈퇴</a>
			</div>
		</div>
	</div>
</div>
<!-- 회원탈퇴 모달 끝 -->

<!-- 아이디 찾기 모달 -->
<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 5000">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:50%">
						</a>
			
					</div>
					<div class="modal-body mx-3">
                        <div class="row">
						 <div class="col-sm-8 md-form mb-3">
							<input type="text" id="findId_inputName"
								class="form-control validate findId" placeholder="이름 " name="mid">
						 </div>
                        </div>
						<div class="row">
						<div class="col-sm-8 md-form mb-3">
							<input type="email" id="findId_inputEmail"
								class="form-control validate findId" placeholder="이메일" name="memail">
							<input type="hidden" id="findId_CheckNum" class="form-control validate findId" placeholder="인증번호 입력">	
							<span id="findId_EmCheckMsg"></span>
						</div>
						
						<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark" type="button" id="findId_emailCheck_btn">인증번호 발송</button>
							</div>
						</div>
						
						<div class="md-form mb-3">
							<input type="hidden" id="findIdSuccessText"
								class="form-control validate" readonly="readonly">
						 </div>
						
					 	<div class="md-form mb-1 text-center">
							<button class="btn btn-dark" id="findIdBtn">아이디 찾기</button>
						</div> 
					</div>
				</div>
			</div>
		</div>

<!-- 비밀번호 찾기 모달 -->
<form id="findPwForm2">
<div class="modal fade" id="findPwModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 5000">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:50%">
						</a>
			
					</div>
					<div class="modal-body mx-3">
                        <div class="row">
						 <div class="col-sm-8 md-form mb-3">
							<input type="text" id="findPw_inputId"
								class="form-control validate findPw" placeholder="아이디 입력">
						 </div>
								<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark btn-block" type="button" id="findPwNext_Btn" onclick="findPwNext();">다음</button>
							</div>
                        </div>
						<div class="row">
						<div class="col-sm-8 md-form mb-3">
							<input type="hidden" id="findPw_inputEmail"
								class="form-control validate findPw" placeholder="이메일" name="memail" readonly="readonly">
						</div>
						
						<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark" type="button" id="findPw_emailCheck_btn" hidden="hidden" >인증번호 발송</button>
							</div>
						</div>
						
						<div class="row">
						 <div class="col-sm-8 md-form mb-3">
							<input type="hidden" id="findPw_CheckNum" class="form-control validate findPw" placeholder="인증번호 입력">
							<span id="findPw_EmCheckMsg"></span>
						 </div>
								<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark btn-block" type="button" id="findPwCheckNext" hidden="hidden" >다음</button>
							</div>
                        </div>
						
						<div class="md-form mb-3">
							<input type="hidden" class="form-control findPw_newPw findPw" id="findPw_newPw" placeholder="새 비밀번호">
							<input type="hidden" class="form-control findPw_newPw findPw" id="findPw_newPwCheck" placeholder="새 비밀번호 확인">
							<span id="findPw_PwCheckMsg" style="font-size:13px"></span>
						</div>
						
					 	<div class="md-form mb-1 text-center">
							<button class="btn btn-dark" id="findPw_newPw_Btn" hidden="hidden">비밀번호 변경</button>
						</div> 
					</div>
				</div>
			</div>
		</div>
</form>

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="${pageContext.request.contextPath }/" class="logo"> <img
					src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
					alt="IMG-LOGO">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li><a href="index.html">캠핑장</a>

							<ul class="sub-menu">
								<li><a href="index.html">오토캠핑장</a></li>
								<li><a href="home-02.html">글램핑</a></li>
								<li><a href="home-03.html">Homepage 3</a></li>
							</ul></li>
						<li><a href="index.html">캠핑용품</a>
							<ul class="sub-menu">
								<li><a href="index.html">Homepage 1</a></li>
								<li><a href="home-02.html">Homepage 2</a></li>
								<li><a href="home-03.html">Homepage 3</a></li>
							</ul></li>
						<li><a href="product.html">리뷰</a>
							<ul class="sub-menu">
								<li><a href="index.html">캠핑장 리뷰</a></li>
								<li><a href="home-02.html">상품 리뷰</a></li>
							</ul></li>

						<li class="label1" data-label1="hot"><a
							href="shoping-cart.html">이벤트</a></li>

						<li><a href="blog.html">FAQ</a></li>

						<li><a href="about.html">캠핑TIP</a></li>

						<li><a href="contact.html">고객센터</a></li>
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div> -->
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti "
						data-notify="2">
						<i class="fa-brands fa-wpforms"></i>
					</div>

					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>

					<a href="#"
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
						data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
					</a>
				</div>
			</nav>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="index.html"><img
				src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
				alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div> -->

			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#"
				class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="left-top-bar">sessionId님 환영합니다.</div>
			</li>

			<li>
				<div class="right-top-bar flex-w h-full">
					<!-- <a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a> -->

					<a href="#" class="flex-c-m p-lr-10 trans-04"> 내정보 보기 </a>

					<!-- <a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a> -->
				</div>
			</li>
		</ul>

		<ul class="main-menu-m">
			<li><a href="index.html">캠핑장</a>
				<ul class="sub-menu-m">
					<li><a href="index.html">Homepage 1</a></li>
					<li><a href="home-02.html">Homepage 2</a></li>
					<li><a href="home-03.html">Homepage 3</a></li>
				</ul> <span class="arrow-main-menu-m"> <i
					class="fa fa-angle-right" aria-hidden="true"></i>
			</span></li>
			<li><a href="index.html">캠핑용품</a>
				<ul class="sub-menu-m">
					<li><a href="index.html">Homepage 1</a></li>
					<li><a href="home-02.html">Homepage 2</a></li>
					<li><a href="home-03.html">Homepage 3</a></li>
				</ul> <span class="arrow-main-menu-m"> <i
					class="fa fa-angle-right" aria-hidden="true"></i>
			</span></li>
			<li><a href="product.html">게시판</a></li>

			<li><a href="shoping-cart.html" class="label1 rs1"
				data-label1="hot">이벤트</a></li>

			<li><a href="blog.html">FAQ</a></li>

			<li><a href="about.html">캠핑TIP</a></li>

			<li><a href="contact.html">고객센터</a></li>
		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img
					src="${pageContext.request.contextPath}/resources/images/icons/icon-close2.png"
					alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search"
					placeholder="Search...">
			</form>
		</div>
	</div>

	<!-- 카카오 로그인 시작-->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('37a626201cfce25befda4da6757d4ec6');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>

	<script type="text/javascript">
         Kakao.Auth.createLoginButton({
		 container: '#kakaoLoginBtn',
		 size: 'large',
	     success: function(response) {
			console.log(response);
			// 사용자 정보 가져오기
			Kakao.API.request({
			  url: '/v2/user/me',
			  success: function(res) {
			    console.log(res);
			    console.log("res.id : " + res.id);
			    console.log("res.kakao_account.email : " + res.kakao_account.email);
			    console.log("res.kakao_account.profile.nickname : " + res.kakao_account.profile.nickname);
			    console.log("res.kakao_account.profile.profile_image_url : " + res.kakao_account.profile.profile_image_url);
			    
			    kakaoLogin(res.id, res.kakao_account.email, res.kakao_account.profile.nickname, res.kakao_account.profile.profile_image_url);
			    //아이디, 이메일, 닉네임, 프로필
			    //controller >> service 아이디로 회원정보 조회
			    //조회되는 회원 정보가 있으면 로그인 처리 후 메인페이지로
			    //조회되는 회원 정보가 없으면 아이디, 이메일, 닉네임, 프로필, 회원가입 처리 >> 로그인 페이지로
			  },
			  fail: function(error) {
			    console.error(error)
			  }
			})
	     },
		 fail: function(error) {
		  console.log(error);
			},
		 });
		</script>
	<!-- 카카오 로그인 끝-->

</header>

