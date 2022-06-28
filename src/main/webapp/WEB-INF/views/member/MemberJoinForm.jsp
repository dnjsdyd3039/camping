<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>App landing</title>
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
<!-- Preloader Start-->


<!-- Register -->

<main class="login-body"
	data-vide-bg="${pageContext.request.contextPath }/resources/member/img/login-bg.mp4">
	<!-- Login Admin -->
	<form class="form-default" action="login-bg.mp4" method="POST">

		<div class="login-form">
			<!-- logo-login -->
			<div class="logo-login">
				<a href="index.html"><img
					src="${pageContext.request.contextPath }/resources/member/img/logo/loder.png"
					alt=""></a>
			</div>
			<h2>Registration Here</h2>

			<div class="form-input">
				<label for="name">Full name</label> <input type="text" name="name"
					placeholder="Full name">
			</div>
			<div class="form-input">
				<label for="name">Email Address</label> <input type="email"
					name="email" placeholder="Email Address">
			</div>
			<div class="form-input">
				<label for="name">Password</label> <input type="password"
					name="password" placeholder="Password">
			</div>
			<div class="form-input">
				<label for="name">Confirm Password</label> <input type="password"
					name="password" placeholder="Confirm Password">
			</div>
			<div class="form-input pt-30">
				<input type="submit" name="submit" value="Registration">
			</div>
			<!-- Forget Password -->
			<a href="memberLoginForm" class="registration">login</a>
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

</body>
</html>