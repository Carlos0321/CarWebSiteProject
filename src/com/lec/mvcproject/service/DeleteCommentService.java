package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.CommentDao;

public class DeleteCommentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentDao cDao = CommentDao.getInstance();
		int result = cDao.deleteComment(cno);
		if (result == CommentDao.SUCCESS) {
			request.setAttribute("deleteReplyResult", "댓글삭제성공");
		} else {
			request.setAttribute("deleteReplyResult", "댓글삭제실패");
		}
	}

}
