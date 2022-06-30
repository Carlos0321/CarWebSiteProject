package com.lec.mvcproject.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.MemberDao;
import com.lec.mvcproject.dto.MemberDto;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String mpw = request.getParameter("mpw");
		String mtel = request.getParameter("mtel");
		String maddress = request.getParameter("maddress");
		String memail = request.getParameter("memail");
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if (!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String mgender = request.getParameter("mgender");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, 0, mname, mpw, mtel, memail, maddress, mgender, mbirth);

		// 회원가입
		int result = mDao.joinMember(member);
		if (result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession(); // 세션은 request로 부터
			session.setAttribute("mid", mid);
			request.setAttribute("joinResult", "회원가입이 완료되었습니다");
		} else {
			request.setAttribute("joinErrorMsg", "정보가 너무 길어서 회원가입 실패");
		}
	}
}
