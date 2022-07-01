package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.deleteBoard(bno);
		if(result == BoardDao.SUCCESS) {
			request.setAttribute("boaredResult", "글삭제 성공");
		}else {
			request.setAttribute("boaredResult", "글삭제 실패");
		}
	}

}
