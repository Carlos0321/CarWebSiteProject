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
		#content_form {
			width: 1000px; height:600px;
			margin: 100px auto 0px;
		}
		body { 
	background-color: #FFF0B5; 
	font-size: 9pt;
}

#content_form table {border: 2px solid gray; width:90%; margin: 0px auto;}
#content_form table tr { background-color: white; height:40px; }
#content_form img{width:400px; height:300px;}
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
 <div id="content_form">
		<table>
				 <caption>${board.bno }번 리뷰</caption>
				 <tr><td>작성자</td>
				 		 <td>${board.mid}님</td>
				 </tr>
				 <tr><td>제목</td>
				 		 <td>${board.bsubject }</td>
				 </tr>
				 <tr>
				 	<td>
				 		<c:if test="${not empty board.bfile }">
				 		<%-- <a href="${conPath }/boardUp/${board.bfile}" target="_balnk">${board.bfile }</a> --%>
				 		<td><img src="${conPath }/boardUp/${board.bfile}" width="200"></td>
				 		</c:if>
				 		<c:if test="${empty board.bfile }">
				 		첨부파일 없음
				 		</c:if>
				 	</td>
				</tr>
				 <tr><td>본문</td><td><textarea rows="5" cols="32">${board.bcontent}</textarea></td>
				 		<!--   <td><pre>${board.bcontent}</pre></td>-->
				 </tr>
				 <tr><td colspan="2">
				 			<c:if test="${member.mid eq board.mid }">
				 				<button class="btn" onclick="location='${conPath}/boardModifyView.do?bno=${board.bno }&pageNum=${param.pageNum }'">수정</button>
				 			</c:if>
				 			<c:if test="${member.mid eq board.mid or not empty admin}">
				 				<button class="btn" onclick="location='${conPath}/boardDelete.do?bno=${board.bno }&pageNum=${param.pageNum }'">삭제</button>
				 			</c:if>
				 			<c:if test="${not empty member }">
				 				<button class="btn" onclick="location='${conPath}/boardReplyView.do?bno=${board.bno }&pageNum=${param.pageNum }'">답변</button>
				 			</c:if>
				 			<input type="button" value="목록" class="btn"
				 	onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'">	
				
				</table>
				</div> 
				 	<jsp:include page="../main/footer.jsp"/>
</body>
</html>