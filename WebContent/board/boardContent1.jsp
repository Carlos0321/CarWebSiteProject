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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/png" href="favicon.ico">

<!--Google Fonts link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">


<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/slick-theme.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/fonticons.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/bootsnav.css">


<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="assets/css/responsive.css" />

<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style>
.row{
padding-left:100px;}
textarea.form-control{width:500px;}
input.form-control{width:300px;}
#p1{padding-left:240px;}
#p2{width:100px;  text-align: center;}
h4{padding-left:100px;}
.blog_comments{boder: 1px solid black;}
div.paging b{padding-left:700px;}
div.col-md-5.text-left{width:100px;}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<section id="m_details" class="m_details roomy-100 fix">
		<div class="row">
			<div class="main_details">
				<div class="col-md-6">
					<div class="m_details_img">
						<c:if test="${not empty board.bfile }">
							<img src="${conPath }/boardUp/${board.bfile}">
						</c:if>
						<c:if test="${empty board.bfile }">
					첨부파일 없음 
					</c:if>
					</div>
				</div>
				</div>
				<div class="col-md-6">
					<div class="m_details_content m-bottom-40">
						<h2>${board.bno }번글 리뷰</h2>
						<div class="person_details m-top-40">
							<div >
								<div class="col-md-5 text-left">
									<p id="p2">작성자:</p>
									<p id="p2">제목:</p>
									<p id="p2">본문:</p>
								</div>
								<div class="col-md-7 text-left">
									<p id="p3">${board.mid}님</p>
									<p id="p3">${board.bsubject }</p>
									<textarea class="form-control" rows="6" cols="6">${board.bcontent }</textarea>
								</div>
								<div class="person_details m-top-40">
									<div class="row">
										<div class="col-md-5 text-left"></div>
										
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
			<table>
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
                onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'"></td></tr>
				</table>
		</div>
	</section>


	<div class="blog_comments">
		<h4 class="m-bottom-30">Comment</h4>
		
		<div class="row">
		<c:forEach items="${commentList}" var="dto">
			<div class="comment_item">
				<div class="col-sm-8">
					<div class="comments_top_tex">
						<div class="row">
							<div class="col-sm-8 pull-left">
								<h5 class="text-uppercase">${dto.mid }</h5>
								<small><em>${dto.cdate }</em></small>
							</div>
							<c:if test="${member.mid eq dto.mid }">
							<div class="col-sm-2 pull-right">
								<a href="${conPath }/deleteComment.do?cno=${dto.cno}&bno=${board.bno}"><i class="fa fa-mail-reply-all"></i> Delete</a>
							</div>
							</c:if> 
						</div>
					</div>
					<article class="comments_bottom_text m-top-10">
							<p id="p1">${dto.cmemo }</p>
					</article>
				</div>
				
			</div>
			<hr />
		</c:forEach>
		</div>
		</div>
		<hr />
		<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/boardList.do?replypageNum=${startPage-1}&bno=${board.bno}&mid=${member.mid}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == replypageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != replypageNum }">
				[ <a href="${conPath }/boardList.do?replypageNum=${i}&bno=${board.bno}&mid=${member.mid}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/boardList.do?replypageNum=${endPage+1}&bno=${board.bno}&mid=${member.mid}"> 다음 </a> ]
		</c:if>
	</div>
	<hr/>
	<div class="live_chate">
		<h4>leave a comment</h4>
		<div class="row">
			<form action="${conPath }/writeComment.do" >
				<input type="hidden" name = "bno" value="${param.bno }">
				<div class="col-sm-4">
					<div class="form-group">
						<label>Your Name *</label> <input type="text" name="mid" value="${member.mid }"class="form-control">
					</div>
					
				</div>

				<div class="col-sm-12">
					<div class="form-group">
						<label>Your Message *</label>
						<textarea class="form-control" rows="6" name="cmemo"></textarea>
					</div>
					<button type="submit" class="btn btn-default m-top-30">
						send message <i class="fa fa-long-arrow-right"></i>
					</button>
				</div>

			</form>

		</div>

	</div>
	
	<jsp:include page="../main/footer.jsp" />
</body>
</html>