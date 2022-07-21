<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<script type="text/javascript">
(function ($) {
    "use strict";

    /*[ Load page ]
    ===========================================================*/
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'html',
        loadingClass: 'animsition-loading-1',
        loadingInner: '<div class="loader05"></div>',
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: [ 'animation-duration', '-webkit-animation-duration'],
        overlay : false,
        overlayClass : 'animsition-overlay-slide',
        overlayParentElement : 'html',
        transition: function(url){ window.location.href = url; }
    });
    
})(jQuery);
</script>
<!--===============================================================================================-->
<script src="https://kit.fontawesome.com/e9a5166904.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>

