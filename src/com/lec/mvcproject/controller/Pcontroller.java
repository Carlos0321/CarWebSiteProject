package com.lec.mvcproject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.service.ALoginService;
import com.lec.mvcproject.service.BoardContentService;
import com.lec.mvcproject.service.BoardDeleteService;
import com.lec.mvcproject.service.BoardListService;
import com.lec.mvcproject.service.BoardModifyService;
import com.lec.mvcproject.service.BoardModifyViewService;
import com.lec.mvcproject.service.BoardReplyService;
import com.lec.mvcproject.service.BoardReplyViewService;
import com.lec.mvcproject.service.BoardWriteService;
import com.lec.mvcproject.service.CarContactService;
import com.lec.mvcproject.service.CarDetailService;
import com.lec.mvcproject.service.CarEstimateService;
import com.lec.mvcproject.service.CarListService;
import com.lec.mvcproject.service.CommentModifyService;
import com.lec.mvcproject.service.CommentModifyViewService;
import com.lec.mvcproject.service.CommentService;
import com.lec.mvcproject.service.ContactViewService;
import com.lec.mvcproject.service.DeleteCommentService;
import com.lec.mvcproject.service.EstimateService;
import com.lec.mvcproject.service.MAllViewService;
import com.lec.mvcproject.service.MJoinService;
import com.lec.mvcproject.service.MLoginService;
import com.lec.mvcproject.service.MLogoutService;
import com.lec.mvcproject.service.MModifyService;
import com.lec.mvcproject.service.MWithdrawalService;
import com.lec.mvcproject.service.MainService;
import com.lec.mvcproject.service.MemailConfirmService;
import com.lec.mvcproject.service.MidConfirmService;
import com.lec.mvcproject.service.MsgListService;
import com.lec.mvcproject.service.MsgService;
import com.lec.mvcproject.service.NewsService;
import com.lec.mvcproject.service.ReserveService;
import com.lec.mvcproject.service.ReserveViewService;
import com.lec.mvcproject.service.Service;
import com.lec.mvcproject.service.WriteCommentService;
import com.lec.mvcproject.service.insertEstimateService;

@WebServlet("*.do")
public class Pcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if (com.equals("/main.do")) { // 첫화면
			service = new MainService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * member 관련 요청 * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		} else if (com.equals("/joinView.do")) { // 회원가입화면
			viewPage = "member/join.jsp";

		} else if (com.equals("/idConfirm.do")) { // ID중복체크
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";

		} else if (com.equals("/emailConfirm.do")) {// EMAIL중복체크
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";

		} else if (com.equals("/join.do")) { // 회원가입 DB 처리
			service = new MJoinService(); // execute메소드 : mId중복체크 후 회원가입
			service.execute(request, response);
			viewPage = "loginView.do";

		} else if (com.equals("/loginView.do")) {// 로그인 화면
			viewPage = "member/login.jsp";

		} else if (com.equals("/login.do")) {// 로그인 DB처리
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main.do";

		} else if (com.equals("/logout.do")) { // 로그아웃- 세션 날리기
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main.do";

		} else if (com.equals("/modifyView.do")) { // 정보 수정 화면
			viewPage = "member/modify.jsp";

		} else if (com.equals("/modify.do")) { // DB에 정보 수정
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";

		} else if (com.equals("/withdrawal.do")) { // 회원탈퇴
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";

			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * Admin 관련 요청 * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		} else if (com.equals("/adminLoginView.do")) { // 관리자 로그인
			viewPage = "admin/adminLogin.jsp";

		} else if (com.equals("/adminLogin.do")) {
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "allView.do";
		} else if (com.equals("/allView.do")) {// 회원 목록 가져오기
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "admin/aAllView.jsp";
			
		}else if(com.equals("/adminEstimate.do")) {//견적 리스트 
			service = new EstimateService();
			service.execute(request, response);
			viewPage = "admin/estimateView.jsp";
			
		}else if(com.equals("/reserveView.do")) { //예약리스트
			service = new ReserveViewService();
			service.execute(request, response);
			viewPage = "admin/contactChk.jsp";	
			
		}else if(com.equals("/msgView.do"))	{ //메세지출력
			service = new MsgListService();
			service.execute(request, response);
			viewPage = "admin/msgChk.jsp";
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * Board 관련 요청 * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		} else if (com.equals("/boardList.do")) { // 게시판 화면
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";

		} else if (com.equals("/boardWriteView.do")) {// 글쓰기 화면
			viewPage = "board/boardWrite.jsp";

		} else if (com.equals("/boardWrite.do")) {// 글 쓰기
			service = new BoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";

		} else if (com.equals("/boardContent.do")) {// 글 상세보기 //상세보기 내에 댓글 출력
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
			
		}else if(com.equals("/writeComment.do")) { //댓글 쓰기
			service = new WriteCommentService();
			service.execute(request, response);
			viewPage="boardContent.do";
		}else if(com.equals("/deleteComment.do")) { //댓글 삭제
			service = new DeleteCommentService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
		}else if(com.equals("/CommentModifyView.do")) {//댓글 수정 화면
			service = new CommentModifyViewService();
			service.execute(request, response);
			viewPage="board/commentModify.jsp";
			
		}else if(com.equals("/commentModify.do")) {//댓글 수정 
			service = new CommentModifyService();
			service.execute(request, response);
			viewPage="boardContent.do";
		}else if (com.equals("/boardModifyView.do")) {// 글 수정 화면
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";

		} else if (com.equals("/boardModify.do")) {// 글 수정
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";

		} else if (com.equals("/boardDelete.do")) {// 글 삭제
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";

		} else if (com.equals("/boardReplyView.do")) {// 답변글 쓰기 화면
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "board/boardReply.jsp";

		} else if (com.equals("/boardReply.do")) {// 답변글 쓰기
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CAR 관련 요청 * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		}else if (com.equals("/contact.do")) {// 시승예약 페이지
			service = new CarContactService();
			service.execute(request, response);
			viewPage = "car/contact.jsp";
			
		}else if(com.equals("/reserve.do"))	{//시승 예약 DB처리 
			service = new ReserveService();
			service.execute(request, response);
			viewPage = "/main.do";
			
		}else if(com.equals("/carDetail.do")) {//차 상세보기 
			service = new CarDetailService();
			service.execute(request, response);
			viewPage = "car/carDetail.jsp";
			
		} else if(com.equals("/estimate.do")) {//견적신청 화면
			service = new CarEstimateService(); 
			service.execute(request, response); 
			viewPage = "car/estimate.jsp"; 
			
		}else if(com.equals("/insertEstimate.do"))	{ //견적신청 DB
			service = new insertEstimateService();
			service.execute(request, response);
			viewPage="/main.do";
					
		}else if(com.equals("/carlistView.do")) {//차 리스트 
			service = new CarListService();;
			service.execute(request, response);
			viewPage = "car/model.jsp";
		
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 추가 기능 * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		}else if(com.equals("/news.do")) { //뉴스 
			viewPage = "car/news.jsp";
			
		}else if(com.equals("/newsDetail.do")) {//뉴스 상세내용
			service = new NewsService();
			service.execute(request, response);
			viewPage="car/newsDetail.jsp";
			
		}else if(com.equals("/msgWrite.do")) { //메세지 쓰기 
			service = new MsgService();
			service.execute(request, response);
			viewPage="main.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
