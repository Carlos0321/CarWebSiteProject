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
<link href="conPath/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
		#content_form {
			width: 800px; height:400px;
			margin: 100px auto 0px;
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
		<form action="${conPath }/boardReply.do" method="post" enctype="multipart/form-data">
			<!-- reply.do시 필요한 원글 정보 : bgroup, bstep, bindent
			                              지금 입력할 답변글 : bName, bsubject, bcontent
			                       pageNum -->
			<input type="hidden" name="bgroup" value="${originBoard.bgroup }">
			<input type="hidden" name="bstep" value="${originBoard.bstep }">
			<input type="hidden" name="bindent" value="${originBoard.bindent }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<caption>${originBoard.bno }번글의 답변쓰기 </caption>
				<tr><td>작성자</td><td>${member.mname }(${member.mid })</td></tr>
				<tr><td>제목</td><td><input type="text" name="bsubject"
								required="required" size="30"
								value="[답]${originBoard.bsubject }"></td></tr>
				<tr><td>본문</td><td><textarea name="bcontent" rows="3" cols="3"></textarea></td></tr>
				<tr><td>사진</td><td><input type="file" name="bfile"></td></tr>
				<tr><td colspan="2">
							<input type="submit" value="답변쓰기" class="btn">
							<input type="reset" value="취소" class="btn">
							<input type="button" value="목록" class="btn"
								onclick="location.href='${conPath}/boardList.do'">
			</table>
		</form>
	</div>
 <jsp:include page="../main/footer.jsp"/>
</body>
</html>