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

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />

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
<link rel="stylesheet" href="${conPath }/assets/css/style1.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="${conPath }/assets/css/responsive.css" />
<style>
a{color: black};
[type=submit] {
  -webkit-appearance: button;
}
button:not(:disabled),
[type=button]:not(:disabled),
[type=reset]:not(:disabled),
[type=submit]:not(:disabled) {
  cursor: pointer;
}
</style>
<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<script>
$(document).ready(function() {
	$('#estimate').click(function() {
		alert('신청이 완료되었습니다.');
	});
});

$(document).ready(function() {
	$('#call').click(function() {
		alert('현재 문의량이 많아 상담이 지연되고있습니다. 죄송합니다');
	});
});
</script>
<body>
<c:if test="${not empty errorMsg}">
		<script>
			alert('${errorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty loginErrorMsg }">
	<script>
		alert('${loginErrorMsg}');
		history.back();
	</script>
	</c:if>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${brandOverView == 1 }">
		<script>
			location.href = '#brandOverView';
		</script>
	</c:if>
	<c:if test="${OurModels == 2}">
		<script>
		location.href = '#OurModels';
		</script>
	</c:if>
	
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
									<a href="https://www.porsche.com/korea/ko/"><img src="${conPath }/assets/images/model/p.jpg" alt=""/></a>
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
									<a href="https://www.lamborghini.com/en-en"><img src="${conPath }/assets/images/model/L.jpg" /></a>
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
									<a href="https://www.ferrari.com/ko-KR"><img src="${conPath }/assets/images/model/f.jpg" /></a>
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
									<a href="https://www.bugatti.com/"><img src="${conPath }/assets/images/model/b.jpg" /></a>
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
							<h2 id="brandOverView">Brand OverView</h2>
							<h5>
								<em>Some our recent works is here. Discover them now!</em>
							</h5>
							<div class="separator_left"></div>
						</div>
					</div>
					<div class="col-md-12 m-bottom-60">
						<div class="filters-button-group text-right sm-text-center">
							 <button class="button" data-filter="*" onclick="location.href='main.do'">View
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
					  <div class="grid models text-center">
					  <c:forEach var="car"  items="${cars }">
                                <div class="grid-item model-item transition metal ium"  >
                                    <img alt="" src="${conPath }/carimg/${car.cphoto}" width="300" height="174" >
                                      <h4>${car.carname }</h4>
                              		  <h5>${car.cprice }</h5>
									<a href="carDetail.do?cid=${car.cid }" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->
                       </c:forEach>
                    </div>
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
							<h2 id="OurModels">Our Models</h2>
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
								onclick="location.href='main.do?designname=SEDAN&brandname=${param.brandname}'">sedan</button>
							<button class="button" data-filter=".transition"
								onclick="location.href='main.do?designname=COUPE&brandname=${param.brandname}'">coupe</button>
							<button class="button" data-filter=".alkali"
								onclick="location.href='main.do?designname=SUV&brandname=${param.brandname}'">SUV</button>
							<button class="button" data-filter=".ar"
								onclick="location.href='main.do?designname=Carbirolet&brandname=${param.brandname}'">carbirolet</button>
						</div>
						
						 <div class="grid models text-center" >
						 <c:forEach var="dto" items="${dtos }">
                                <div class="grid-item model-item transition metal ium" style="width:270px; height:290px;">
                                    <img alt="" src="${conPath }/carimg/${dto.cphoto}" width="200" height="150">
                                      <h4>${dto.carname }</h4>
                              		  <h5>${dto.cprice }</h5>
									<a href="carDetail.do?cid=${dto.cid }" class="btn btn-default m-top-20">View Details<i class="fa fa-long-arrow-right"></i></a>
                                </div><!-- End off grid item -->
                         </c:forEach>
					</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contact Us</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <!-- * * * * * * * * * * * * * * *-->
                <!-- * * SB Forms Contact Form * *-->
                <!-- * * * * * * * * * * * * * * *-->
                <!-- This form is pre-integrated with SB Forms.-->
                <!-- To make this form functional, sign up at-->
                <!-- https://startbootstrap.com/solution/contact-forms-->
                <!-- to get an API token!-->
                <form action="${conPath }/msgWrite.do">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- Name input-->
                                <input class="form-control" id="name" name="mname" type="text" placeholder="Your Name *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <div class="form-group">
                                <!-- Email address input-->
                                <input class="form-control" id="email" name="memail" type="email" placeholder="Your Email *" data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                <!-- Phone number input-->
                                <input class="form-control" id="phone" type="tel" name="mphone" placeholder="Your Phone *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <!-- Message input-->
                                <textarea class="form-control" id="message" name="memo" placeholder="Your Message *" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                        </div>
                    </div>
                    <!-- Submit success message-->
                    <!---->
                    <!-- This is what your users will see when the form-->
                    <!-- has successfully submitted-->
                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center text-white mb-3">
                            <div class="fw-bolder">Form submission successful!</div>
                            To activate this form, sign up at
                            <br />
                        </div>
                    </div>
                    <!-- Submit error message-->
                    <!---->
                    <!-- This is what your users will see when there is-->
                    <!-- an error submitting the form-->
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    <!-- Submit Button-->
                    <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase " id="submitButton" type="submit">Send Message</button></div>
                </form>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2022</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                         <b><a href="${conPath }/adminLoginView.do">관리자 모드</a></b>
                    </div>
                </div>
            </div>
        </footer>


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
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>