<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Makaan - Real Estate HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${pageContext.request.contextPath }/resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet">

<!-- fontawesome Stylesheet -->
<script src="https://kit.fontawesome.com/d70fa0d402.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.Np {
	float: right;
	font: 30px;
}
</style>
</head>

<body>
	<div class="container-xxl bg-white p-0">

		<!-- Topbar -->
		<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
		<!-- End of Topbar -->

		<section class="vh-100" style="background-color: #EFFDF5;">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
				
					<div class="col-lg-12 col-xl-11">					
						<div class="card text-black" style="border-radius: 25px;">
							<div class="card-body p-md-5">
								<div class="row justify-content-center">
									<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

										<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">회원가입</p>

										<form class="mx-1 mx-md-4" action="memberJoin" method="post"
											onsubmit="return memberCheck()">

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-user fa-lg me-1 fa-fw"></i> <label
														class="form-label" for="form3Example1c">아이디</label>
													<div style="color: red; font-size: 13px" class="Np"></div>
													<input type="text" id="inputMid" class="form-control"
														name="mid" />
													<div class="font-weight-bold" id="idCheckMsg"></div>
												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-envelope fa-lg me-1 fa-fw"></i> <label
														class="form-label" for="form3Example3c">비밀번호</label>
													<div style="color: red; font-size: 13px" class="Np"></div>
													<input type="password" id="inputMpw" class="form-control"
														name="mpw" />
												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-lock fa-lg me-1 fa-fw"></i> <label
														class="form-label" for="form3Example4c">이름</label>
													<div style="color: red; font-size: 13px" class="Np"></div>
													<input type="text" id="inputMname" class="form-control"
														name="mname" />
												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-key fa-lg me-1 fa-fw"></i> <label
														class="form-label" for="form3Example4cd">전화번호</label>
													<div style="color: red; font-size: 13px" class="Np"></div>
													<input type="text" id="inputTel" class="form-control"
														name="mtel" />
												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-key fa-lg me-1 fa-fw"></i> <label
														class="form-label" for="form3Example4cd">이메일</label>
													<div style="color: red; font-size: 13px" class="Np"></div>
													<input type="text" id="emailid" name="memailid"> @
													<input type="text" id="emaildomain" name="memaildomain">
													<select id="domainSelect">
														<option value="">직접입력</option>
														<option value="naver.com">네이버</option>
														<option value="daum.net">다음</option>
														<option value="google.com">구글</option>
													</select>

													<div class="col-sm-6 mb-3 mb-sm-0">
														<input type="text" class="form-control form-control-user"
															placeholder="인증번호 입력" id="inputCheckNum"> <span
															id="checkMsg"></span>

														<div class="col-sm-6">
															<button type="button" id="mail_check_button"
																class="btn btn-primary btn-user btn-block mail_check_button">인증번호
																발송</button>
														</div>
													</div>


												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-key fa-lg me-1 fa-fw"></i> <label
														class="form-label" for="form3Example4cd">생년월일</label> <input
														type="date" id="inputDate" class="form-control"
														name="mbirth" />
												</div>
											</div>

											<div class="form-group row">
											<div class="col-12 mb-3 mb-sm-0">
												<label for="inputMaddress" class="text-lg font-weight-bold">주소</label>
												<div style="color: red; font-size: 13px" class="Np"></div>
											</div>

												<div class="col-sm-6 mb-3 mb-sm-0">
													<input type="text" class="form-control form-control-user"
														name="mpostcode" id="sample6_postcode"
														placeholder="우편번호..">
												</div>

												<div class="col-sm-6">
													<input type="button"
														class="btn btn-primary btn-user btn-block"
														onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
												</div>

											</div>

											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													name="maddress" id="sample6_address" placeholder="주소">
											</div>

											<div class="form-group row">
												<div class="col-sm-6 mb-3 mb-sm-0">
													<input type="text" class="form-control form-control-user"
														name="mdetailAddr" id="sample6_detailAddress"
														placeholder="상세주소">

												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control form-control-user"
														name="mextraAddr" id="sample6_extraAddress"
														placeholder="참고항목">
												</div>
											</div>

											<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
												<button type="submit" class="btn btn-primary btn-lg">회원가입</button>
											</div>

										</form>
									</div>
									<div
										class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
											class="img-fluid" alt="Sample image">

									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</section>





	</div>
	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Get In Touch</h5>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt me-3"></i>+012 345 67890
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope me-3"></i>info@example.com
					</p>
					<div class="d-flex pt-2">
						<a class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-youtube"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Quick Links</h5>
					<a class="btn btn-link text-white-50" href="">About Us</a> <a
						class="btn btn-link text-white-50" href="">Contact Us</a> <a
						class="btn btn-link text-white-50" href="">Our Services</a> <a
						class="btn btn-link text-white-50" href="">Privacy Policy</a> <a
						class="btn btn-link text-white-50" href="">Terms & Condition</a>
				</div>

				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Newsletter</h5>
					<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
					<div class="position-relative mx-auto" style="max-width: 400px;">
						<input class="form-control bg-transparent w-100 py-3 ps-4 pe-5"
							type="text" placeholder="Your email">
						<button type="button"
							class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Your Site Name</a>, All
						Right Reserved.

						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
							Codex</a>
					</div>
					<div class="col-md-6 text-center text-md-end">
						<div class="footer-menu">
							<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
								href="">FQAs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<!-- 다음 우편번호 서비스-->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- 제이쿼리 사용 주소 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>


	<script type="text/javascript">
// 이메일 도메인 스크립트
    $("#domainSelect").change(function(){
	   var selDomain = $("#domainSelect").val(); 
	   $("#emaildomain").val(selDomain);
 });
</script>

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


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/lib/wow/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

</body>

<script type="text/javascript">
  var checkMsg = '${msg}';
  console.log(checkMsg.length);
  if( checkMsg.length > 0 ){
	  alert(checkMsg);
  }
</script>

<script type="text/javascript">
	var inputIdCheck = false;
	
    $(document).ready(function (){
	
	<!-- 아이디 중복 확인 -->
	$("#inputMid").focusout(function(){
		var inputId = $("#inputMid").val();
		console.log("inputId : " +inputId);
		
		if( inputId.length == 0){
			$("#idCheckMsg").text("아이디를 입력 해주세요!").css("color","red");
			inputIdCheck = false;
		} else {
			$.ajax({
				type : "get",
				url : "memberIdCheck",
				data : { "inputId" : inputId },
				success : function(result){
					console.log("result : " + result);
					if( result == "OK" ){
						$("#idCheckMsg").text("사용가능한 아이디!").css("color","green");
						inputIdCheck = true;
					} else {
						$("#idCheckMsg").text("이미 사용중인 아이디!").css("color","red");
						inputIdCheck = false;
					}
				}
			});
		}
	});
});
	
	function memberCheck() {
		/* 아이디 입력 확인 */
		if( !inputIdCheck ){
			alert("아이디를 확인 해주세요!");
			$("#inputMid").focus();
			return false;
		}
		/* 비밀번호 입력 확인 */
		if( $("#inputMpw").val().length == 0 ){
			alert("비밀번호를 입력 해주세요!");
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
		if( $("#emailid").val().length == 0 ){
			alert("이메일를 입력 해주세요!");
			$("#emailid").focus();
			return false;
		}
		
		/* 이메일 도메인 입력 확인 */
		if( $("#emaildomain").val().length == 0 ){
			alert("이메일 도메인을 입력 해주세요!");
			$("#emaildomain").focus();
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

<script type="text/javascript">
var checkEmail = "";
var checkNum = "";
/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
	console.log("이메일 인증 시도 확인!");
    
    var email = $("#emailid").val() + "@" + $("#emaildomain").val()       // 입력한 이메일
    $.ajax({
    	type : "get",
    	url : "mailCheck",
    	data : { "email" : email},
    	success :function(data){
    		console.log("data : " + data);
    		if(data.length == 0){
    			alert("인증번호 전송에 실패하였습니다!");
    		} else{
    		alert("인증번호가 전송되었습니다!");
    		checkNum = data;
    		}
    		
$("#inputCheckNum").focusout(function(){
          
    var inputCode = $("#inputCheckNum").val();                            // 입력코드    
    
    if(inputCode == checkNum){                                            // 일치할 경우
    	console.log("인증성공");
    	$("#checkMsg").text("인증번호가 일치합니다.").css("color","green")
        checkEmail = "OK";
    } else {                                                              // 일치하지 않을 경우
    	console.log("인증실패");
    	$("#checkMsg").text("인증번호를 다시 확인해주세요.").css("color","red")
        checkEmail = "NO";
    }
    
    if($("#inputCheckNum").val() == ""){
    	$("#checkMsg").text("인증번호를 다시 확인해주세요.").css("color","red")
    }
    
 
    
});
    $("#emailid").change(function(){
    	console.log("이메일 변경");
    	checkNum = "";
    	checkEmail = "NO";
    	$("#checkMsg").text("").css("color","red")
    })
    
    $("#emaildomain").change(function(){
    	console.log("이메일 변경");
    	checkNum = "";
    	checkEmail = "NO";
    	$("#checkMsg").text("").css("color","red")
    })  
    	}
    	
    })
    
});
 

 
</script>

</html>