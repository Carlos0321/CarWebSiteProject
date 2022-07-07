package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.EstimateDao;
import com.lec.mvcproject.dto.EstimateDto;

public class insertEstimateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String brandname = request.getParameter("brandname");
		String carname = request.getParameter("carname");
		String cplace = request.getParameter("cplace");
		int prepayment = Integer.parseInt(request.getParameter("prepayment"));
		int term = Integer.parseInt(request.getParameter("term"));
		String payStr = request.getParameter("pay").substring(0, request.getParameter("pay").lastIndexOf("원"));
		int pay = Integer.parseInt(payStr);
		
		EstimateDao eDao = EstimateDao.getInstance();
		int result = eDao.insertEstimate(mid, brandname, carname, cplace, prepayment, term, pay);
		if(result ==EstimateDao.SUCCESS) {
			request.setAttribute("insertEstimate", "견적 신청 성공");
		}else {
			request.setAttribute("insertEstimate", "견적 신청 실패");
		}
	}

}
