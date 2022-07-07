package com.lec.mvcproject.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.mvcproject.dao.BoardDao;
import com.lec.mvcproject.dao.CommentDao;
import com.lec.mvcproject.dao.MemberDao;
import com.lec.mvcproject.dto.BoardDto;
import com.lec.mvcproject.dto.CommentDto;
import com.lec.mvcproject.dto.MemberDto;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto board = boardDao.contentView(bno);
		request.setAttribute("board", board);

		String replypageNum = request.getParameter("replypageNum");
		if (replypageNum == null || replypageNum.equals("")) {
			replypageNum = "1";
		} 
		int currentPage = Integer.parseInt(replypageNum);
		final int PAGESIZE = 5, BLOCKSIZE = 2;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		
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
		CommentDao cDao = CommentDao.getInstance();
		ArrayList<CommentDto> commentList = cDao.listComment(bno, startRow, endRow);
		request.setAttribute("commentList", commentList);

		int totCnt = cDao.replyTotCnt(bno);
		int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);// 페이지갯수
		int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("replypageNum", currentPage);
	}
}
