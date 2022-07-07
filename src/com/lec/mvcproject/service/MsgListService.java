package com.lec.mvcproject.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcproject.dao.BoardDao;
import com.lec.mvcproject.dao.MessageDao;
import com.lec.mvcproject.dto.BoardDto;
import com.lec.mvcproject.dto.MessageDto;

public class MsgListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MessageDao msgDao = MessageDao.getInstance();
		ArrayList<MessageDto> msgList = msgDao.listMsg();
		request.setAttribute("msgList", msgList);
		
	}
}
