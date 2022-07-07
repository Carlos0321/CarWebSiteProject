package com.lec.mvcproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.mvcproject.dto.EstimateDto;

public class EstimateDao {
	public static final int EXISTENT = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL = 0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static EstimateDao instance = new EstimateDao();

	public static EstimateDao getInstance() {
		return instance;
	}

	private EstimateDao() {
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

	// 견적 신청 목록 출력
	public ArrayList<EstimateDto> getEstimate() {
		ArrayList<EstimateDto> dtos = new ArrayList<EstimateDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM estimate ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int eid = rs.getInt("eid");
				String mid = rs.getString("mid");
				String brandname = rs.getString("brandname");
				String carname = rs.getString("carname");
				int prepayment = rs.getInt("prepayment");
				int term = rs.getInt("term");
				String cplace = rs.getString("cplace");
				int pay = rs.getInt("pay");
				dtos.add(new EstimateDto(eid, mid, brandname, carname, prepayment, term, cplace, pay));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}

	// 견적 신청
	public int insertEstimate(String mid, String brandname, String carname, String cplace, int prepayment, int term,
			int pay) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ESTIMATE (EID,MID, BRANDNAME,CARNAME, CPLACE, PREPAYMENT, TERM, PAY)"
				+ "    VALUES(ESTIMATE_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, brandname);
			pstmt.setString(3, carname);
			pstmt.setString(4, cplace);
			pstmt.setInt(5, prepayment);
			pstmt.setInt(6, term);
			pstmt.setInt(7, pay);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "견적신청 성공" : "견적신청 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
