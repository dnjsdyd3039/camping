<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->

<script src="https://kit.fontawesome.com/e9a5166904.js"
	crossorigin="anonymous"></script>
</head>
<body class="animsition">



	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Your Cart </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img
								src="${pageContext.request.contextPath}/resources/images/item-cart-01.jpg"
								alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat </a> <span class="header-cart-item-info"> 1
								x $19.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img
								src="${pageContext.request.contextPath}/resources/images/item-cart-02.jpg"
								alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star </a> <span class="header-cart-item-info"> 1
								x $39.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img
								src="${pageContext.request.contextPath}/resources/images/item-cart-03.jpg"
								alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather </a> <span class="header-cart-item-info">
								1 x $17.00 </span>
						</div>
					</li>
				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">Total: $75.00</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart </a> <a href="shoping-cart.html"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out </a>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Slider -->
	<section class="section-slide" style="margin-top: 100px;">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1"
					style="background-image: url(https://img.campingtalk.me/camp/1/16481846836431269_L.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2"
									style="color: white; text-shadow: 1px 1px 1px #000;"> 이제
									대새는 차박! </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1"
									style="color: white; text-shadow: 1px 1px 1px #000;">대한민국
									차박캠핑장</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="zoomIn" data-delay="1600">
								<a href="product.html"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									보러가기 </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1"
					style="background-image: url(https://img.campingtalk.me/camp/1/16481847793309434_L.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2"
									style="color: white; text-shadow: 1px 1px 1px #000;">
									먼곳은 힘들어, 그렇다면? </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1"
									style="color: white; text-shadow: 1px 1px 1px #000;">서울근교
									캠핑장</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="slideInUp" data-delay="1600">
								<a href="product.html"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									보러가기 </a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1"
					style="background-image: url(https://img.campingtalk.me/camp/1/16369629664355194_L.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2"
									style="color: white; text-shadow: 1px 1px 1px #000;">
									캠핑은 처음이라.. 잘 모른다면? </span>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1"
									style="color: white; text-shadow: 1px 1px 1px #000;">몸만 가면
									되는 글램핑</h2>
							</div>

							<div class="layer-slick1 animated visible-false"
								data-appear="rotateIn" data-delay="1600">
								<a href="product.html"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									보러가기 </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Banner -->
	<div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img
							src="${pageContext.request.contextPath}/resources/images/banner-01.jpg"
							alt="IMG-BANNER"> <a href="product.html"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8"> Women
								</span> <span class="block1-info stext-102 trans-04"> Spring
									2018 </span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img
							src="${pageContext.request.contextPath}/resources/images/banner-02.jpg"
							alt="IMG-BANNER"> <a href="product.html"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8"> Men </span>

								<span class="block1-info stext-102 trans-04"> Spring 2018
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img
							src="${pageContext.request.contextPath}/resources/images/banner-03.jpg"
							alt="IMG-BANNER"> <a href="product.html"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Accessories </span> <span class="block1-info stext-102 trans-04">
									New Trend </span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->



	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img
						src="${pageContext.request.contextPath}/resources/images/icons/icon-close.png"
						alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3"
										data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img
												src="${pageContext.request.contextPath}/resources/images/product-detail-01.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-01.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img
												src="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-02.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img
												src="${pageContext.request.contextPath}/resources/images/product-detail-03.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-03.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
								Jacket</h4>

							<span class="mtext-106 cl2"> $58.79 </span>

							<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros
								pharetra viverra. Nam vitae luctus ligula. Mauris consequat
								ornare feugiat.</p>

							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Size</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Color</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart</button>
									</div>
								</div>
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


    <!-- 모달 스크립트 끝-->
	<script type="text/javascript">
	   
		function memberJoin(){
			$("#JoinModal").modal('show');
		}
		
		function memberLogin(){
			$("#LoginModal").modal('show');
		}
		
		function memberInfo(){
			$("#InfoModal").modal('show');
		}
	
		$('.modal').on('hidden.bs.modal', function (e) {
			console.log("모달창 초기화!");
		    $("#joinForm")[0].reset();
		    $("#idCheckMsg").text("");
		    $("#pwCheckMsg").text("");
		});
		</script>
		<!-- 모달 스크립트 끝  -->
		
		<!-- 다음 우편번호 서비스-->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
		<!-- 다음 주소api -->
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>		
		

	<script type="text/javascript">
	var inputIdCheck = false;
	var inputpwCheck = false;
	
    $(document).ready(function (){
	
	$("#inputMid").focusout(function(){
		var inputId = $("#inputMid").val();
		console.log("inputId : " +inputId);
		
		/* 아이디 길이 확인 */
		if( inputId.length == 0){
			$("#idCheckMsg").text("아이디를 입력 해주세요!").css("color","red");
			inputIdCheck = false;
		} else if (inputId.length < 5 || inputId.length > 10) {
            $("#idCheckMsg").text("아이디는 5 ~ 10자리 입니다.").css("color", "red")
            inputIdCheck = false;
        }
		
	   /* 아이디 중복 확인*/
		else {
			$.ajax({
				type : "get",
				url : "memberIdCheck",
				data : { "inputId" : inputId },
				success : function(result){
					console.log("result : " + result);
					if( result == "OK" ){
						$("#idCheckMsg").text("사용가능한 아이디입니다.").css("color","green");
						inputIdCheck = true;
					} else {
						$("#idCheckMsg").text("이미 사용중인 아이디입니다.").css("color","red");
						inputIdCheck = false;
					}
				}
			});
		}
	});
});
	/* 비밀번호 일치 확인*/
    $("#inputMpwCheck , #inputMpw").focusout(function(){
    	/* 비밀번호 정규식 */
    	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;
    	var txt = $("#inputMpw").val();
    	if( !reg.test(txt) ) {
    		$("#pwCheckMsg").text("영문과 숫자를 포함한 6~10자리를 입력해주세요.").css("color","red")
    		return false;
    	}
    	
    	if($("#inputMpwCheck").val().length != 0){
    		
		if( $("#inputMpwCheck").val() == $("#inputMpw").val() ){
			$("#pwCheckMsg").text("비밀번호가 일치합니다.").css("color","green")
			inputpwCheck = true;
		} else {
			$("#pwCheckMsg").text("비밀번호가 일치하지 않습니다.").css("color","red")
			inputpwCheck = false;
		}
    		
    	} else {
    		$("#pwCheckMsg").text("")
    	}
    	
    });
	
	
	
	function memberCheck() {
		/* 아이디 입력 확인 */
		if( !inputIdCheck ){
			alert("아이디를 확인 해주세요!");
			$("#inputMid").focus();
			return false;
		}
		/* 비밀번호 입력 확인 */
		if( $("#inputMpw").val().length == 0 || inputpwCheck == false){
			alert("비밀번호를 확인 해주세요!");
			$("#inputMpw").focus();
			return false;
		}
		
		
		/* 이름 입력 확인 */
		if( $("#inputMname").val().length == 0 ){
			alert("이름을 입력 해주세요!");
			$("#inputMname").focus();
			return false;
		}
		
		/* 전화번호 입력 확인 */
		if( $("#inputTel").val().length == 0 ){
			alert("전화번호를 입력 해주세요!");
			$("#inputTel").focus();
			return false;
		}
		
		/* 이메일 입력 확인 */
		if( $("#email").val().length == 0 ){
			alert("이메일를 입력 해주세요!");
			$("#email").focus();
			return false;
		}
		
		/* 생년월일 입력 확인 */
		if( $("#inputDate").val().length == 0 ){
			alert("생년원일을 입력 해주세요!");
			$("#inputDate").focus();
			return false;
		}
		
		/* 우편번호 입력 확인 */
		if( $("#sample6_postcode").val().length == 0 ){
			alert("우편번호를 입력 해주세요!");
			$("#sample6_postcode").focus();
			return false;
		}
		
		/* 주소를 입력 확인 */
		if( $("#sample6_address").val().length == 0 ){
			alert("주소를 입력 해주세요!");
			$("#sample6_address").focus();
			return false;
		}
		
		/* 상세주소 입력 확인 */
		if( $("#sample6_detailAddress").val().length == 0 ){
			alert("상세주소를 입력 해주세요!");
			$("#sample6_detailAddress").focus();
			return false;
		}
		
		if (checkEmail == "NO"){
			alert("이메일 인증을 확인해주세요!");
			$("#inputCheckNum").focus();
			return false;
		}
		
	}
	
 </script>


</body>
</html>
