package com.lec.mvcproject.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.CarDao;
import com.lec.mvcproject.dto.CarDto;

public class CarDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cid");
		CarDao carDao = CarDao.getInstance();
		CarDto getCar = carDao.getCar(cid);
		request.setAttribute("getCar", getCar);
	}

}
