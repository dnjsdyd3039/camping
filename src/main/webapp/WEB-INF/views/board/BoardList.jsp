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
</head>

<body>
	<div class="container-xxl bg-white p-0">

		<!-- Topbar -->
		<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
		<!-- End of Topbar -->

		<div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>DataTable</h3>
                            <p class="text-subtitle text-muted">For user to check they list</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            Simple Datatable
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>City</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Graiden</td>
                                        <td>vehicula.aliquet@semconsequat.co.uk</td>
                                        <td>076 4820 8838</td>
                                        <td>Offenburg</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Dale</td>
                                        <td>fringilla.euismod.enim@quam.ca</td>
                                        <td>0500 527693</td>
                                        <td>New Quay</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nathaniel</td>
                                        <td>mi.Duis@diam.edu</td>
                                        <td>(012165) 76278</td>
                                        <td>Grumo Appula</td>
                                        <td>
                                            <span class="badge bg-danger">Inactive</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Darius</td>
                                        <td>velit@nec.com</td>
                                        <td>0309 690 7871</td>
                                        <td>Ways</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Oleg</td>
                                        <td>rhoncus.id@Aliquamauctorvelit.net</td>
                                        <td>0500 441046</td>
                                        <td>Rossignol</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kermit</td>
                                        <td>diam.Sed.diam@anteVivamusnon.org</td>
                                        <td>(01653) 27844</td>
                                        <td>Patna</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Jermaine</td>
                                        <td>sodales@nuncsit.org</td>
                                        <td>0800 528324</td>
                                        <td>Mold</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ferdinand</td>
                                        <td>gravida.molestie@tinciduntadipiscing.org</td>
                                        <td>(016977) 4107</td>
                                        <td>Marlborough</td>
                                        <td>
                                            <span class="badge bg-danger">Inactive</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kuame</td>
                                        <td>Quisque.purus@mauris.org</td>
                                        <td>(0151) 561 8896</td>
                                        <td>Tresigallo</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Deacon</td>
                                        <td>Duis.a.mi@sociisnatoquepenatibus.com</td>
                                        <td>07740 599321</td>
                                        <td>Karapınar</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Channing</td>
                                        <td>tempor.bibendum.Donec@ornarelectusante.ca</td>
                                        <td>0845 46 49</td>
                                        <td>Warrnambool</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Aladdin</td>
                                        <td>sem.ut@pellentesqueafacilisis.ca</td>
                                        <td>0800 1111</td>
                                        <td>Bothey</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Cruz</td>
                                        <td>non@quisturpisvitae.ca</td>
                                        <td>07624 944915</td>
                                        <td>Shikarpur</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Keegan</td>
                                        <td>molestie.dapibus@condimentumDonecat.edu</td>
                                        <td>0800 200103</td>
                                        <td>Assen</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ray</td>
                                        <td>placerat.eget@sagittislobortis.edu</td>
                                        <td>(0112) 896 6829</td>
                                        <td>Hofors</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Maxwell</td>
                                        <td>diam@dapibus.org</td>
                                        <td>0334 836 4028</td>
                                        <td>Thane</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Carter</td>
                                        <td>urna.justo.faucibus@orci.com</td>
                                        <td>07079 826350</td>
                                        <td>Biez</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Stone</td>
                                        <td>velit.Aliquam.nisl@sitametrisus.com</td>
                                        <td>0800 1111</td>
                                        <td>Olivar</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Berk</td>
                                        <td>fringilla.porttitor.vulputate@taciti.edu</td>
                                        <td>(0101) 043 2822</td>
                                        <td>Sanquhar</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Philip</td>
                                        <td>turpis@euenimEtiam.org</td>
                                        <td>0500 571108</td>
                                        <td>Okara</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kibo</td>
                                        <td>feugiat@urnajustofaucibus.co.uk</td>
                                        <td>07624 682306</td>
                                        <td>La Cisterna</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bruno</td>
                                        <td>elit.Etiam.laoreet@luctuslobortisClass.edu</td>
                                        <td>07624 869434</td>
                                        <td>Rocca d"Arce</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Leonard</td>
                                        <td>blandit.enim.consequat@mollislectuspede.net</td>
                                        <td>0800 1111</td>
                                        <td>Lobbes</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hamilton</td>
                                        <td>mauris@diam.org</td>
                                        <td>0800 256 8788</td>
                                        <td>Sanzeno</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Harding</td>
                                        <td>Lorem.ipsum.dolor@etnetuset.com</td>
                                        <td>0800 1111</td>
                                        <td>Obaix</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Emmanuel</td>
                                        <td>eget.lacus.Mauris@feugiatSednec.org</td>
                                        <td>(016977) 8208</td>
                                        <td>Saint-Remy-Geest</td>
                                        <td>
                                            <span class="badge bg-success">Active</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </div>





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
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>
	
</body>

</html>