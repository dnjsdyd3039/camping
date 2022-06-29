<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Navbar Start -->
<div class="container-fluid nav-bar bg-transparent">
<script src="https://kit.fontawesome.com/a6d95e01a9.js" crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
		<a href="main"
			class="navbar-brand d-flex align-items-center text-center">
			<div class="icon p-2 me-2">
				<img class="img-fluid"
					src="${pageContext.request.contextPath }/resources/img/public_FILL0_wght400_GRAD0_opsz48.png"
					alt="Icon" style="width: 30px; height: 30px;">
			</div>
			<h1 class="m-0 text-primary">캐밀리!</h1>
		</a>
		<button type="button" class="navbar-toggler" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto">
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown">여행지</a>
					<div class="dropdown-menu rounded-0 m-0">
						<a href="property-list.html" class="dropdown-item">관광지</a> <a
							href="property-agent.html" class="dropdown-item">축제</a> <a
							href="property-type.html" class="dropdown-item">숙박</a> <a
							href="property-agent.html" class="dropdown-item">음식</a>
					</div>
				</div>
				<!-- <a href="about.html" class="nav-item nav-link">About</a> -->
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown">게시판</a>
					<div class="dropdown-menu rounded-0 m-0">
						<a href="property-list.html" class="dropdown-item">여행후기</a> <a
							href="property-type.html" class="dropdown-item">음식후기</a> <a
							href="property-agent.html" class="dropdown-item">숙박후기</a> <a
							href="property-agent.html" class="dropdown-item">축제후기</a>
					</div>
				</div>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown">캠핑</a>
					<div class="dropdown-menu rounded-0 m-0">
						<a href="campingShow" class="dropdown-item">캠핑용품</a> <a
							href="404.html" class="dropdown-item">404 Error</a>
					</div>
				</div>
				<a href="contact.html" class="nav-item nav-link">Contact</a>
			</div>
			<!-- 회원가입 아이콘 -->
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"><i class="fa-regular fa-circle-user"
					style="font-size: 30px;"></i></a>
				<div class="dropdown-menu rounded-0 m-0">
									
					<c:choose>
						<c:when test="${sessionScope.loginId == null}">
							<a href="memberJoinForm" class="dropdown-item">회원가입</a> 
							<a href="memberLoginForm" class="dropdown-item">로그인</a>
						</c:when>
						<c:otherwise>
							<a href="memberInfo" class="dropdown-item">내정보</a> 
							<a href="memberLogout" class="dropdown-item">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
	</nav>
</div>
<!-- Navbar End -->