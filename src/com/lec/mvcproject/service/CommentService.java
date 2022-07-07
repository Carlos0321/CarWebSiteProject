package com.lec.mvcproject.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.CommentDao;
import com.lec.mvcproject.dto.CommentDto;

public class CommentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("")) {
			if(request.getAttribute("pageNum")==null) {
				pageNum = "1";
			}else {
				pageNum = (String)request.getAttribute("pageNum");
			}
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=5, BLOCKSIZE=2;
		int startRow = (currentPage-1) * PAGESIZE +1;
		int endRow   = startRow + PAGESIZE -1;
		
		CommentDao cDao = CommentDao.getInstance();
		int bno = Integer.parseInt(request.getParameter("bno"));
		ArrayList<CommentDto> commentList = cDao.listComment(bno, startRow, endRow);
		request.setAttribute("commentList", commentList);

		int totCnt = cDao.replyTotCnt(bno);
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);//페이지갯수
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("totCnt", totCnt); 
		request.setAttribute("pageNum", currentPage);
	}

}
