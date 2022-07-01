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
<style >
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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<form action="${conPath }/boardModify.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bno" value="${board.bno }">
		<input type="hidden" name="dbFileName" value="${board.bfile }">
		<table>
			<caption>${board.bno }번 글 수정</caption>
			<tr><th>작성자</th>
					<td><input type="text" required="required" size="30"
								value="${board.mid }" readonly="readonly"></td>
			</tr>
			<tr><th>제목</th>
					<td><input type="text" name="bsubject" required="required" size="30"
								value="${board.bsubject }"></td>
			</tr>
			<tr><th>본문</th>
					<td><textarea rows="5" cols="32" 
							name="bcontent">${board.bcontent }</textarea></td>
			</tr>
			<tr><th>첨부파일</th>
					<td><input type="file" name="bfile" class="btn"> 원첨부파일:
							<c:if test="${not empty board.bfile }">
						 		<a href="${conPath }/boardUp/${board.bfile}" target="_blank">${board.bfile}</a>
						 	</c:if>
						 	<c:if test="${empty board.bfile }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><td colspan="2">
						<input type="submit" value="수정" class="btn">
						<input type="button" value="목록"  class="btn"
							onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'">
						<input type="reset" value="이전" class="btn"
						  onclick="history.back()">
					</td>
			</tr>
		</table>
	
	</form>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>