package com.lec.mvcproject.dto;

import java.sql.Date;

public class MemberDto {
	private String mid;
	private int mgrade;
	private String mname;
	private String mpw;
	private String mtel;
	private String memail;
	private String maddress;
	private String mgender;
	private Date mbirth;
	
	public MemberDto() {}
	//회원가입용
	public MemberDto(String mid, int mgrade, String mname, String mpw, String mtel, String memail, String maddress,
			String mgender, Date mbirth) {
		this.mid = mid;
		this.mgrade = mgrade;
		this.mname = mname;
		this.mpw = mpw;
		this.mtel = mtel;
		this.memail = memail;
		this.maddress = maddress;
		this.mgender = mgender;
		this.mbirth = mbirth;
	}
	//정보수정용
	public MemberDto(String mid, int mgrade, String mname, String mpw, String mtel, String memail, String maddress) {
		super();
		this.mid = mid;
		this.mgrade = mgrade;
		this.mname = mname;
		this.mpw = mpw;
		this.mtel = mtel;
		this.memail = memail;
		this.maddress = maddress;
	}
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getMgrade() {
		return mgrade;
	}

	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public Date getMbirth() {
		return mbirth;
	}

	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}

	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mgrade=" + mgrade + ", mname=" + mname + ", mpw=" + mpw + ", mtel=" + mtel
				+ ", memail=" + memail + ", maddress=" + maddress + ", mgender=" + mgender + ", mbirth=" + mbirth + "]";
	}
	
}
	
