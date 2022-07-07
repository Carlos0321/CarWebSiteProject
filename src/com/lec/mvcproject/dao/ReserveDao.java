package com.lec.mvcproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.mvcproject.dto.ReserveDto;

public class ReserveDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;

	private static ReserveDao instance = new ReserveDao();

	public static ReserveDao getInstance() {
		return instance;
	}

	private ReserveDao() {
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

//	 1. 예약하기 INSERT 해서 car_reserve에 넣기 
	public int insertReserve(String mname, String mtel,String brandname, String carname, Timestamp crdate, String cplace) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into car_reserve (RID,mname, mtel,brandname,carname,crdate,cplace)"
				+ "    values(car_reserve_SEQ.NEXTVAL,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, mtel);
			pstmt.setString(3, brandname);
			pstmt.setString(4, carname);
			pstmt.setTimestamp(5, crdate);			
			pstmt.setString(6, cplace);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "예약성공" : "예약실패");
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

//	 2. 예약한 LIST 뽑기  
	public ArrayList<ReserveDto> reserveList(){
		ArrayList<ReserveDto> reserve = new ArrayList<ReserveDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CAR_RESERVE";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 String mname = rs.getString("mname");
				 String mtel = rs.getString("mtel");
				 String brandname = rs.getString("brandname");
				 String carname = rs.getString("carname");
				 Timestamp crdate = rs.getTimestamp("crdate");
				 String cplace = rs.getString("cplace");
				reserve.add(new ReserveDto(0, mname, mtel, brandname, carname, crdate, cplace));
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
		return reserve;
	}

}
