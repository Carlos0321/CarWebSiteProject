package com.lec.mvcproject.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.BoardDao;
import com.lec.mvcproject.dao.EstimateDao;
import com.lec.mvcproject.dto.BoardDto;
import com.lec.mvcproject.dto.EstimateDto;

public class EstimateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EstimateDao estimateDao = EstimateDao.getInstance();
		ArrayList<EstimateDto> estimate = estimateDao.getEstimate();
		request.setAttribute("estimate", estimate);
	}

}
