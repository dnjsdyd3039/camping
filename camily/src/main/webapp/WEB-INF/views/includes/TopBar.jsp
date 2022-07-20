<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/e9a5166904.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->

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
							<a href="#" class="flex-c-m trans-04 p-lr-25"
								onclick="memberInfo('${sessionScope.loginId}')">내정보</a>
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
		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="${pageContext.request.contextPath }/" class="logo"> <img
						src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO"></a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li><a href="campingList">캠핑장</a></li>
						<li><a href="campingShopPage">캠핑용품</a></li>
						<li><a href="#">후기</a>
							<ul class="sub-menu">
								<li><a href="cgreviewpage">캠핑장 후기</a></li>
								<li><a href="goreviewpage">캠핑상품 후기</a></li>
							</ul>
						</li>

						<li class="label1" data-label1="hot"><a href="shoping-cart.html">이벤트</a></li>

						<li><a href="boardList">자유게시판</a></li>

						<li><a href="FAQList">FAQ</a></li>

						<li><a href="contact.html">고객센터</a></li>
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">

					<a href="detailinformation" style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i
							class="zmdi zmdi-shopping-cart"></i>
					</a>

					<button style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-cart"
						onclick="cartselect('${sessionScope.loginId}')">
						<i class="zmdi zmdi-favorite-outline"></i>
					</button>

					<a href="CampingPurchaseListPage" style="font-size: 30px"
						class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="fa-brands fa-wpforms"></i>
					</a>

				</div>
			</nav>
		</div>
	</div>
	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="index.html"><img src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
					alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div> -->

			<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0">
				<i class="zmdi zmdi-favorite-outline"></i>
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
			<li><a href="campingList">캠핑장</a></li>
			<li><a href="campingShopPage">캠핑용품</a>
			<li><a href="#">후기</a>
				<ul class="sub-menu-m">
					<li><a href="cgreviewpage">캠핑장 후기</a></li>
					<li><a href="goreviewpage">캠핑용품 후기</a></li>
				</ul> <span class="arrow-main-menu-m"> <i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li><a href="shoping-cart.html" class="label1 rs1" data-label1="hot">이벤트</a></li>

			<li><a href="boardList">자유게시판</a></li>

			<li><a href="FAQList">FAQ</a></li>

			<li><a href="contact.html">고객센터</a></li>
		</ul>
	</div>

</header>
<script type="text/javascript"> 
  function cartselect(loginId){
	  console.log("loginId :" + loginId);
	  $.ajax({
			type : "post",
			url : "cartselect",
			data : { "loginId" :  loginId},
			dataType : "json",
			success : function(result){
				var output = "";
				console.log(result)
				for(var z = 0; z < result.length; z++){
					output += '<li class="header-cart-item flex-w flex-t m-b-12" id="' + result[z].gocode + '">';
					output += '<div class="header-cart-item-img">';
					output += '<img src="'+ result[z].goimage + '" alt="IMG">';
					output += '</div>';
					output += '<div class="header-cart-item-txt p-t-8">';
					output += '<a href="campingDetailPage?gcode='+result[z].gogcode+'"'+' class="header-cart-item-name m-b-18 hov-cl1 trans-04">';
					output += result[z].goname;
					output += '</a>';
					output += '<span cartselect="header-cart-item-info">';
					output += '<span>' + result[z].goprice + '원 </span>';
				    output += '<button onclick="calldibs(this,'+"\'"+result[z].gocode+"\'"+')" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1">삭제하기</button>';
					output += '</span>';
					output += '</div>';
					output += '</li>';
				}
				$("#zzz").html(output);
			}
	 });
  } 
</script>

<script type="text/javascript">
function calldibs(thisval,gocode){
	  console.log("thisval: "+ thisval);
	  console.log("gocode: "+ gocode);
	  
	  $.ajax({
			type : "get",
			url : "calldibs",
			data : { "gocode" :  gocode},
			success : function(result){					 
			 console.log("result :"+ result);
            if(result != null){				
             alert("찜 삭제 성공!");	  
             $("#"+gocode).remove(); 
            }else{
          	 alert("찜 삭제 실패!");
            }
			}
			
	 });
	  
}
</script>
<!-- Cart -->
  <div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					찜목록
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full" id="zzz">
					
				</ul>
				

			</div>
		</div>
	</div>	
<!-- Cart 끝 -->
