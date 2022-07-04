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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

</style>
</head>
<body>
 <jsp:include page="../main/header.jsp"/>
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
	
	<!--Model Details Section-->
            <section id="m_details" class="m_details roomy-100 fix">
                    <div class="row">
                        <div class="main_details">
                            <div class="col-md-6">
                                <div class="m_details_img">
                                    <img src="${conPath }/carimg/${getCar.cphoto}" alt="" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="m_details_content m-bottom-40">
                                    <h2>${getCar.carname }</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
                                        enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit 
                                        lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure
                                        dolor in hendrerit in vulputate velit esse molestie consequat, vel illum 
                                        dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio 
                                        dignissim qui blandit praesent luptatum zzril delenit augue duis dolore.</p>
                                    <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium 
                                        lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, 
                                        anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta
                                        decima.</p>
                                </div>
                                <hr />
                                <div class="person_details m-top-40">
                                    <div class="row">
                                        <div class="col-md-5 text-left">
                                           	<p>브랜드:</p>
                                            <p>차 이름:</p>
                                            <p>차 유형:</p>
                                            <p>가격:</p>
                                            <p>연료:</p>
                                            <p>연비:</p>
                                        </div>
                                        <div class="col-md-7 text-left">
                                            <p>${getCar.brandname }</p>
                                            <p>${getCar.carname }</p>
                                            <p>${getCar.designname }</p>
                                            <p>${getCar.cprice }</p>
                                            <p>${getCar.cfuel }</p>
                                            <p>${getCar.cmile }</p>
                                        </div>
                                        <div id ="content_form">
                                        <table>
                                        <tr >
                                        <td colspan="3">
                                        <input type="submit" value="시승예약" class="btn"  width="500px"
                                        onclick ="location='${conPath}/car/contact.jsp?mid=${member.mid }'">
                                        <c:if test="${not empty member.mid && member.mgrade < 5 }">
										<td><input type="button" value="차량견적" class="btn" onclick="location='${conPath}/estimate.do?cid=${getCar.cid }'"></td>                                          
                                        </c:if>
                                        <td><input type="reset" value="이전" class="btn"
										  onclick="history.back()"></td>
                                        </tr>
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            </div>
                            </section>
 <jsp:include page="../main/footer.jsp"/>
</body>
</html>