package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.MemberDao;

public class MidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String mid = request.getParameter("mid");
			MemberDao mDao = MemberDao.getInstance();
			//ID중복체크 
			int result = mDao.mIdConfirm(mid);
			if(result == MemberDao.NONEXISTENT) {
				request.setAttribute("idConfirmResult", "사용 가능한 ID");
			}else {
				request.setAttribute("idConfirmResult", "<b>중복된 ID</b>");
			}
			
	}

}
