package com.lec.mvcproject.dto;

public class EstimateDto {
	private int eid;
	private String mid;
	private String brandname;
	private String carname;
	private int prepayment;
	private int term;
	private String cplace;
	private int pay;
	
	public EstimateDto() {}
	public EstimateDto(int eid, String mid, String brandname, String carname, int prepayment, int term, String cplace,
			int pay) {
		this.eid = eid;
		this.mid = mid;
		this.brandname = brandname;
		this.carname = carname;
		this.prepayment = prepayment;
		this.term = term;
		this.cplace = cplace;
		this.pay = pay;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public int getPrepayment() {
		return prepayment;
	}
	public void setPrepayment(int prepayment) {
		this.prepayment = prepayment;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public String getCplace() {
		return cplace;
	}
	public void setCplace(String cplace) {
		this.cplace = cplace;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "Estimate [eid=" + eid + ", mid=" + mid + ", brandname=" + brandname + ", carname=" + carname
				+ ", prepayment=" + prepayment + ", term=" + term + ", cplace=" + cplace + ", pay=" + pay + "]";
	}
	
	
	
}
