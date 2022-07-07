package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.BoardDao;
import com.lec.mvcproject.dao.MessageDao;

public class MsgService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		int mphone = Integer.parseInt(request.getParameter("mphone"));
		String memo = request.getParameter("memo");
		MessageDao msgDao = MessageDao.getInstance();
		int result = msgDao.writeMsg(mname, memail, mphone, memo);
		if (result == MessageDao.SUCCESS) { 
			request.setAttribute("msgResult", "메세지쓰기 성공");
		} else {
			request.setAttribute("msgResult", "메세지글쓰기 실패");
		}
	}

}
