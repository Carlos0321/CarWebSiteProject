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
<style>
#content_form {
	width: 800px;
	height: 550px;
	margin: 20px auto 0px;
}

#content_form table {
	border: 2px solid gray;
	width: 90%;
	margin: 0px auto;
}

#content_form table tr {
	background-color: white;
	height: 40px;
}

#content_form td,#content_form th {
	text-align: center;
	padding: 5px;
}

intput#sample4_postcode.td1 {
	width: 120px;
	overflow: hidden;
}

input.btn1 {
	width: 120px;
}

#content_form caption {
	font-size: 30px;
	padding: 10px;
}

#content_form h2, #content_form b {
	text-align: center;
	color: red;
}

#content_form a {
	text-decoration: none;
	color: black;
}

#content_form .left {
	text-align: left;
}

#content_form .paging {
	text-align: center;
}

#content_form input[type="text"]:not(.td1), #content_form input[type="date"], #content_form select, #content_form textarea {
	width: 60%;
}
#content_form input[type="text"].td1 {
	width: 50%;
}
#content_form input[type="button"].btn1{
	width: 50px;
	font-size:5pt;
}
#content_form td {
	width: 500px;
}

#content_form .td1 {
	width: 50px;
	overflow: hidden;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						document.getElementById("sample4_engAddress").value = data.addressEnglish;

						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	$(document).ready(function() {
		$('#reserve').click(function() {
			alert('신청이 완료되었습니다.');
		});
	});

	$(document).ready(function() {
		$('#call').click(function() {
			alert('현재 문의량이 많아 상담이 지연되고있습니다. 죄송합니다');
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/reserve.do" method="post">
			<table>
				<caption>시승&구매상담</caption>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" required="required" value="${member.mname }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="mtel" required="required" value="${member.mtel }"></td>
				</tr>
				
				<tr>
					<th>전시장</th>
					<td><input type="text" id="sample4_postcode" placeholder="우편번호" class="td1">
					 <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn1" ><br>
						<input type="text" id="sample4_roadAddress" class="in" name="cplace" placeholder="도로명주소" size="60" name="cplace"><br>
						 <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="60"> 
						 <span id="guide" style="color: #999; display: none"></span> 
						 <input type="text"  id="sample4_detailAddress" class="in" name="add2" placeholder="상세주소" size="60"><br> 
						 <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="60">
						 <input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="60"><br></td>
				</tr>
				<tr>
					<th>예약날짜</th>
					<td><input type="date" name="rdate" required="required"></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><select  name="rtime" required="required">
							<option>10:00</option>
							<option>11:00</option>
							<option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
					</select></td>
				</tr>
				<c:if test="${not empty member.mid}">
				<tr>
					<th>브랜드</th>
					<td><input type="text" name="brandname"  value="${param.brandname }"></td>
				</tr>
				<tr>
					<th>차종</th>
					<td><input type="text" name="carname" value="${param.carname }"></td>
				</tr>
				</c:if>
				<%-- <c:if test="${empty member.mid }">
				<tr>
					<th>브랜드</th>
					<td><td>전시장</td>
								<td><select  name="cplace">
								<option>AUDI</option>
								<option>BMW</option>
								<option>Benz</option>
								<option>PORSCHE</option>
								</select></td>
				</tr>
				<tr>
					<th>차종</th>
					<td><input type="text" name="carname" value="${getCar.carname }"></td>
				</tr>
				</c:if> --%>
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="시승신청" class="btn" id="reserve">
						<input type="button" value="전화상담" class="btn" id ="call"
						onclick="location.href='${conPath}/main.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>