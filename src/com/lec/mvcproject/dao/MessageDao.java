package com.lec.mvcproject.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.mvcproject.dto.BoardDto;
import com.lec.mvcproject.dto.MessageDto;

public class MessageDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static MessageDao instance = new MessageDao();

	public static MessageDao getInstance() {
		return instance;
	}

	private MessageDao() {
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	//메세지 갯수
	public int getMsgTotCnt() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MSG";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return cnt;
	}
	//메세지 출력(간단하게) 
	public ArrayList<MessageDto> listMsg() {
		ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MSG";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int msid = rs.getInt("msid");
				String mname= rs.getString("mname");
				String memail=rs.getString("memail");
				int mphone = rs.getInt("mphone");
				String memo = rs.getString("memo");
				dtos.add(new MessageDto(msid, mname, memail, mphone, memo));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	//메세지 쓰기
	public int writeMsg(String mname, String memail, int mphone,String memo) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="insert into msg (msid, mname,memail,mphone,memo) " + 
				"    values(msg_seq.NEXTVAL,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, memail);
			pstmt.setInt(3, mphone);
			pstmt.setString(4, memo);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "메세지쓰기성공" : "매세지쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : writeMsg 에러 메세지");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
