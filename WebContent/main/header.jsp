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
<body data-spy="scroll" data-target=".navbar-collapse">
	<!-- Start Header Navigation -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#navbar-menu">
			<i class="fa fa-bars"></i>
		</button>

	</div>
	<!-- End Header Navigation -->
	<!-- 로그인 전 화면 -->
	<c:if test="${empty member and empty admin}">
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-menu">
			<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
				data-out="fadeOutUp">
				<li><a href="${conPath }/main.do">home</a></li>
				<li><a href="${conPath }/joinView.do">join</a></li>
				<li><a href="${conPath }/loginView.do">login</a></li>
				<li><a href="${conPath }/carlistView.do">model</a></li>
				<li><a href="${conPath }/boardList.do">community</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</c:if>
	
	<%-- 사용자 모드 로그인 화면--%>
	<c:if test="${not empty member and empty admin}">
		<div class="collapse navbar-collapse" id="navbar-menu">
			<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
				data-out="fadeOutUp">
				<li><a href="${conPath }/main.do">home</a></li>
				<li><a href="${conPath }/modifyView.do">modify</a></li>
				<li><a href="${conPath }/logout.do">logout</a></li>
				<li><a href="${conPath }/carlistView.do">model</a></li>
				<li><a href="${conPath }/boardList.do">community</a></li>
				<li><a href="${conPath }/contactView.do">contact</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</c:if>
	
	<%-- 관리자 모드 로그인 화면--%>
	<c:if test="${empty member and not empty admin}"> 
	<div class="collapse navbar-collapse" id="navbar-menu">
			<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
				data-out="fadeOutUp">
				<li><a href="${conPath }/main.do">home</a></li>
				<li><a href="${conPath }/logout.do">logout</a></li>
				<li><a href="${conPath }/carlistView.do">model</a></li>
				<li><a href="${conPath }/BoardModifyView.do">community</a></li>
			</ul>
		</div>
	</c:if>
</html>