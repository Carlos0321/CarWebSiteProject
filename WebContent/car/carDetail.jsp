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
 <link rel="stylesheet" href="${conPath }/assets/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
div.container{padding-top :100px;}
img.login-card-img{padding-top:100px;}
.row1{
padding-top : 50px;
padding-left:100px;
width : 80%;
}
div.main_home.text-center{height:80%;}
.col-md-5{text-align: center}
</style>
</head>
<body>
 <jsp:include page="../main/header.jsp"/>
<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card"  style="width: 80%">
        <div class="row no-gutters" style="text-align: center">
          <div class="col-md-5" >
             <img src="${conPath }/carimg/${getCar.cphoto}" alt="" class="login-card-img"/>  
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <p class="login-card-description">${getCar.carname }</p>
              <form action= >
                  <div class="person_details m-top-40">
                                    <div class="row">
                                        <div class="col-md-5 text-left">
                                           	<p>브랜드:</p>
                                            <p>차 이름:</p>
                                            <p>차 유형:</p>
                                            <p>가격:</p>
                                            <p>연료:</p>
                                            <p>연비:</p>
                                        </div>
                                        <div class="col-md-7 text-left">
                                            <p>${getCar.brandname }</p>
                                            <p>${getCar.carname }</p>
                                            <p>${getCar.designname }</p>
                                            <p>${getCar.cprice }</p>
                                            <p>${getCar.cfuel }</p>
                                            <p>${getCar.cmile }</p>
                                        </div>
                                        </div>
                                        </div>
                                        
                </form>
                <table>
                                        <tr >
                                        <td colspan="3">
                                        <c:if test="${not empty member.mid }">
                                        <input type="submit" value="시승예약" class="btn"  width="500px"
                                        onclick ="location='${conPath}/car/contact.jsp?mid=${member.mid }&&brandname=${getCar.brandname }&&carname=${getCar.carname }'">
                                        </c:if>
                                        <c:if test="${not empty member.mid && member.mgrade < 5 }">
										<td><input type="button" value="차량견적" class="btn" onclick="location='${conPath}/estimate.do?cid=${getCar.cid }'"></td>                                          
                                        </c:if>
                                        <td><input type="reset" value="이전" class="btn"
										  onclick="history.back()"></td>
                                        </tr>
                                        </table>
               
            </div>
          </div>
        </div>
      </div>
    
    </div>
  </main>
<jsp:include page="../main/footer.jsp" />
</body>
</html>