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
		#content_form {
				width: 800px; 
				margin: 50px auto 50px;
		}
		#content_form table {border: 2px solid gray; width:90%; margin: 0px auto;}
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <jsp:include page="../main/header.jsp" />
	<div id="content_form"> 
		<form action="${conPath }/modify.do" method="post">
			<table>
				<caption>Modify</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" value="${member.mid }" required="required">
						<div id="idConfirmResult">&nbsp;</div></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" value="${member.mname }"required="required"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mpw" required="required"></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="password" name="mpwChk" required="required">
						<div id="pwChkResult">&nbsp;</div></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="mtel" required="required" value="${member.mtel }"></td>
				</tr>
				<tr>
					<th>메일</th>
					<td><input type="email" name="memail" value="${member.memail }">
					<div id="emailConfirmResult">&nbsp;</div></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="maddress" value="${member.maddress }"></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><input type="text" name="mgrade" value="${member.mgrade }" readonly="readonly"></td>
				</tr>
				<tr><td colspan="3">
						<input type="submit" value="정보수정" class="btn">
						<input type="reset" value="초기화" class="btn">
						<input type="button" value="이전" onclick="history.go(-1)" class="btn">
						<input type="button" value="회원탈퇴" 
								onclick="location.href='${conPath}/withdrawal.do'" class="btn">	
					</td>
			</tr>
			</table>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>