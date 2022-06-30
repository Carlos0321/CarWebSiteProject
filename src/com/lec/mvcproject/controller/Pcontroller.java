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
import com.lec.mvcproject.service.MAllViewService;
import com.lec.mvcproject.service.MJoinService;
import com.lec.mvcproject.service.MLoginService;
import com.lec.mvcproject.service.MLogoutService;
import com.lec.mvcproject.service.MModifyService;
import com.lec.mvcproject.service.MWithdrawalService;
import com.lec.mvcproject.service.MainService;
import com.lec.mvcproject.service.MemailConfirmService;
import com.lec.mvcproject.service.MidConfirmService;
import com.lec.mvcproject.service.Service;


@WebServlet("*.do")
public class Pcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(com.equals("/main.do")) { //첫화면
			service = new MainService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			 * * * * * * * * * member 관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/joinView.do")) { //회원가입화면
			viewPage = "member/join.jsp";
			
		}else if(com.equals("/idConfirm.do")) { //ID중복체크
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
			
		}else if(com.equals("/emailConfirm.do")) {//EMAIL중복체크
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
			
		}else if(com.equals("/join.do")) { // 회원가입 DB 처리
			service = new MJoinService(); // execute메소드 : mId중복체크 후 회원가입
			service.execute(request, response);
			viewPage = "loginView.do";
			
		}else if(com.equals("/loginView.do")) {//로그인 화면
			viewPage = "member/login.jsp";
			
		}else if(com.equals("/login.do")) {//로그인 DB처리 
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		}else if(com.equals("/logout.do")) { //로그아웃- 세션 날리기
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		}else if(com.equals("/modifyView.do")) { //정보 수정 화면 
			viewPage="member/modify.jsp";
			
		}else if(com.equals("/modify.do")) { //DB에 정보 수정
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		}else if(com.equals("/withdrawal.do")) { // 회원탈퇴
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
			/* * * * * * * * * * *  * * * * * * * * * * * *
			 * * * * * * * * * Admin 관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */	
		}else if(com.equals("/adminLoginView.do")) { //관리자 로그인 
			viewPage = "admin/adminLogin.jsp";
		
		}else if(com.equals("/adminLogin.do")) { 
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "allView.do";
		}else if(com.equals("/allView.do")) {//회원 목록 가져오기 
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "admin/aAllView.jsp";
			
			/* * * * * * * * * * *  * * * * * * * * * * * *
			 * * * * * * * * * Board 관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/boardList.do")) { //시승후기 작성 화면
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
			
		}else if(com.equals("/boardWriteView.do")) {
			viewPage = "board/boardWrite.jsp";
			
		}else if(com.equals("/boardWrite.do")) {
			service = new BoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(com.equals("/boardContent.do")) {
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
			
		}else if(com.equals("/boardModifyView.do")) {
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";
			
		}else if(com.equals("/boradModify.do")) {
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(com.equals("/boardDelete.do")) {
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(com.equals("/boardReplyView.do")) {
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "board/boardReply.jsp";
			
		}else if(com.equals("/boardReply.do")) {
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}