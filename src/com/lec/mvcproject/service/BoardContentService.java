package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.BoardDao;
import com.lec.mvcproject.dto.BoardDto;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto board = boardDao.contentView(bno);
		request.setAttribute("board", board);
	}

}
