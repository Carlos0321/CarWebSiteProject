<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style type="text/css">
#content_form {
   width: 800px;
   
   margin: 130px auto 0px;
}
#content_form table {border: 2px solid black; width:90%; margin: 0px auto;}
#content_form table tr { background-color: white; height:40px; }
#content_form td, #content_form th {text-align: center; padding:5px; }
#content_form caption {font-size: 30px; padding:10px;}
#content_form h2, #content_form b{text-align: center; color:red;}
#content_form a { text-decoration: none; color:black}
#content_form .left{text-align: left;}
#content_form .paging {text-align: center;}
#content_form input:not(.btn), #content_form textarea {
   width: 90%;
}
</style>
<script>
	$(function() {
		$("#mbirth").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					showMonthAfterYear : true,
					yearSuffix : '년', // "2020년 3월"
					showOtherMonths : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
					minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
					maxDate : 'y', // 현재 날짜이전까지만 표시
					yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
				});
	});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
 <div id="content_form">
   <form action="${conPath }/login.do" method="post">
      <table>
         <caption>Login</caption>
         <tr><th>ID</th><td><input type="text" name="mid" value="${mid }" required="required"></td></tr>
         <tr><th>PW</th><td><input type="password" name="mpw" required="required"></td></tr>
         <tr><td colspan="2">
                  <input type="submit" value="로그인" class="btn">
                  <input type="button" value="회원가입" class="btn"
                           onclick="location.href='${conPath}/joinView.do'">
      </table>
   </form>
   </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>