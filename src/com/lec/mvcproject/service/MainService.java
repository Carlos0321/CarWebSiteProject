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
import com.lec.mvcproject.dao.MemberDao;
import com.lec.mvcproject.dto.CarDto;
import com.lec.mvcproject.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MainService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 3, BLOCKSIZE = 5;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		//String cid = request.getParameter("cid");
		String brandname = request.getParameter("brandname");
		if(brandname!=null) {
			request.setAttribute("brandOverView", 1);
		}
		String designname = request.getParameter("designname");
		if(designname !=null) {
			request.setAttribute("OurModels", 2);
		}
		CarDao cDao = CarDao.getInstance();
		ArrayList<CarDto> allcar = cDao.allListCar(startRow, endRow); //전체 list 호출
		request.setAttribute("allcar", allcar);
		
		int totCnt = cDao.getCarTotCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE +1;
		int endPage   = startPage + BLOCKSIZE -1 ;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		ArrayList<CarDto> cars = cDao.mainlistCar(brandname); //브랜드별 호출
		ArrayList<CarDto> dtos = cDao.designlistCar(brandname, designname); //브랜드&디자인 호출
		request.setAttribute("cars", cars);
		request.setAttribute("dtos", dtos);
		
	}
}
