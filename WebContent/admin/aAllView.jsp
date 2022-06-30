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
<style>
	#content_form {
		width: 800px; height:430px;
		margin: 70px auto 0px;
	}
#content_form table {border: 2px solid black; width:90%; margin: 0px auto;}
#content_form table tr { background-color: white; height:40px; }
#content_form table tr:hover { background-color: orange;
	cursor: pointer;
}
#content_form td, #content_form th {text-align: center; padding:5px; }
#content_form caption {font-size: 18px; padding:10px;}
#content_form h2, #content_form b{text-align: center; color:red;}
#content_form a { text-decoration: none; color:black}
#content_form .left{text-align: left;}
#content_form .paging {text-align: center;}
#content_form input:not(.btn), #content_form textarea {
	width: 90%;
}
</style>
</head>
<body>
 <c:if test="${not empty adminLoginResult }">
		<script>
			alert('${adminLoginResult}');
		</script>
	</c:if>
	<c:if test="${not empty adminLoginError }">
		<script>
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<table>
		<caption>전체회원보기</caption>
		<tr>
			<c:forEach var="dto" items="${mAllView }">
				<td>
					${dto.mname }<br>
					(${dto.mid })<br>
					${dto.mgrade }
				</td>
			</c:forEach>
		</tr>
	</table>
	<div class="paging">
		<a href="${conPath }/allView.do?pageNum=1">&lt;&lt;</a>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${startPage>BLOCKSIZE }">
			<a href="${conPath }/allView.do?pageNum=${startPage-1}">&lt;</a>
		</c:if>
		<c:if test="${startPage<=BLOCKSIZE }">
			&lt;
		</c:if>
		&nbsp; &nbsp; &nbsp;
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				[ <b>${i }</b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/allView.do?pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${endPage < pageCnt }">
			<a href="${conPath }/allView.do?pageNum=${endPage+1}">&gt;</a>
		</c:if>
		<c:if test="${endPage == pageCnt }">
			&gt;
		</c:if>
		&nbsp; &nbsp; &nbsp;
		<a href="${conPath }/allView.do?pageNum=${pageCnt}">&gt;&gt;</a>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>