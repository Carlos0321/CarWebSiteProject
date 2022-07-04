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
<style>
#content_form table {border: 2px solid black; width:90%; margin: 0px auto;}
#content_form table tr { background-color: white; height:40px; }
#content_form td, #content_form th {text-align: center; padding:5px; }
#content_form caption {font-size: 30px; padding:10px;}
#content_form h2, #content_form b{text-align: center; color:red;}
#content_form a { text-decoration: none; color:black;}
#content_form .left{text-align: left;}
#content_form .paging {text-align: center;}
#content_form input:not(.btn), #content_form textarea {
	width: 90%;
}
</style>
</head>
<body>
 	<jsp:include page="../main/header.jsp"/>
 	<section id="m_details" class="m_details roomy-100 fix">
		<div class="row">
			<div class="main_details">
				<div class="col-md-6">
					<div class="m_details_img">
						<img src="${conPath }/carimg/${getCar.cphoto}" alt="" />
						<h2 class="text">${getCar.carname }</h2>
						<h2>${getCar.cprice }</h2>
					</div>
				</div>
				<div class="col-md-6">
					<div class="m_details_content m-bottom-40">
						<h2>장기렌터카 견적 요청</h2>
						
					</div>
					<hr />
					<div class="person_details m-top-40">
						<div class="row">
							<div class="col-md-5 text-left">
								<table  id ="content_form">
								<tr>
								<td>아이디</td>
								<td><input type="text" name="mid" required="required" value="${member.mid }"></td>
								</tr>
								<tr>
								<td>이름</td>
								<td><input type="text" name="mname" required="required" value="${member.mname }"></td>
								</tr>
								<tr>
								<td>연락처</td>
								<td><input type="text" name="mtel" required="required" value="${member.mtel }"></td>
								</tr>
								<tr>
								<td>주소</td>
								<td><input type="text" name="maddress"></td>
								</tr>
								<tr>
								<td>전시장</td>
								<td><select multiple="multiple" name="display">
								<option>서울시 강남구 청담동</option>
								<option>서울시 강남구 역삼동</option>
								<option>서울시 강남구 삼성동</option>
								<option>서울시 강남구 대치동</option>
								<option>서울시 서초구 서초동</option>
								<option>서울시 송파구 방이동</option>
								</select>
								</td>
								</tr>
								</table>
							</div>
							<div class="col-md-7 text-left">
								<table  id ="content_form">
								<tr><td>브랜드</td>
								<td><input type="text" name="brandname" required="required" value="${getCar.brandname }"></td>
								</tr>
								<tr><td>차량 모델</td>
								<td><input type="text" name="carname" required="required" value="${getCar.carname }"></td>
								</tr>
								<tr><td>디자인</td>
								<td><input type="text" name="designname" required="required" value="${getCar.designname }"></td>
								</tr>
								<tr><td>상품명</td>
								<td><input type="text" name="brandname" required="required" value="장기렌터카"></td>
								</tr>
								<tr>
								<td>차량가</td>
								<td><input type="text" name="cprice" required="required" value="${getCar.cprice }"></td>
								</tr>
								<tr>
								<td>선납금/선수금</td>
								<td><select  name="prepayment" required="required">
								<option>20%</option>
								<option>30%</option>
								</select></td>
								</tr>
								<tr>
								<td>계약기간</td>
								<td><select  name="prepayment" required="required">
								<option>36개월</option>
								<option>48개월</option>
								</select></td>
								</tr>
								<tr>
								<td>월 납입금</td>
								<td><input type=""></td>
								</tr>
								<tr>
								<td><input type="submit" value="신청하기"  class="btn" width="90%"></td>
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