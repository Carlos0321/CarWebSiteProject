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
 <link rel="stylesheet" href="${conPath }/assets/css/login.css">
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('input[name="mid"]').keyup(function() {
							var mid = $('input[name="mid"]').val();
							$.ajax({
								url : '${conPath}/idConfirm.do',
								type : 'get',
								dataType : 'html',
								data : "mid=" + mid,
								success : function(data) {
									$('#idConfirmResult').html(data);
								}
							});//ajax
						});// mid keyup 이벤트
						$('input[name="mpw"], input[name="mpwChk"]').keyup(
								function() {
									var mpw = $('input[name="mpw"]').val();
									var mpwChk = $('input[name="mpwChk"]')
											.val();
									if (mpw == mpwChk) {
										$('#pwChkResult').text('비밀번호 일치');
									} else {
										$('#pwChkResult').html(
												'<b>비밀번호 불일치</b>');
									}
								}); // pw check
						$('input[name="memail"]')
								.keyup(
										function() {
											var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
											var memail = $(
													'input[name="memail"]')
													.val();
											if (patternMail.test(memail)) {
												$
														.ajax({
															url : '${conPath}/emailConfirm.do',
															type : 'get',
															dataType : 'html',
															data : "memail="
																	+ memail,
															success : function(
																	data) {
																$(
																		'#emailConfirmResult')
																		.html(
																				data);
															}
														});//ajax
											} else if (!memail) {
												$('#emailConfirmResult').html(
														' &nbsp; ');
											} else {
												$('#emailConfirmResult').html(
														'메일 형식을 지켜주세요');
											}//if
										});// mEmail keyup 이벤트
						$('form')
								.submit(
										function() {
											var idConfirmResult = $(
													'#idConfirmResult').text()
													.trim();
											var pwChkResult = $('#pwChkResult')
													.text().trim();
											var emailConfirmResult = $(
													'#emailConfirmResult')
													.text().trim();
											if (idConfirmResult != '사용 가능한 ID') {
												alert('사용가능한 ID로 가입하세요');
												$('input[name="mid"]').focus();
												return false;
											} else if (pwChkResult != '비밀번호 일치') {
												alert('비밀번호를 확인하세요');
												$('input[name="mpw"]').focus();
												return false;
											} else if (emailConfirmResult != ''
													&& emailConfirmResult != '사용 가능한 메일입니다') {
												alert('이메일을 확인하세요');
												$('input[name="memail"]')
														.focus();
												return false;
											}
										});
					});//mIdConfirm의 click이벤트
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
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
    <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
           <div class="col-md-5">
             <img src="${conPath }/assets/images/login1.jpg" alt="login" class="login-card-img" style="height:900px;"> 
          </div>
          <div class="col-md-7">
            <div class="card-body">
              
              <p class="login-card-description">JOIN </p>
              <form action="${conPath }/join.do" method="post">
				 <div class="form-group">
                    <label for="mname" class="sr-only">이름</label>
                    <input type="text" name="mname" id="mid" required="required" class="form-control" placeholder="이름">
                  </div>	              
                  <div class="form-group">
                    <label for="mid" class="sr-only">아이디</label>
                    <input type="text" name="mid" id="mid" value="${mid }" required="required" class="form-control" placeholder="아이디">
                  </div>
                  <div id="idConfirmResult">&nbsp;</div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">비밀번호</label>
                    <input type="password" name="mpw" id="password" required="required"  class="form-control" placeholder="비밀번호">
                  </div>
                   <div class="form-group mb-4">
                    <label for="password" class="sr-only">비밀번호확인</label>
                    <input type="password" name="mpwChk" id="password" required="required"  class="form-control" placeholder="비밀번호확인">
                  </div>
                   <div id="pwChkResult">&nbsp;</div>
                   <div class="form-group">
                    <label for="mtel" class="sr-only">전화번호</label>
                    <input type="text" name="mtel" id="mtel" required="required" class="form-control" placeholder="전화번호">
                  </div>
                  <div class="form-group">
                    <label for="memail" class="sr-only">이메일</label>
                    <input type="email" name="memail" id="memail" required="required" class="form-control" placeholder="이메일">
                  </div>
                   <div id="emailConfirmResult">&nbsp;</div>
                  <div class="form-group">
                    <label for="maddress" class="sr-only">주소</label>
                    <input type="text" name="maddress" id="maddress"  class="form-control" placeholder="주소">
                  </div>
                  <div class="form-group">
                    <label for="mbirth" class="sr-only">생년월일</label>
                    <input type="text" name="mbirth" id="mbirth"  class="form-control" placeholder="생년월일">
                  </div>
                   <div class="form-group">
                    <label for="mgender" class="sr-only">성별</label>
                    <input type="radio" name="mgender" id="mgender"   checked="checked" placeholder="성별">남자
                    <input type="radio" name="mgender" id="mgender"  >여자
                  </div>
                  <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="회원가입">
               		
                </form>
                <p class="login-card-footer-text">Already have an account? <a href="${conPath}/loginView.do" class="text-reset">Login</a></p>
               
            </div>
          </div>
        </div>
      </div>
    
    </div>
  </main>
</body>
</html>