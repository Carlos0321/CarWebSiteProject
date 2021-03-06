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
		if (com.equals("/main.do")) { // ?????????
			service = new MainService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * member ?????? ?????? * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		} else if (com.equals("/joinView.do")) { // ??????????????????
			viewPage = "member/join.jsp";

		} else if (com.equals("/idConfirm.do")) { // ID????????????
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";

		} else if (com.equals("/emailConfirm.do")) {// EMAIL????????????
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";

		} else if (com.equals("/join.do")) { // ???????????? DB ??????
			service = new MJoinService(); // execute????????? : mId???????????? ??? ????????????
			service.execute(request, response);
			viewPage = "loginView.do";

		} else if (com.equals("/loginView.do")) {// ????????? ??????
			viewPage = "member/login.jsp";

		} else if (com.equals("/login.do")) {// ????????? DB??????
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main.do";

		} else if (com.equals("/logout.do")) { // ????????????- ?????? ?????????
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main.do";

		} else if (com.equals("/modifyView.do")) { // ?????? ?????? ??????
			viewPage = "member/modify.jsp";

		} else if (com.equals("/modify.do")) { // DB??? ?????? ??????
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";

		} else if (com.equals("/withdrawal.do")) { // ????????????
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";

			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * Admin ?????? ?????? * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		} else if (com.equals("/adminLoginView.do")) { // ????????? ?????????
			viewPage = "admin/adminLogin.jsp";

		} else if (com.equals("/adminLogin.do")) {
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "allView.do";
		} else if (com.equals("/allView.do")) {// ?????? ?????? ????????????
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "admin/aAllView.jsp";
			
		}else if(com.equals("/adminEstimate.do")) {//?????? ????????? 
			service = new EstimateService();
			service.execute(request, response);
			viewPage = "admin/estimateView.jsp";
			
		}else if(com.equals("/reserveView.do")) { //???????????????
			service = new ReserveViewService();
			service.execute(request, response);
			viewPage = "admin/contactChk.jsp";	
			
		}else if(com.equals("/msgView.do"))	{ //???????????????
			service = new MsgListService();
			service.execute(request, response);
			viewPage = "admin/msgChk.jsp";
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * Board ?????? ?????? * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		} else if (com.equals("/boardList.do")) { // ????????? ??????
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";

		} else if (com.equals("/boardWriteView.do")) {// ????????? ??????
			viewPage = "board/boardWrite.jsp";

		} else if (com.equals("/boardWrite.do")) {// ??? ??????
			service = new BoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";

		} else if (com.equals("/boardContent.do")) {// ??? ???????????? //???????????? ?????? ?????? ??????
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
			
		}else if(com.equals("/writeComment.do")) { //?????? ??????
			service = new WriteCommentService();
			service.execute(request, response);
			viewPage="boardContent.do";
		}else if(com.equals("/deleteComment.do")) { //?????? ??????
			service = new DeleteCommentService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
		}else if(com.equals("/CommentModifyView.do")) {//?????? ?????? ??????
			service = new CommentModifyViewService();
			service.execute(request, response);
			viewPage="board/commentModify.jsp";
			
		}else if(com.equals("/commentModify.do")) {//?????? ?????? 
			service = new CommentModifyService();
			service.execute(request, response);
			viewPage="boardContent.do";
		}else if (com.equals("/boardModifyView.do")) {// ??? ?????? ??????
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";

		} else if (com.equals("/boardModify.do")) {// ??? ??????
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";

		} else if (com.equals("/boardDelete.do")) {// ??? ??????
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";

		} else if (com.equals("/boardReplyView.do")) {// ????????? ?????? ??????
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "board/boardReply.jsp";

		} else if (com.equals("/boardReply.do")) {// ????????? ??????
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CAR ?????? ?????? * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		}else if (com.equals("/contact.do")) {// ???????????? ?????????
			service = new CarContactService();
			service.execute(request, response);
			viewPage = "car/contact.jsp";
			
		}else if(com.equals("/reserve.do"))	{//?????? ?????? DB?????? 
			service = new ReserveService();
			service.execute(request, response);
			viewPage = "/main.do";
			
		}else if(com.equals("/carDetail.do")) {//??? ???????????? 
			service = new CarDetailService();
			service.execute(request, response);
			viewPage = "car/carDetail.jsp";
			
		} else if(com.equals("/estimate.do")) {//???????????? ??????
			service = new CarEstimateService(); 
			service.execute(request, response); 
			viewPage = "car/estimate.jsp"; 
			
		}else if(com.equals("/insertEstimate.do"))	{ //???????????? DB
			service = new insertEstimateService();
			service.execute(request, response);
			viewPage="/main.do";
					
		}else if(com.equals("/carlistView.do")) {//??? ????????? 
			service = new CarListService();;
			service.execute(request, response);
			viewPage = "car/model.jsp";
		
			/*
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * ?????? ?????? * * *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * *
			 */
		}else if(com.equals("/news.do")) { //?????? 
			viewPage = "car/news.jsp";
			
		}else if(com.equals("/newsDetail.do")) {//?????? ????????????
			service = new NewsService();
			service.execute(request, response);
			viewPage="car/newsDetail.jsp";
			
		}else if(com.equals("/msgWrite.do")) { //????????? ?????? 
			service = new MsgService();
			service.execute(request, response);
			viewPage="main.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
