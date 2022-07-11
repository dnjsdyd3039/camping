<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>BoardView</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png"/>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
<style type="text/css">
	#bobtn{
		text-align:right;
	
	
	
	}



</style>

</head>
<body class="animsition">
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>

	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						
						<h4 class="ltext-109 cl2 p-b-28">
								${boardView.botitle } 
							</h4>
						
						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">${boardView.bomid }</span>
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									${boardView.bodate }
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									조회수 31
								</span>
							</span>						
							<p class="stext-117 cl6 p-b-26">
								${boardView.bocontents }
							</p>
							<div id="bobtn">
							<a class="btn btn-outline-success" href="boardModify?bocode=${boardView.bocode }">수정</a>
							<a class="btn btn-outline-success" href="boardDelete?bocode=${boardView.bocode }">삭제</a>	
							</div>						
						</div>											
																	
						<!--  -->
						<div class="p-t-40">
							
							<hr>					
							<h5 class="mtext-113 cl2 p-b-12">
								댓글
							</h5>		
							<div id="replyList">
								<ol class="replyList">
									<c:forEach items="${replyList }" var="reply"> 
										<li>
											<p>
											${reply.rpmid }<br>
											${reply.rpdate }
											</p>
											
											<p>${reply.rpcontents }</p>	
											<br>
											<div>				
												<button type="button" class="btn btn-outline-success" data-rno="${reply.rpcode }">수정</button>
												<button type="button" class="btn btn-outline-success" data-rno="${reply.rpcode }">삭제</button>
											</div>																													
										</li>																									
									</c:forEach>
								</ol>																					
							</div>		
																                   										
							<hr>
							<form method="post" action="replyWrite">								
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="hidden" name="rpcode" id="rpcode">	
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="hidden" name="rpdate" id="rpdate">													<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="hidden" name="rpmid" id="rpmid">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="hidden" name="rpmid" id="rpmid">
								<c:if test="${sessionScope.loginId != null }">																												
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="rpcontents" id="rpcontents" placeholder="댓글작성하기..."></textarea>
								</div>
								
								<button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04" type="submit">
									댓글작성
								</button>
								</c:if>
							</form>								
						</div>
					</div>
				</div>
			  </div>
			</div>
	</section>	
	
		

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	
	<script type="text/javascript">
 	 var checkMsg = '${msg}';
 	 console.log(checkMsg.length);
 	 if( checkMsg.length > 0 ){
		  alert(checkMsg);
 	 }
	</script>

</body>
</html>