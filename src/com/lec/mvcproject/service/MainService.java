package com.lec.mvcproject.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.CarDao;
import com.lec.mvcproject.dto.CarDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MainService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String brandname = request.getParameter("brandname");
			String designid  =request.getParameter("designid");
			CarDao cDao = CarDao.getInstance();
			ArrayList<CarDto> cars = cDao.mainlistCar(brandname);
			ArrayList<CarDto> dtos = cDao.designlistCar(brandname, designid);
			/*
			 * HttpSession session = request.getSession(); 
			 * session.setAttribute("cars",cars);
			 */
			request.setAttribute("cars", cars);
			request.setAttribute("dtos", dtos);
	}		
}
