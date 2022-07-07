package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.CommentDao;
import com.lec.mvcproject.dto.CommentDto;

public class CommentModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		String cmemo = request.getParameter("cmemo");
		int bno = Integer.parseInt(request.getParameter("bno"));
		CommentDao dao = CommentDao.getInstance();
		CommentDto dto = new CommentDto(cno, cmemo, null, bno, null);
		request.setAttribute("commentModify", dao.ModifyComment(dto));
	}

}
