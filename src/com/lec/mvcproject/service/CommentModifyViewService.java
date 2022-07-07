package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.CommentDao;
import com.lec.mvcproject.dto.CommentDto;

public class CommentModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentDao cDao = CommentDao.getInstance();
		CommentDto cDto = cDao.getDto(cno);
		request.setAttribute("cDto", cDto);
	}

}
