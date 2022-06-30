package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.MemberDao;

public class MemailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		// email 중복체크
		int result = mDao.emailConfirm(memail);
		if(result == MemberDao.NONEXISTENT) {
			request.setAttribute("emailConfirmResult", "사용 가능한 메일입니다");
		}else {
			request.setAttribute("emailConfirmResult", "<b>사용 불가한 중복된 메일</b>");
		}
	}

}
