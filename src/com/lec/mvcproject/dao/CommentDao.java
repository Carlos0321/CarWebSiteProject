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

import com.lec.mvcproject.dto.CommentDto;

public class CommentDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static CommentDao instance = new CommentDao();
	public static CommentDao getInstance() {
		return instance;
	}
	
	private CommentDao() {}
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

	
//	 1. 댓글쓰기
	public int writeComment(String mid, String cmemo, int bno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD_COMMENT(CNO,MID,CMEMO,BNO)" + 
				"    VALUES(COMMENT_SEQ.NEXTVAL,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, cmemo);
			pstmt.setInt(3, bno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "댓글쓰기성공":"댓글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	
//	 2. 댓글 목록 출력하기 -- 페이징 처리(STARTROW, ENDROW)   // rownum 해주기
	public ArrayList<CommentDto> listComment(int bno, int startRow, int endRow){
		ArrayList<CommentDto> comment = new ArrayList<CommentDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD_COMMENT WHERE BNO=? ORDER BY CNO DESC) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				 int cno = rs.getInt("cno");
				 String cmemo = rs.getString("cmemo");
				 String mid = rs.getString("mid");
				 Date cdate = rs.getDate("cdate") ;
				 comment.add(new CommentDto(cno, cmemo, mid, bno, cdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null)  rs.close();
				if(pstmt!=null)  pstmt.close();
				if(conn !=null)  conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return comment;
	}
	
	
//	 3. 댓글 갯수 
	public int replyTotCnt(int bno) {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) BOARD_COUNT FROM BOARD_COMMENT WHERE BNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("BOARD_COUNT");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return cnt;
	}
	
	//4. 댓글 삭제하기 
	public int deleteComment(int cno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD_COMMENT WHERE CNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "댓글삭제성공":"댓글삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	
	// CNO로 DTO 가져오기 
	public CommentDto getDto(int cno) {
		CommentDto dto = null;
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM BOARD_COMMENT WHERE cno=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String cmemo = rs.getString("cmemo");
				String mid = rs.getString("mid");
				int bno = rs.getInt("bno");
				Date cdate = rs.getDate("cdate");
				dto = new CommentDto(cno, cmemo, mid, bno, cdate);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;
		
	}
	// 댓글 수정하기 
	
	public int ModifyComment(CommentDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD_COMMENT SET cmemo = ? WHERE cno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCmemo());
			pstmt.setInt(2, dto.getCno());
			result = pstmt.executeUpdate();
			System.out.println(result==1? "댓글수정성공":dto+"댓글 수정 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"댓글 수정 실패 : " +dto);
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
}
