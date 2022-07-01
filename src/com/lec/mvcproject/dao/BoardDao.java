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

public class BoardDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static BoardDao instance = new BoardDao();

	public static BoardDao getInstance() {
		return instance;
	}

	private BoardDao() {
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
	//(1)글목록
	public ArrayList<BoardDto> listBoard(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT B.*, MNAME FROM BOARD B, MEMBER M WHERE B.MID=M.MID" + 
				"    ORDER BY BGROUP DESC, bSTEP) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int bno = rs.getInt("bno");
				 String mid = rs.getString("mid");
				 String bsubject= rs.getString("bsubject");
				 String  bcontent= rs.getString("bcontent");
				 String  bfile= rs.getString("bfile");
				 int bhit = rs.getInt("bhit");
				 int bgroup= rs.getInt("bgroup");
				 int bstep= rs.getInt("bstep");;
				 int bindent= rs.getInt("bindent");;
				 String bip= rs.getString("bip");
				 Date brdate=rs.getDate("brdate");
				 dtos.add(new BoardDto(bno, mid, bsubject, bcontent, bfile, bhit, bgroup, bstep, bindent, bip, brdate));
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
		return dtos;
	}
	//(2)글 개수 
	public  int getBoardTotCnt() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
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
	//(3)글쓰기
	public int writeBoard(String mid, String bsubject,String bcontent,String bfile,String bip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD (BNO,MID,bSUBJECT,BCONTENT,BFILE,bHIT,BGROUP,bSTEP,BINDENT,bIP,brdate)" + 
				"VALUES (BOARD_SEQ.NEXTVAL,?,?,?,?,0,BOARD_SEQ.CURRVAL,0,0,?,SYSDATE)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,bsubject);
			pstmt.setString(3,bcontent);
			pstmt.setString(4,bfile);
			pstmt.setString(5,bip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "원글쓰기성공":"원글쓰기실패");
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	//(4) bhit 하나 올리기 
	private void hitup(int bno) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql ="UPDATE BOARD SET bHIT = bHIT+1 WHERE BNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
	//(5)bno로 글dto보기 : 글 상세보기(조회수 up+ bno로 dto리턴)
	public BoardDto contentView(int bno) {
		hitup(bno);
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT B.*, MNAME FROM BOARD B, MEMBER M" + 
				"    WHERE M.MID=B.MID AND BNO=?";
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				 String mid= rs.getString("mid");
				 String bsubject= rs.getString("bsubject");
				 String  bcontent= rs.getString("bcontent");
				 String  bfile= rs.getString("bfile");
				 int bhit =rs.getInt("bhit");
				 int bgroup=rs.getInt("bgroup");
				 int bstep=rs.getInt("bstep");
				 int bindent=rs.getInt("bindent");
				 String bip= rs.getString("bip");
				 Date brdate = rs.getDate("brdate");
				 dto= new BoardDto(bno, mid, bsubject, bcontent, bfile, bhit, bgroup, bstep, bindent, bip, brdate);
			}
		}catch (SQLException e) {
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
	//(5) bno로 글 dto보기 : 답변글 view + 수정(bno로 dto리턴)
	public BoardDto modifyView_replyView(int bno) {
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT B.*, MNAME FROM BOARD B, MEMBER M" + 
				"    WHERE M.MID=B.MID AND BNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 String mid= rs.getString("mid");
				 String bsubject= rs.getString("bsubject");
				 String  bcontent= rs.getString("bcontent");
				 String  bfile= rs.getString("bfile");
				 int bhit =rs.getInt("bhit");
				 int bgroup=rs.getInt("bgroup");
				 int bstep=rs.getInt("bstep");
				 int bindent=rs.getInt("bindent");
				 String bip= rs.getString("bip");
				 Date brdate = rs.getDate("brdate");
				 dto= new BoardDto(bno, mid, bsubject, bcontent, bfile, bhit, bgroup, bstep, bindent, bip, brdate);
			}
		}catch (SQLException e) {
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
	//(6)글 수정하기 
	public int modifyBoard(int bno, String bsubject,String bcontent,String bfile) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET" + 
				"                bSUBJECT = ?," + 
				"                 BCONTENT = ?, " + 
				"                 BFILE = ?," + 
				"                 brdate = sysdate" + 
				"                 WHERE bno = ?";
		
		System.out.println("오류1");
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bsubject);
			pstmt.setString(2, bcontent);
			pstmt.setString(3, bfile);
			pstmt.setInt(4, bno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글수정성공":"글수정실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	//(7)글 삭제하기 (bno로 삭제) 
	public int deleteBoard(int bno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD WHERE bno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글삭제성공":"글삭제실패");
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
	//(8)답변글 추가전 step a 수행
	private void preReplyStepA(int bgroup, int bstep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET bSTEP = bSTEP+1" + 
					"    WHERE FGROUP = ? AND FSTEP>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			pstmt.setInt(2, bstep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
	//(9)답변글 쓰기
	public int replyBoard(String mid,String bsubject,String bcontent,String bfile,String bip,int bgroup,int bstep,int bindent) {
		preReplyStepA(bgroup,bindent);
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BNO,MID,bSUBJECT,BCONTENT,BFILE,BGROUP,bSTEP,BINDENT,bIP)" + 
				"    VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, bsubject);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bfile);
			pstmt.setInt(5, bgroup);
			pstmt.setInt(6, bstep+1);
			pstmt.setInt(7, bindent+1);
			pstmt.setString(8, bip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "답변쓰기성공":"답변쓰기실패");
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
	// (10) 회원탈퇴 하려는 사람이 쓴 글 모두 삭제 후 탈퇴
		public void withdrawalDeleteBoard(String mid) {
			int result = FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "DELETE FROM BOARD WHERE MID = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}