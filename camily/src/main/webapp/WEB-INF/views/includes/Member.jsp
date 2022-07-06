<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 회원관련 모달 -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/loginScript.js"></script>
<script type="text/javascript">
	$('.modal').on('hidden.bs.modal', function(e) {
		console.log("모달창 초기화!");
		$("#joinForm")[0].reset();
		$("#idCheckMsg").text("");
		$("#pwCheckMsg").text("");
	});
</script>
<!-- 다음 우편번호 서비스 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}
</style>
<!-- 회원가입 모달 -->
<form action="memberJoin" method="post" id="joinForm"
	onsubmit="return memberCheck()">
	<div class="modal fade" id="JoinModal" tabindex="-1" role="dialog"
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
						alt="IMG-LOGO" style="width: 35%">
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
							placeholder="아이디" name="mid"
							onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">
						<span id="idCheckMsg" style="font-size: 13px"></span>
					</div>

					<div class="md-form mb-3">
						<input type="password" id="inputMpw" class="form-control validate"
							placeholder="비밀번호" name="mpw">
					</div>
					<div class="md-form mb-3">
						<input type="password" id="inputMpwCheck"
							class="form-control validate" placeholder="비밀번호 확인"> <span
							id="pwCheckMsg" style="font-size: 13px"></span>
					</div>
					<div class="md-form mb-3">
						<input type="text" id="inputMname" class="form-control validate"
							placeholder="이름" name="mname">
					</div>
					<div class="md-form mb-3">
						<input type="number" id="inputMtel" class="form-control validate"
							placeholder="전화번호 / 숫자만 입력해주세요" name="mtel">
					</div>
					<div class="md-form mb-3">
						<input type="email" id="inputMemail" class="form-control validate"
							placeholder="이메일" name="memail">
					</div>
					<div class="md-form mb-3">
						<input type="date" id="inputMbirth" class="form-control validate"
							name="mbirth">
					</div>
					<div class="row">
						<div class="col-sm-6 md-form mb-3">
							<input type="text" id="sample6_postcode"
								class="form-control validate" placeholder="우편번호"
								name="mpostcode">
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
								class="form-control validate" placeholder="상세주소"
								name="mdetailAddr">
						</div>
						<div class="col-sm-6 md-form mb-3">
							<input type="text" id="sample6_extraAddress"
								class="form-control validate" placeholder="참고항목"
								name="mextraAddr">
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
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1200">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<button class="close text-right font-weight-bold mt-2 mr-2"
				type="button" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">x&nbsp;</span>
			</button>
			<div class="modal-header text-center">
				<a class="modal-title w-100 font-weight-bold"> <img
					src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
					alt="IMG-LOGO" style="width: 50%">
				</a>
				<!-- <h4 class="modal-title w-100 font-weight-bold">회원가입</h4> -->
				<!-- <button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button> -->

			</div>
			<div class="modal-body mx-3">

				<div class="md-form mb-3">
					<input type="email" id=loginMid class="form-control validate"
						placeholder="아이디" name="">
				</div>

				<div class="md-form mb-3">
					<input type="text" id="loginMpw" class="form-control validate"
						placeholder="비밀번호" name="">
				</div>
				<div class="md-form mb-1 text-center">
					<button class="btn btn-dark">로그인</button>
					<br> <br> <a class="small" id="kakaoLoginBtn"></a>
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
<!-- 로그인 모달 끝 -->

<!-- 카카오 로그인 시작-->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('37a626201cfce25befda4da6757d4ec6');

	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
</script>

<script type="text/javascript">
	Kakao.Auth
			.createLoginButton({
				container : '#kakaoLoginBtn',
				size : 'large',
				success : function(response) {
					console.log(response);
					// 사용자 정보 가져오기
					Kakao.API
							.request({
								url : '/v2/user/me',
								success : function(res) {
									console.log(res);
									console.log("res.id : " + res.id);
									console.log("res.kakao_account.email : "
											+ res.kakao_account.email);
									console
											.log("res.kakao_account.profile.nickname : "
													+ res.kakao_account.profile.nickname);
									console
											.log("res.kakao_account.profile.profile_image_url : "
													+ res.kakao_account.profile.profile_image_url);

									kakaoLogin(
											res.id,
											res.kakao_account.email,
											res.kakao_account.profile.nickname,
											res.kakao_account.profile.profile_image_url);
									//아이디, 이메일, 닉네임, 프로필
									//controller >> service 아이디로 회원정보 조회
									//조회되는 회원 정보가 있으면 로그인 처리 후 메인페이지로
									//조회되는 회원 정보가 없으면 아이디, 이메일, 닉네임, 프로필, 회원가입 처리 >> 로그인 페이지로
								},
								fail : function(error) {
									console.error(error)
								}
							})
				},
				fail : function(error) {
					console.log(error);
				},
			});
</script>
<!-- 카카오 로그인 끝-->