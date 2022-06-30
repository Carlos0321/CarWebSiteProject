package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.deleteBoard(mid);
		if(result == BoardDao.SUCCESS) {
			request.setAttribute("boaredResult", "글삭제 성공");
		}else {
			request.setAttribute("boaredResult", "글삭제 실패");
		}
	}

}
