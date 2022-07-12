package com.lec.mvcproject.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.ReserveDao;
import com.lec.mvcproject.dto.ReserveDto;


public class ReserveViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReserveDao reserveDao = ReserveDao.getInstance();
		ArrayList<ReserveDto> reserve = reserveDao.reserveList();
		
		request.setAttribute("reserve", reserve);
	}

}
