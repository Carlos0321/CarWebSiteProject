package com.lec.mvcproject.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.ReserveDao;
import com.lec.mvcproject.dto.ReserveDto;

public class ReserveService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession();
		ReserveDto reserve = (ReserveDto) session.getAttribute("reserve");
		 String mname = request.getParameter("mname");
		 String mtel = request.getParameter("mtel");
		 String brandname = request.getParameter("brandname");
		 String carname = request.getParameter("carname");
		 
		 String rdateStr = request.getParameter("rdate");
		 String rtimeStr = request.getParameter("rtime");
		 String crdateStr = rdateStr +" "+rtimeStr + ":00";
		 Timestamp crdate = null;
		 if(!rdateStr.equals("")&&!rtimeStr.equals("")) {
			 crdate = Timestamp.valueOf(crdateStr);
		 }
		 String cplace = request.getParameter("cplace");
		 ReserveDao reserveDao = ReserveDao.getInstance(); 
			int result = reserveDao.insertReserve(mname, mtel,brandname,  carname,  crdate,  cplace);
			if(result == ReserveDao.SUCCESS) { //예약성공
				request.setAttribute("reserveResult", "예약이 완료되었습니다");
			}else {//예약 실패 
				request.setAttribute("reserveResult", "예약이 실패되었습니다");
			}
	}
}

