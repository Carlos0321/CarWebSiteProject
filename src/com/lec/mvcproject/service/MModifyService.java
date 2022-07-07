package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.MemberDao;
import com.lec.mvcproject.dto.MemberDto;

public class MModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//파라미터 다 받기
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String mpw = request.getParameter("mpw");
		String mtel = request.getParameter("mtel");
		String maddress = request.getParameter("maddress");
		String memail = request.getParameter("memail");

		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, 0, mname, mpw, mtel, memail, maddress);
		int result = mDao.modifyMember(member);
		if(result == MemberDao.SUCCESS) {// 수정 성공시 세션도 수정
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("member", member);
			request.setAttribute("modifyResult", "회원정보 수정 성공");
		}else {
			// 수정 실패시 
			request.setAttribute("modifyResult", "회원정보 수정 실패");
		}
	}
	
}
