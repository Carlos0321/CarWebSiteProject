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
#content_form table {border: 2px solid gray; width:90%; margin: 0px auto;}
#content_form table tr { background-color: white; height:40px; }
#content_form img{width:200px; height:100px;}
#content_form td, #content_form th {text-align: center; padding:5px; }
#content_form caption {font-size: 30px; padding:10px;}
#content_form h2, #content_form b{text-align: center; color:red;}
#content_form a { text-decoration: none; color:black;}
#content_form .left{text-align: left;}
#content_form .paging {text-align: center;}
#content_form input:not(.btn), #content_form textarea {
	width: 90%;
}
#content_form {
	width: 800px;
	height: 550px;
	margin: 20px auto 0px;
}
</style>
</head>
<body>
 	<jsp:include page="../main/header.jsp"/>
 	<div id="content_form">
 	<table>
		<caption>견적 신청 목록</caption>
		<tr><th>신청자ID</th><th>브랜드</th><th>차량모델</th><th>전시장</th><th>선납금</th><th>계약기간</th>
				<th>월 납입금</th></tr>
		
			<c:forEach var="dto" items="${estimate }">
		<tr>
		<td>${dto.mid }</td>
		<td>${dto.brandname }</td>
		<td>${dto.carname }</td>
		<td>${dto.cplace }</td>
		<td>${dto.prepayment }</td>
		<td>${dto.term }</td>
		<td>${dto.pay }</td>
		</tr>
			</c:forEach>
	</table>
 	</div>
</body>
</html>