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
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<style type="text/css">
.section-reply-title {
	/* margin-bottom: 30px; */
	padding-top: 40px;
    text-align: center;
}

.section-reply-title h5 {
	color: #000000;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

.section-reply-title h6 {
	color: #848484;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

#aaa{
	font-weight: bold;




}

/* .section-reply-title h5:after {
	position: absolute;
	left: 0;
	top: -6px;
	height: 32px;
	width: 4px;
	background: #6E6E6E;
	content: "";
} */
</style>
</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->
	
	 <!-- breadcrumb ??????-->
	<!-- <div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				????????????
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
                ????????????					
			</span>
		</div>
	</div>  -->
						<div class="section-reply-title">
								<h5>????????????????????</h5><h6>?????? ????????? ??????????????? ???????????????!????</h6>
						</div>
						<c:forEach items="${PurchaseList }" var="Purchase">
						<div class="col-9" style="padding-top: 30px; margin: auto; font-family: Poppins-Bold;">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="d-flex justify-content-between">
	                            <div class="mb-4">???????????? : ${Purchase.gocode}</div>
	                            <div class="mb-4" style="text-align: end;">???????????? : ${Purchase.godate}</div>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">????????????</th>
                                            <th scope="col">???????????????</th>
                                            <th scope="col">????????????</th>
                                            <th scope="col">????????????</th>
                                            <th scope="col">?????????</th>
                                            <th scope="col">????????????</th>
                                            <th scope="col">????????????</th>
                                            <th scope="col"></th>
                                           
									 
								
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${Purchase.goimage }" alt="IMG" style="width: 60px;"></th>
                                            <td>${Purchase.goname }</td>
                                            <td>${Purchase.goprice }???</td>
                                            <td>${Purchase.goamount }???</td>
                                            <td>${Purchase.goprice}???</td>
                                            <td>${Purchase.gomaddr }</td>
                                            <td id="aaa">
                                      <c:if test="${Purchase.gostate == 2 }">
									  <p>???????????????</p>								    
								      <button type="button" class="btn btn-dark" onclick="PurchaseDelete('gocode')">????????????</button>
								    </c:if>
								    
								    <c:if test="${Purchase.gostate == 3 }">
									  <p>?????????</p>				
									  <button type="button" class="btn btn-dark">????????????</button>				    
								    </c:if>
								    
								    <c:if test="${Purchase.gostate == 4 }">
									  <p>????????????</p>
									 	<button style="margin-top: 100px" type="button" onclick="phDecide('${Purchase.gocode}')"
									    class="btn btn-dark">????????????</button>															  															    
								    </c:if>
								     
								    <c:if test="${Purchase.gostate == 5 }">
									  <p>????????????</p>								    
									     <a href="cgWrite?image=${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${Purchase.goimage }&gogcode=${Purchase.gogcode}&gocode=${Purchase.gocode }"
									     class="btn btn-dark">??????</a>	
								    </c:if>
								     
								    <c:if test="${Purchase.gostate == 6 }">
									  <p>???????????????</p>				
									</c:if>
								     
								    <c:if test="${Purchase.gostate == 7 }">
									  <p style="font-color : red;">????????????</p>				
									</c:if>
									</td>
									<td>				 <button type="button"
									 onclick="deleteph(this,'${Purchase.gocode}','${Purchase.gostate }')" class="btn btn-dark">??????</button></td>
                                        </tr>                                                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    
                    <br>
                    </c:forEach>
                    
						
	
								
	<!-- Load more ?????? -->
	<div class="flex-c-m flex-w w-full p-t-45">
				<!-- Pagination ?????? -->
				<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">
					<c:choose>
						<c:when test="${pageDto.page <= 1}">
							<span>[??????]</span>
						</c:when>
						<c:otherwise>
							<span><a href="CampingPurchaseListPage?page=${pageDto.page - 1}">[??????]</a></span>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
						<c:choose>
							<c:when test="${pageDto.page == num}">
								<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
							</c:when>
							<c:otherwise>
								<span><a href="CampingPurchaseListPage?page=${num}" class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a></span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
							<span>[??????]</span>
						</c:when>
						<c:otherwise>
							<span><a href="CampingPurchaseListPage?page=${pageDto.page + 1}">[??????]</a></span>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- Pagination ?????? -->
	          </div>	
	          <!-- Load more ?????? -->
			
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>

	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>

<script type="text/javascript">
 function deleteph(thisval,gocode,gostate){
	 console.log("thisval :"+ thisval);
	 console.log("gocode :"+ gocode);
	 console.log("gostate :"+ gostate);
	 location.href="deleteph?gocode="+gocode+"&gostate="+gostate;
	 
/* 	 $.ajax({
			type : "get",
			url : "deleteph",
			data : { "gocode" :  gocode, "gostate" : gostate},
			success : function(result){					 
			 console.log("result :"+ result);
              if(result != null){				
                 alert("?????? ?????? ??????!");	  
                 $("#"+gocode).prev().remove();
                 $("#"+gocode).remove(); 
              }else{
            	 alert("?????? ?????? ??????!");
              }
			}
			
	 }); */
 }
</script>

<!-- ???????????? -->
<script type="text/javascript">
function PurchaseDelete(gocode){
	location.href="PurchaseDelete?gocde="+gocode;
}
</script>	

<!-- ???????????? ????????? STATE = 5 -->
<script type="text/javascript">
function phDecide(gocode){
	var phDecide_Check = confirm("????????????????????????????");
	location.href="phDecide?gocode="+gocode;
}
</script>
</html>
