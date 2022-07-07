package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.CommentDao;

public class WriteCommentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cmemo = request.getParameter("cmemo");
		String mid = request.getParameter("mid");
		int bno = Integer.parseInt(request.getParameter("bno"));
		CommentDao cDao = CommentDao.getInstance();
		int result = cDao.writeComment(mid, cmemo, bno);
		if(result==CommentDao.SUCCESS) {
			request.setAttribute("Result", "댓글쓰기가 완료되었습니다");
		}else {
			request.setAttribute("Result", "댓글쓰기 실패");
		}
	}

}
