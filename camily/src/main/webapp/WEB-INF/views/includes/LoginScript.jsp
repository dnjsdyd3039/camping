<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모달 스크립트 시작-->
<script type="text/javascript">
	function memberJoin() {
		$("#JoinModal").modal('show');
	}

	function memberLogin() {
		$("#LoginModal").modal('show');
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 주소api -->
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function (data) {
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
					if (data.bname !== '' &&
						/[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' &&
						data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' +
							data.buildingName :
							data.buildingName);
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

	$(document).ready(function () {

		$("#inputMid").focusout(function () {
			var inputId = $("#inputMid").val();
			console.log("inputId : " + inputId);

			/* 아이디 길이 확인 */
			if (inputId.length == 0) {
				$("#idCheckMsg").text("아이디를 입력 해주세요!").css("color", "red");
				inputIdCheck = false;
			} else if (inputId.length < 5 || inputId.length > 10) {
				$("#idCheckMsg").text("아이디는 5 ~ 10자리 입니다.").css("color", "red")
				inputIdCheck = false;
			}

			/* 아이디 중복 확인*/
			else {
				$.ajax({
					type: "get",
					url: "memberIdCheck",
					data: {
						"inputId": inputId
					},
					success: function (result) {
						console.log("result : " + result);
						if (result == "OK") {
							$("#idCheckMsg").text("사용가능한 아이디입니다.").css("color", "green");
							inputIdCheck = true;
						} else {
							$("#idCheckMsg").text("이미 사용중인 아이디입니다.").css("color", "red");
							inputIdCheck = false;
						}
					}
				});
			}
		});
	});
	/* 비밀번호 일치 확인*/
	$("#inputMpwCheck , #inputMpw").focusout(function () {
		/* 비밀번호 정규식 */
		var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;
		var txt = $("#inputMpw").val();
		if (!reg.test(txt)) {
			$("#pwCheckMsg").text("영문과 숫자를 포함한 6~10자리를 입력해주세요.").css("color", "red")
			return false;
		}

		if ($("#inputMpwCheck").val().length != 0) {

			if ($("#inputMpwCheck").val() == $("#inputMpw").val()) {
				$("#pwCheckMsg").text("비밀번호가 일치합니다.").css("color", "green")
				inputpwCheck = true;
			} else {
				$("#pwCheckMsg").text("비밀번호가 일치하지 않습니다.").css("color", "red")
				inputpwCheck = false;
			}

		} else {
			$("#pwCheckMsg").text("")
		}

	});



	function memberCheck() {
		/* 아이디 입력 확인 */
		if (!inputIdCheck) {
			alert("아이디를 확인 해주세요!");
			$("#inputMid").focus();
			return false;
		}
		/* 비밀번호 입력 확인 */
		if ($("#inputMpw").val().length == 0 || inputpwCheck == false) {
			alert("비밀번호를 확인 해주세요!");
			$("#inputMpw").focus();
			return false;
		}


		/* 이름 입력 확인 */
		if ($("#inputMname").val().length == 0) {
			alert("이름을 입력 해주세요!");
			$("#inputMname").focus();
			return false;
		}

		/* 전화번호 입력 확인 */
		if ($("#inputTel").val().length == 0) {
			alert("전화번호를 입력 해주세요!");
			$("#inputTel").focus();
			return false;
		}

		/* 이메일 입력 확인 */
		if ($("#email").val().length == 0) {
			alert("이메일를 입력 해주세요!");
			$("#email").focus();
			return false;
		}

		/* 생년월일 입력 확인 */
		if ($("#inputDate").val().length == 0) {
			alert("생년원일을 입력 해주세요!");
			$("#inputDate").focus();
			return false;
		}

		/* 우편번호 입력 확인 */
		if ($("#sample6_postcode").val().length == 0) {
			alert("우편번호를 입력 해주세요!");
			$("#sample6_postcode").focus();
			return false;
		}

		/* 주소를 입력 확인 */
		if ($("#sample6_address").val().length == 0) {
			alert("주소를 입력 해주세요!");
			$("#sample6_address").focus();
			return false;
		}

		/* 상세주소 입력 확인 */
		if ($("#sample6_detailAddress").val().length == 0) {
			alert("상세주소를 입력 해주세요!");
			$("#sample6_detailAddress").focus();
			return false;
		}

		if (checkEmail == "NO") {
			alert("이메일 인증을 확인해주세요!");
			$("#inputCheckNum").focus();
			return false;
		}

	}
</script>