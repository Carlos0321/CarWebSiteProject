package com.lec.mvcproject.dto;

public class AdminDto {
	private String aId;
	private String aPw;
	
	public AdminDto() {}

	public AdminDto(String aId, String aPw) {
		this.aId = aId;
		this.aPw = aPw;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getaPw() {
		return aPw;
	}

	public void setaPw(String aPw) {
		this.aPw = aPw;
	}

	@Override
	public String toString() {
		return "AdminDto [aId=" + aId + ", aPw=" + aPw + "]";
	}
	
}