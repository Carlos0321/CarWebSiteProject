<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
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



<link rel="stylesheet" href="${conPath }/assets/css/bootstrap.css">
<link rel="stylesheet" href="${conPath }/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${conPath }/assets/css/bootsnav.css">


<!--Theme custom css -->
<link rel="stylesheet" href="${conPath }/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="${conPath }/assets/css/responsive.css" />
<style>
a {
	color: black
}
;
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<section id="hello" class="img">
		<div class="overlay">
			<img src="${conPath }/assets/images/background/banner2.PNG"
				width="1200" height="800">
		</div>
		<div class="container">
			<div class="row">
				<div class="main_home text-center">
					<div class="home_text">
						<br /> <br />
						<h1 class="text-white text-uppercase">News & Magazine</h1>

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
	<br />
	<br />
	<br />

	<div class="container">
		<div class="col-md-12">
			<div class="head_title text-left sm-text-center wow fadeInDown">
				<h2>News/Magazine</h2>
				<h5>
					<em>The success of Pouseidon is passion and love. Meet them
						now!</em>
				</h5>
				<div class="separator_left"></div>
			</div>
		</div>
		
	<!-- End off work-item -->
	<div class="col-md-7 col-md-offset-5 col-sm-12 col-xs-12">
					<div class="work_item">
						<div class="row">
							<div
								class="col-md-7 col-sm-12 col-xs-12 text-right pull-right sm-text-center">
								<div class="work_item_img">
									<a href="https://www.porsche.com/korea/ko/social-media/#!/"><img
										src="${conPath }/boardUp/news3.PNG" alt="" /></a>
								</div>
							</div>
							<div
								class="col-md-5 col-sm-12 col-xs-12 text-right pull-left sm-text-center">
								<div class="work_item_details m-top-80 sm-m-top-20">
									<h4>[Porsche World Roadshow 2022]</h4>
									<div class="work_separator1"></div>
									<p class="m-top-40 sm-m-top-10">?????? ????????? ??????, ?????? ????????? ???????????? ?????? ?????? ????????????? 2022 PWRS?????? ?????? ????????? ???????????? ????????? GTS??? ?????? ????????? ????????? ????????? ???????????????! ----</p>
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
						<a href="https://www.mercedes-benz.co.kr/passengercars/the-brand/NewsEvent/latest-2020.module.html"><img
							src="${conPath }/boardUp/news5.PNG" /></a>
					</div>
				</div>
				<div
					class="col-md-5 col-sm-12 col-xs-12 text-left pull-left sm-text-center">
					<div class="work_item_details m-top-80 sm-m-top-20">
						<h4>???????????????-?????? EQ POWER ?????????????????? ?????? 100% ??????</h4>
						<div class="work_separator2"></div>
						<p class="m-top-40 sm-m-top-10">BC ???????????? ?????? ?????? ?????? ?????? ?????? 50% ????????? ???????????????-?????? ?????????-??? ??????????????? (EQ POWER) ???????????? ?????? ?????? 50% ?????? ???????????? ????????????.</p>
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
								<div class="work_item_img">
									<a href="https://www.porsche.com/korea/ko/social-media/#!/"><img
										src="${conPath }/boardUp/news4.PNG" alt="" /></a>
								</div>
							</div>
							<div
								class="col-md-5 col-sm-12 col-xs-12 text-right pull-left sm-text-center">
								<div class="work_item_details m-top-80 sm-m-top-20">
									<h4>??? ????????? ???????????? ????????? ??????</h4>
									<div class="work_separator1"></div>
									<p class="m-top-40 sm-m-top-10"> [The new Taycan Cross Turismo] ???????????? ??? ????????? ????????? ?????? Soul, electrified. The new Taycan Cross Turismo. ??? #Porsche #PorscheKorea #TaycanCrossTurismo #TaycanCT #????????? #?????????????????? #?????????????????????????????? #?????????CT</p>
								</div>
							</div>
						</div>
					</div>
				</div>
	
</body>
</html>