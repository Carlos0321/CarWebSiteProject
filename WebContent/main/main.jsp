<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pouseidon - Free HTML5 Model Agency Bootstrap Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="favicon.ico">

<!--Google Fonts link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">


<link rel="stylesheet" href="${conPath }/assets/css/slick.css">
<link rel="stylesheet" href="${conPath }/assets/css/slick-theme.css">
<link rel="stylesheet" href="${conPath }/assets/css/animate.css">
<link rel="stylesheet" href="${conPath }/assets/css/fonticons.css">
<link rel="stylesheet"
	href="${conPath }/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="${conPath }/assets/css/bootstrap.css">
<link rel="stylesheet" href="${conPath }/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${conPath }/assets/css/bootsnav.css">


<!--Theme custom css -->
<link rel="stylesheet" href="${conPath }/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="${conPath }/assets/css/responsive.css" />

<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<!--Home Sections-->

	<section id="hello" class="img">
		<div class="overlay">
			<img src="${conPath }/assets/images/background/banner1.PNG" alt="">
		</div>
		<div class="container">
			<div class="row">
				<div class="main_home text-center">
					<div class="home_text">
						<br /> <br />
						<h4 class="text-white text-uppercase">a new creative design</h4>
						<h1 class="text-white text-uppercase">good design is always
							in season</h1>

						<div class="separator"></div>

						<h5 class=" text-uppercase text-white">
							<em>One day, the dream will come true with lorem ipsum dolor
								sit amet, consectetuer adipiscing elit, nummy nibh euismod
								tincidunt laoreet.</em>
						</h5>
					</div>
				</div>
			</div>
			<!--End off row-->
		</div>
		<!--End off container -->
	</section>
	<!--End off Home Sections-->
	<hr />
	<br />
	<!--Our Work Section-->
	<div class="container">
		<div class="col-md-12">
			<div class="head_title text-left sm-text-center wow fadeInDown">
				<h2>Community</h2>
				<h5>
					<em>The success of Pouseidon is passion and love. Meet them
						now!</em>
				</h5>
				<div class="separator_left"></div>
			</div>
		</div>
		<div class="row">
			<div class="main_work">
				<div class="col-md-7 col-md-offset-5 col-sm-12 col-xs-12">
					<div class="work_item">
						<div class="row">
							<div
								class="col-md-7 col-sm-12 col-xs-12 text-right pull-right sm-text-center">
								<div class="work_item_img">
									<img src="${conPath }/assets/images/model/p.jpg" alt="" />
								</div>
							</div>
							<div
								class="col-md-5 col-sm-12 col-xs-12 text-right pull-left sm-text-center">
								<div class="work_item_details m-top-80 sm-m-top-20">
									<h4>PORSCHE</h4>
									<div class="work_separator1"></div>
									<p class="m-top-40 sm-m-top-10">Duis autem vel eum iriure
										dolor in hendrerit in vulputate velit molestie consequat</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End off work-item -->

				<div class="col-md-7 col-sm-12 col-xs-12">
					<div class="work_item">
						<div class="row">
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="work_item_img sm-text-center sm-m-top-40">
									<img src="${conPath }/assets/images/model/L.jpg" />
								</div>
							</div>
							<div
								class="col-md-5 col-sm-12 col-xs-12 text-left pull-left sm-text-center">
								<div class="work_item_details m-top-80 sm-m-top-20">
									<h4>LAMBORGHINI</h4>
									<div class="work_separator2"></div>
									<p class="m-top-40 sm-m-top-10">Duis autem vel eum iriure
										dolor in hendrerit in vulputate velit molestie consequat</p>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- End off work-item -->

				<div class="col-md-7 col-md-offset-5 col-sm-12 col-xs-12">
					<div class="work_item">
						<div class="row">
							<div
								class="col-md-7 col-sm-12 col-xs-12 text-right pull-right sm-text-center">
								<div class="work_item_img sm-m-top-40">
									<img src="${conPath }/assets/images/model/f.jpg" />
								</div>
							</div>
							<div
								class="col-md-5 col-sm-12 col-xs-12 text-right pull-left sm-text-center">
								<div class="work_item_details m-top-80 sm-m-top-20">
									<h4>Ferrari</h4>
									<div class="work_separator1"></div>
									<p class="m-top-40 sm-m-top-10">Duis autem vel eum iriure
										dolor in hendrerit in vulputate velit molestie consequat</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End off work-item -->

				<div class="col-md-7 col-sm-12 col-xs-12">
					<div class="work_item">
						<div class="row">
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="work_item_img sm-text-center sm-m-top-40">
									<img src="${conPath }/assets/images/model/b.jpg" />
								</div>
							</div>
							<div
								class="col-md-5 col-sm-12 col-xs-12 text-left pull-left sm-text-center">
								<div class="work_item_details m-top-80 sm-m-top-20">
									<h4>BUGATTI</h4>
									<div class="work_separator2"></div>
									<p class="m-top-40 sm-m-top-10">Duis autem vel eum iriure
										dolor in hendrerit in vulputate velit molestie consequat</p>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- End off work-item -->
			</div>
		</div>
	</div>
	<hr />
	<!--Gallery Section-->
	<section id="gallery" class="gallery margin-top-120 bg-grey">
		<!-- Gallery container-->
		<div class="container">
			<div class="row">
				<div class="main-gallery roomy-80">
					<div class="col-md-12">
						<div class="head_title text-left sm-text-center wow fadeInDown">
							<h2>Brand OverView</h2>
							<h5>
								<em>Some our recent works is here. Discover them now!</em>
							</h5>
							<div class="separator_left"></div>
						</div>
					</div>
					<div class="col-md-12 m-bottom-60">
						<div class="filters-button-group text-right sm-text-center">
							 <button class="button" e2data-filter="*" onlclick="location.href='main.jsp'">View
								all</button> 
							<button class="button" data-filter=".metal"
								onclick="location.href='main.do?brandname=BMW'">BMW</button>
							<button class="button" data-filter=".transition"
								onclick="location.href='main.do?brandname=AUDI'">Audi</button>
							<button class="button" data-filter=".alkali"
								onclick="location.href='main.do?brandname=BENZ'">Mercedes-benz</button>
							<button class="button" data-filter=".ar"
								onclick="location.href='main.do?brandname=PORSCHE'">Porsche</button>
						</div>
					</div>
					<div style="clear: both;"></div>
					<div class="grid text-center">
						<c:forEach var="car"  step="1" items="${cars }">
							<div class="grid-item transition metal ium">
								<img alt="대표사진" src="${conPath }/carimg/${car.cphoto}" width="300" height="300" >
								<div class="grid_hover_area text-center">
									<div class="grid_hover_text m-top-110">
										<h4 class="text-white">${car.carname }</h4>
										<h5 class="text-white">
											<em>${car.cprice }</em>
										</h5>
										<a href="${conPath }/car/carContent.jsp?cid=${cid}"
											class="popup-img text-white m-top-40">자세히 보기<i
											class="fa fa-long-arrow-right"></i></a>
									</div>
								</div>
								</div>
								<!-- End off grid Hover area -->
								
						</c:forEach>
					</div> 
					</div>
					</div>
					</section>
					<!-- End off grid item -->
	<hr />
	<!--Models section-->
	<section id="models" class="models bg-grey roomy-80">
		<div class="container">
			<div class="row">
				<div class="main_models text-center">
					<div class="col-md-12">
						<div class="head_title text-left sm-text-center wow fadeInDown">
							<h2>Our Models</h2>
							<h5>
								<em>The success of Pouseidon is passion and love. Meet them
									now!</em>
							</h5>
							<div class="separator_left"></div>
						</div>
					</div>
					</div>
					<div class="col-md-12 m-bottom-60">
						<div class="filters-button-group text-right sm-text-center">
							<button class="button" data-filter=".metal"
								onclick="location.href='main.do?designid=10&brandname=${dto}'">sedan</button>
							<button class="button" data-filter=".transition"
								onclick="location.href='main.do?designid=30&brandname=${dto}'">coupe</button>
							<button class="button" data-filter=".alkali"
								onclick="location.href='main.do?designid=20&brandname=${dto}'">SUV</button>
							<button class="button" data-filter=".ar"
								onclick="location.href='main.do?designid=40&brandname=${dto}'">carbirolet</button>
						</div>
						
					<c:forEach var="dto" begin="1" end="7" step="1" items="${dtos }">
						<div class="col-md-3 col-sm-6">
							<div class="model_item m-top-30">
								<div class="model_img">
								<img alt="" src="${conPath }/carimg/${dto.cphoto}">
									 <div class="model_caption">
									<a href="${conPath }/car/carContent.jsp?cid=${cid}" class="text-white">자세히보기</a>
										<!-- 	class="popup-img text-white m-top-40">자세히 보기<i
											class="fa fa-long-arrow-right"></i></a> -->
										<!-- <h5 class="text-white">자세히 보기</h5> -->
									</div> 
								</div>
							</div>
						</div>
						<
						</c:forEach>
						<!-- End off col-md-3 -->
					</div>
				</div>
			</div>
	</section>

	<!--Contact Us Section-->
	<section id="contact" class="contact fix">
		<div class="container">
			<div class="row">
				<div class="main_contact p-top-100">

					<div class="col-md-6 sm-m-top-30">
						<form class="" action="subcribe.php">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Your Name *</label> <input id="first_name" name="name"
											type="text" class="form-control" required="">
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Your Email *</label> <input id="email" name="email"
											type="text" class="form-control">
									</div>
								</div>

								<div class="col-sm-12">
									<div class="form-group">
										<label>Your Message *</label>
										<textarea class="form-control" rows="6"></textarea>
									</div>
									<div class="form-group">
										<a href="" class="btn btn-default">SEND MESSAGE <i
											class="fa fa-long-arrow-right"></i></a>
									</div>
								</div>

							</div>

						</form>
					</div>

					<div class="col-md-6">
						<div class="contact_img">
							<img src="assets/images/contact-img.png" alt="" />
						</div>
					</div>


				</div>
			</div>
			<!--End off row -->
		</div>
		<!--End off container -->
	</section>
	<!--End off Contact Section-->


	<!--Company section-->

	<section id="company" class="company bg-light">
		<div class="container">
			<div class="row">
				<div class="main_company roomy-100 text-center">
					<h3 class="text-uppercase">pouseidon.</h3>
					<p>7th floor - Palace Building - 221b Walk of Fame - London-
						United Kingdom</p>
					<p>(+84). 123. 456. 789 - info@poiseidon.lnk</p>
				</div>
			</div>
		</div>
	</section>


	<!-- scroll up-->
	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>
	<!-- End off scroll up -->

	</div>
	<jsp:include page="../main/footer.jsp" />
	<!-- JS includes -->

	<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.js"></script>
	<script src="assets/js/jquery.easing.1.3.js"></script>
	<script src="assets/js/slick.min.js"></script>
	<script src="assets/js/jquery.collapse.js"></script>
	<script src="assets/js/bootsnav.js"></script>



	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>