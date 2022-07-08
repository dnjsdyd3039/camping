<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camily</title>
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
</head>
<body class="animsition">

	<!-- Topbar -->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End of Topbar -->
	
	<!-- breadcrumb 시작-->
	<div class="container" style="margin-top: 100px">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/" class="stext-109 cl8 hov-cl1 trans-04">
				메인페이지
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
                구매목록					
			</span>
		</div>
	</div>
	<!-- breadcrumb 끝-->

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" action="#" method="post">
		<div class="container">
			
						<div class="wrap-table-shopping-cart">
						
                            
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">상품정보</th>
									<th class="column-2"></th>
									<th class="column-3">상품가격</th>
									<th class="column-4">상품수량</th>
									<th class="column-5">총금액</th>
									<th class="column-6">주문주소</th>
									<th class="column-7"></th>
								</tr>
                            <c:forEach items="${PurchaseList }" var="Purchase">
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="${Purchase.goimage }" alt="IMG">
										</div>
									</td>
									<td class="column-2">${Purchase.goname }</td>
									<td class="column-3">${Purchase.goprice }</td>
									<td class="column-4">총 : ${Purchase.goamount }개</td>
									<td class="column-5">총 : ${Purchase.goprice}원</td> <!-- 총 가격 -->
									<td class="column-6">${Purchase.gomaddr }</td>
									<th class="column-7" > 
									<button style="margin-top: 100px"
									 class="flex-c-m stext-101 cl5 size-80 bg2 bor1 hov-btn1 p-lr-15 trans-04">후기작성</button>
									</th>
								</tr>
								</c:forEach>
							</table>
						</div>
	
		</div>				
	<!-- Load more -->
	<div class="flex-c-m flex-w w-full p-t-45">
		<a href="#"
			class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
			위로가기(◦'⌣'◦)</a>
	</div>	
	</form>
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
									<div class="item-slick3" data-thumb="">
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
										data-thumb="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg">
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
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">상품이름 :</h4>

							<span class="mtext-106 cl2"> 상품가격 : </span>

							<p class="stext-102 cl3 p-t-23">상품설명 :</p>

							<!-- 모듈 창 -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">추가하기</div>

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
	    
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>

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
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
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
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
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
		$('.js-addwish-b2').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<script type="text/javascript">
		
	function reviewWriteForm(Purchase){
		var row = Purchase.split('(')[1].split(')')[0].split(', ');
		var reserveData = {};
		for(var i = 0; i < row.length; i++ ){
			var key = row[i].split('=')[0];  // mvcode
			var val = row[i].split('=')[1]; // MV001
			reserveData[key] = val;
		}
		
		$("#review_mvposter").attr("src",reserveData.mvposter);
		$("#review_recode").text("예매코드 : "+reserveData.recode);
		$("#review_mvname").text("영화 : "+reserveData.mvname);
		$("#review_thname").text("극장 : "+reserveData.thname + " " + reserveData.scroom);
		$("#review_scdate").text("일시 : "+reserveData.scdate);
		$("#review_reamount").text("인원 : "+reserveData.reamount +" 명");
		
		$("#rvcomment").val("");
		$("#rvrecode").val(reserveData.recode);
		$("#rvmvcode").val(reserveData.mvcode);
		
		$("#reviewWriteModal").modal('show');
		
	}
	
	</script>
</body>

		
</html>
