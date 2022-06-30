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
			width: 800px; height:400px;
			margin: 100px auto 0px;
		}
		#content_form {
	width: 800px;
	height: 550px;
	margin: 20px auto 0px;
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
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
 <jsp:include page="../main/header.jsp"/>
 <div id="content_form">
		<form action="${conPath }/boardWrite.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>글쓰기</caption>
				<tr><td>제목</td><td><input type="text" name="bsubject"
								required="required" size="30"></td></tr>
				<tr><td>본문</td><td><textarea name="bcontent" rows="3" 
								cols="32"></textarea></td></tr>
				<tr><td>첨부파일</td><td><input type="file" name="bfile"></td></tr>
				<tr><td colspan="2">
							<input type="submit" value="글쓰기" class="btn">
							<input type="reset" value="취소" class="btn">
							<input type="button" value="목록" class="btn"
								onclick="location.href='${conPath}/boardList.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>