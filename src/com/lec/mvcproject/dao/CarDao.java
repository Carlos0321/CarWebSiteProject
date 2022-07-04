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

import com.lec.mvcproject.dto.CarDto;

public class CarDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static CarDao instance = new CarDao();
	public static CarDao getInstance() {
		return instance;
	}
	private CarDao() {}
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
	//brandid로 main 뿌리기
//	public ArrayList<CarDto> getBrand(String brandid){
//		ArrayList<CarDto> dtos =new ArrayList<CarDto>();
//		Connection        conn  = null;
//		PreparedStatement pstmt = null;
//		ResultSet         rs    = null;
//		String sql = "SELECT * FROM CAR WHERE BRANDID=?";
//		try {
//			conn=getConnection();
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, brandid);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				 String cid =rs.getString("cid");
//				 String carname=rs.getString("carname");
//				 String designid=rs.getString("designid");
//				 int cprice = rs.getInt("cprice");
//				 String cfuel=rs.getString("cfuel");
//				 String cmile=rs.getString("cmile");
//				 String cphoto=rs.getString("cphoto");
//				 dtos.add(new CarDto(cid, brandid, carname, designid, cprice, cfuel, cmile, cphoto));
//			}
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		}finally {
//			try {
//				if(rs   !=null) rs.close();
//				if(pstmt!=null) pstmt.close();
//				if(conn !=null) conn.close();
//			} catch (SQLException e) {System.out.println(e.getMessage());}
//		}
//		
//		return dtos;
//	}
	public CarDto getBrand(String brandid) {
		CarDto car = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CAR WHERE BRANDID=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, brandid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				 String cid =rs.getString("cid");
				 String carname=rs.getString("carname");
				 String designid=rs.getString("designid");
				 int cprice = rs.getInt("cprice");
				 String cfuel=rs.getString("cfuel");
				 String cmile=rs.getString("cmile");
				 String cphoto=rs.getString("cphoto");
				 car = new CarDto(cid, brandid, carname, designid, cprice, cfuel, cmile, cphoto);
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
		return car;
	}
	//(1)차 전체 LIST
	public ArrayList<CarDto> allListCar(int startRow,int endRow){
		ArrayList<CarDto> allcar = new ArrayList<CarDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT cid,brandNAME,CARNAME, CPHOTO, CPRICE FROM CAR C, CAR_BRAND B" + 
				"    WHERE C.brandID = b.brandID ORDER BY CPRICE)A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 String cid =rs.getString("cid");
				 String carname=rs.getString("carname");
				 int cprice = rs.getInt("cprice");
				 String cphoto=rs.getString("cphoto");
				 allcar.add(new CarDto(cid,carname,cprice,cphoto));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()+"오류1");
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return allcar;
	}
	//(2) 차 개수 
	public int getCarTotCnt() {
		int totCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) CNT FROM car";
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
	//(3)차 목록  브랜드별
	public ArrayList<CarDto> mainlistCar(String brandname){
		ArrayList<CarDto> dtos = new ArrayList<CarDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT cid,brandNAME,CARNAME, CPHOTO, CPRICE FROM CAR C, CAR_BRAND B" + 
				"    WHERE C.brandID = b.brandID AND BRANDNAME like '%'||?||'%'";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, brandname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 String cid= rs.getString("cid");
				 String carname=rs.getString("carname");
				 int cprice = rs.getInt("cprice");
				 String cphoto=rs.getString("cphoto");
				 dtos.add(new CarDto(cid,carname,cprice,cphoto));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"오류2");
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dtos;
	}
	//(4)차 목록  브랜드-유형별
		public ArrayList<CarDto> designlistCar(String brandname, String designname){
			ArrayList<CarDto> dtos = new ArrayList<CarDto>();
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT cid,brandNAME,CARNAME,designname ,CPHOTO, Cprice, cFuel FROM CAR C, CAR_BRAND B , CAR_DESIGN D" + 
					"    WHERE C.brandID = b.brandID AND D.DESIGNID=C.DESIGNID AND BRANDNAME like '%'||?||'%'  AND D.DESIGNNAME LIKE'%'||?||'%'";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, brandname);
				pstmt.setString(2, designname);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					 String cid = rs.getString("cid");	
					 String carname=rs.getString("carname");
					 int cprice = rs.getInt("cprice");
					 String cphoto=rs.getString("cphoto");
					 String cfuel =rs.getString("cfuel");
					 dtos.add(new CarDto(cid, carname, brandname,  designname, cprice, cfuel, null, cphoto));
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage()+"오류3");
			}finally {
				try {
					if(rs   !=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn !=null) conn.close();
				} catch (SQLException e) {System.out.println(e.getMessage());}
			}
			return dtos;
		}
	//(5)cid로 dto 가져오기 
	public CarDto getCar(String cid)	{
		CarDto getcar = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT brandNAME,CARNAME,designname,CPRICE,CFUEL,CMILE,CPHOTO FROM CAR C , CAR_BRAND B, car_design D" + 
				"    WHERE C.BRANDID = B.BRANDID AND D.DESIGNID=C.DESIGNID AND CID = ? ";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String brandname =rs.getString("brandname");
				 String carname=rs.getString("carname");
				 String designname=rs.getString("designname");
				 int cprice = rs.getInt("cprice");
				 String cfuel=rs.getString("cfuel");
				 String cmile=rs.getString("cmile");
				 String cphoto=rs.getString("cphoto");
				 getcar = new CarDto(cid, carname, brandname, designname, cprice, cfuel, cmile, cphoto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()+"오류4");
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return getcar;
		
	}
	
	//(3)차 등록
	public int insertCar(CarDto car) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CAR (cid,brandID,CARNAME,designID,cPRICE,cfuel,cmILE,cphoto)" + 
				"    VALUES(?,?,?,?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, car.getCid());
			pstmt.setString(2, car.getBrandid());
			pstmt.setString(3, car.getCarname());
			pstmt.setString(4, car.getDesignid());
			pstmt.setInt(5,car.getCprice());
			pstmt.setString(6, car.getCfuel());
			pstmt.setString(7, car.getCmile());
			pstmt.setString(8, car.getCphoto());
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
	//(4)차 삭제
	public int deleteCar(String carname) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="DELETE FROM CAR WHERE CARNAME = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carname);
			result= pstmt.executeUpdate();
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
}
