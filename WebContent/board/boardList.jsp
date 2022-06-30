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
			$('tr').click(function(){
				var mid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
				//alert(fId);
				if(!isNaN(mid)){
					location.href = '${conPath}/boardContent.do?mid='+mid+'&pageNum=${pageNum}';
				}
			});
		});
	</script>
</head>
<body>
 	<c:if test="${not empty boardResult }">
 		<script>alert('${boaredResult}');</script>
 	</c:if>
 	<jsp:include page="../main/header.jsp"/>
 	<div id="content_form">
 	<table>
		<tr><td>
					<c:if test="${not empty member }"><a href="${conPath }/boardWriteView.do">글쓰기</a></c:if>
					<c:if test="${empty member }"><a href="${conPath }/loginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></c:if>
		</td></tr>
	</table>
	<table>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>리뷰사진</th><th>조회수</th>
				<th>날짜</th></tr>
		<c:if test="${totCnt==0 }">
			<tr><td colspan="6">등록된 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${totCnt!=0 }">
			<c:forEach items="${boardList }" var="board">
				<tr><td>${board.mid }</td>
						<td>${board.mname }</td>
						<td class="left">
							<c:forEach var="i" begin="1" end="${board.bindent }">
								<c:if test="${i==board.bindent }">└─</c:if>
								<c:if test="${i!=board.bindent }"> &nbsp; &nbsp; </c:if>
							</c:forEach>
							${board.bsubject } <!-- 글제목에 a태그를 걸지 말고 query로 tr을 클릭하면 상세보기 페이지로 가기 -->
							<c:if test="${not empty board.bfile }">
								<td><img src="${conPath }/boardUp/WINTER.JPG" width="100"></td>
							</c:if>
						</td>
						<td>${board.bhit }</td>
						<td><fmt:formatDate value="${board.bRdate }" type="date" dateStyle="short"/></td>
						<td>${board.bip }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/boardList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/boardList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/boardList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>