<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원가입</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/member/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" 
    href="${pageContext.request.contextPath }/resources/member/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/slicknav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/progressbar_barfiller.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/gijgo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/animated-headline.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/css/style.css">

</head>
<!-- ? Preloader Start -->
<div id="preloader-active">
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-inner position-relative">
			<div class="preloader-circle"></div>
			<div class="preloader-img pere-text">
				<img
					src="${pageContext.request.contextPath }/resources/member/img/logo/loder.png"
					alt="">
			</div>
		</div>
	</div>
</div>


<!-- Register -->
<main class="login-body"
	data-vide-bg="${pageContext.request.contextPath }/resources/member/img/login-bg.mp4">
	<!-- Login Admin -->
	<form class="form-default" action="memberJoin" method="POST"
		onsubmit="return memberCheck()">

		<div class="login-form">
			<!-- logo-login -->
			<%-- <div class="logo-login">
				<a href="index.html"><img
					src="${pageContext.request.contextPath }/resources/member/img/logo/loder.png"
					alt=""></a>
			</div> --%>
			<h2>회원가입</h2>

			<div class="form-input">
				<label for="name">아이디</label> <input type="text" name="mid"
					id="inputMid" placeholder="아이디">
					<span class="font-weight-bold"  id="idCheckMsg" ></span>
			</div>
			<div class="form-input">
				<label for="name">비밀번호</label> <input type="text" name="mpw"
					id="inputMpw" placeholder="비밀번호">
			</div>
			<div class="form-input">
				<label for="name">이름</label> <input type="text" name="mname"
					id="inputMname" placeholder="이름">
			</div>
			<div class="form-input">
				<label for="name">전화번호</label> <input type="text" name="mtel"
					id="inputTel" placeholder="이름">
			</div>
			<div class="form-input">
				<label for="form3Example4cd">이메일</label> 
				<input type="text" id="emailid" name="memailid"> 
				@ 
				<input type="text" id="emaildomain" name="memaildomain"> 
				<select	id="domainSelect">
					<option value="">직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="daum.net">다음</option>
					<option value="google.com">구글</option>
				</select>
			</div>
			<br>
			<div class="form-input">
				<label for="name">생년월일</label> <input type="date" name="mbirth"
					id="inputDate">
			</div>
			<div class="form-input">
				<label for="inputMaddress">주소</label>
				<div class="form-group row">

					<div class="col-sm-6 mb-3 mb-sm-0">
						<input type="text" class="form-control form-control-user"
							name="mpostcode" id="sample6_postcode" placeholder="우편번호..">
					</div>

					<div class="col-sm-6">
						<input type="button" class="book-btn"
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
							name="mdetailAddr" id="sample6_detailAddress" placeholder="상세주소">

					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control form-control-user"
							name="mextraAddr" id="sample6_extraAddress" placeholder="참고항목">
					</div>
				</div>
			</div>
			<div class="form-input pt-30">
				<input type="submit" name="submit" value="회원가입">
			</div>
			<!-- Forget Password -->
			<a href="memberLoginForm" class="registration">로그인</a>
		</div>
	</form>
	<!-- /end login form -->
</main>


<script
	src="${pageContext.request.contextPath }/resources/member/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/vendor/jquery-1.12.4.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.slicknav.min.js"></script>

<!-- Video bg -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.vide.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/animated.headline.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.magnific-popup.js"></script>

<!-- Date Picker -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/gijgo.min.js"></script>
<!-- Nice-select, sticky -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.sticky.js"></script>
<!-- Progress -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.counterup.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.countdown.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/contact.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.form.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/mail-script.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->
<script
	src="${pageContext.request.contextPath }/resources/member/js/plugins.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/member/js/main.js"></script>

<!-- 다음 우편번호 서비스-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
			alert("이메일 도메인을 선택 해주세요!");
			$("#emaildomain").focus();
			return false;
		}
		
		/* 생년월일 입력 확인 */
		if( $("#inputDate").val().length == 0 ){
			alert("생년월일을 입력 해주세요!");
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
		
	}

</script>

<script type="text/javascript">
// 이메일 도메인 스크립트
    $("#domainSelect").change(function(){
	   var selDomain = $("#domainSelect").val(); 
	   $("#emaildomain").val(selDomain);
 });
</script>

</body>
</html>