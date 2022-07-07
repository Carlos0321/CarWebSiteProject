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

import com.lec.mvcproject.dto.MemberDto;

public class MemberDao {
	public static final int EXISTENT    = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL    =0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	private MemberDao() {}
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
	//(1) 로그인 체크 
	public int loginCheck(String mid,String mpw) {
		int result = LOGIN_FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = LOGIN_SUCCESS;
			}else {
				result = LOGIN_FAIL;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	//(2) mid로 dto가져오기(로그인 성공시 session에 넣기 위함)
	public MemberDto getMember(String mid) {
		MemberDto member = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int mgrade = rs.getInt("mgrade");
				String mname = rs.getString("mname");
				String mpw = rs.getString("mpw");
				 String mtel= rs.getString("mtel");;
				 String memail= rs.getString("memail");;
				 String maddress = rs.getString("maddress");;
				 String mgender = rs.getString("mgender");;
				 Date mbirth =rs.getDate("mbirth");
				 member = new MemberDto(mid, mgrade, mname, mpw, mtel, memail, maddress, mgender, mbirth);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return member;
	}
		//(3)회원 id 중복체크
		public int mIdConfirm(String mid) {
			int result = EXISTENT;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM MEMBER WHERE MID = ?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = EXISTENT;
				}else {
					result = NONEXISTENT;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
		//(4)회원가입
		public int joinMember(MemberDto member) {
			int result = FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO MEMBER (MID,MNAME,MPW,MTEL,MEMAIL,MADDRESS,MGENDER,MBIRTH)" + 
					"    VALUES(?,?,?,?,?,?,?,?)";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,member.getMid());
				pstmt.setString(2,member.getMname());
				pstmt.setString(3,member.getMpw());
				pstmt.setString(4,member.getMtel());
				pstmt.setString(5,member.getMemail());
				pstmt.setString(6,member.getMaddress());
				pstmt.setString(7,member.getMgender());
				pstmt.setDate(8,member.getMbirth());
				result = pstmt.executeUpdate();
				
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
			return result;
		}
		//(5) 회원정보 수정
		public int modifyMember(MemberDto member) {
			int result = FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "UPDATE MEMBER SET MPW =?," + 
					"                  MNAME = ?," + 
					"                  MTEL = ?," + 
					"                  MEMAIL= ?," + 
					"                  MADDRESS = ?" + 
					"                  WHERE MID = ?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,member.getMpw());
				pstmt.setString(2,member.getMname());
				pstmt.setString(3,member.getMtel());
				pstmt.setString(4,member.getMemail());
				pstmt.setString(5,member.getMaddress());
				pstmt.setString(6,member.getMid());
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage() + "dao 에러");
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
		// (6) 회원리스트(top-N구문) 등급별 출력 관리자 화면
		public ArrayList<MemberDto> allMember(int startRow, int endRow){
			ArrayList<MemberDto> members = new ArrayList<MemberDto>();
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM (SELECT ROWNUM RN,A.* FROM" + 
					"    (SELECT * FROM MEMBER ORDER BY MGRADE )A)" + 
					"    WHERE RN BETWEEN ? AND ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					 String mid = rs.getString("mid");
					 int mgrade = rs.getInt("mgrade");
					 String mname= rs.getString("mname");
					 String mpw= rs.getString("mpw");
					 String mtel= rs.getString("mtel");
					 String memail= rs.getString("memail");
					 String maddress= rs.getString("maddress");
					 String mgender= rs.getString("mgender");
					 Date mbirth =rs.getDate("mbirth");
					 members.add(new MemberDto(mid, mgrade, mname, mpw, mtel, memail, maddress, mgender, mbirth));
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return members;
		}
		//(7) 회원수
		public int getMemberTotCnt() {
			int totCnt = 0;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT COUNT(*) CNT FROM MEMBER";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					totCnt = rs.getInt("cnt");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return totCnt;
		}
		
		//(8)회원탈퇴
		public int withdrawal(String mid) {
			int result =FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "DELETE FROM MEMBER WHERE MID = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				result = pstmt.executeUpdate();
			} catch
			(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
		// (9) 이메일 중복체크
		public int emailConfirm(String memail) {
			int result = EXISTENT;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM MEMBER WHERE mEMAIL = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memail);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = EXISTENT;
				}else {
					result = NONEXISTENT;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
		//(10)조회수 증가에 따른 등급업
		public int gradeUp(String mid) {
			int result = FAIL;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			String sql ="UPDATE MEMBER SET MGRADE = (SELECT G.MGRADE" + 
					"    FROM (SELECT M.*, NVL((SELECT SUM(bHIT) FROM BOARD WHERE MID=M.MID GROUP BY MID), 0) BHIT FROM MEMBER M) MT, MEMBER_GRADE G" + 
					"    WHERE bHIT BETWEEN LOW AND HIGH AND MID=?)" + 
					"    WHERE MID=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mid);
				pstmt.setString(2,mid);
				pstmt.executeUpdate();
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
	}

