package com.lec.mvcproject.dto;

import java.sql.Timestamp;

public class ReserveDto {
	private int rid;
	private String mname;
	private String mtel;
	private String brandname;
	private String carname;
	private Timestamp crdate;
	private String cplace;
	
	public ReserveDto() {}

	public ReserveDto(int rid, String mname, String mtel, String brandname, String carname, Timestamp crdate,
			String cplace) {
		this.rid = rid;
		this.mname = mname;
		this.mtel = mtel;
		this.brandname = brandname;
		this.carname = carname;
		this.crdate = crdate;
		this.cplace = cplace;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public Timestamp getCrdate() {
		return crdate;
	}

	public void setCrdate(Timestamp crdate) {
		this.crdate = crdate;
	}

	public String getCplace() {
		return cplace;
	}

	public void setCplace(String cplace) {
		this.cplace = cplace;
	}

	@Override
	public String toString() {
		return "ReserveDto [rid=" + rid + ", mname=" + mname + ", mtel=" + mtel + ", brandname=" + brandname
				+ ", carname=" + carname + ", crdate=" + crdate + ", cplace=" + cplace + "]";
	}
	
	
	
	
	
}
