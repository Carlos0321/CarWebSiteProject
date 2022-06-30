<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
  <meta charset="utf-8">
        <title>Model page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Fonts link-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
		 <!--Theme custom css -->
        <link rel="stylesheet" href="${conPath }/assets/css/style.css">
        <!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${conPath }/assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
</head>
<body>
 <jsp:include page="../main/header.jsp"/>
  <!--Home Sections-->

            <section id="hello" class="img">
                <div class="overlay">
                 <img src="${conPath }/assets/images/background/banner1.PNG"  alt=""> 
                </div>
                <div class="container">
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="model_text">
                                <h1 class="text-white text-uppercase">OUR MODELS</h1>
                                <ol class="breadcrumb">
                                    <li><a href="#">Home</a></li>
                                    <li class="active"><a href="#">OUR MODELS</a></li>
                                </ol>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->
             <!--Portfolio Section-->
            <section id="gallery" class="gallery margin-top-120 bg-white">
                <!-- Portfolio container-->
                <div class="container">
                    <div class="row">
                        <div class="main-gallery main-model roomy-80">
                            <div class="col-md-12 m-bottom-60">
                                <div class="filters-button-group sm-text-center">
                                    <button class="button is-checked" data-filter="*">View all</button>
                                    <button class="button" data-filter=".metal">Catwalk</button>
                                    <button class="button" data-filter=".transition">Advertisement</button>
                                    <button class="button" data-filter=".alkali">Fashionista</button>
                                    <button class="button" data-filter=".ar">Model Photo</button>
                                </div>
                            </div>

                            <div style="clear: both;"></div>

                            <div class="grid models text-center">
                                <div class="grid-item model-item transition metal ium">
                                    <img alt="" src="assets/images/model/1.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item metalloid " >
                                    <img alt="" src="assets/images/model/2.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item post-transition metal">
                                    <img alt="" src="assets/images/model/3.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item post-transition metal ium" >
                                    <img alt="" src="assets/images/model/4.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item metal ar" >
                                    <img alt="" src="assets/images/model/5.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/6.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/7.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/8.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/9.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/10.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/11.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->

                                <div class="grid-item model-item alkali ar" >
                                    <img alt="" src="assets/images/model/12.jpg">
									<a href="model-details.html" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->
                            </div>

                            <div style="clear: both;"></div>

                        </div>
                    </div>
                </div><!-- Portfolio container end -->
            </section><!-- End off portfolio section -->
            
 <jsp:include page="../main/footer.jsp"/>
</body>
</html>