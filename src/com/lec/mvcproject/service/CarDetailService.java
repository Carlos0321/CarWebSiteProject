package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.CarDao;
import com.lec.mvcproject.dao.MemberDao;
import com.lec.mvcproject.dto.CarDto;
import com.lec.mvcproject.dto.MemberDto;

public class CarDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cid");
		CarDao carDao = CarDao.getInstance();
		CarDto getCar = carDao.getCar(cid);
		request.setAttribute("getCar", getCar);

		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if (member != null) {
			String mid = member.getMid();
			MemberDao mDao = MemberDao.getInstance();
			int result = mDao.gradeUp(mid);
			if (result == MemberDao.SUCCESS) {
				request.setAttribute("Result", "등급이 상승했습니다");
			} else {
				request.setAttribute("Result", "등급업이 실패되었습니다");
			}
		}
	}
}
