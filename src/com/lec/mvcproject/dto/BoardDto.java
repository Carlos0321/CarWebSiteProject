package com.lec.mvcproject.dto;

import java.sql.Date;

public class BoardDto {
	private int bno;
	private String mid;
	private String bsubject;
	private String  bcontent;
	private String  bfile;
	private int bhit ;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bip;
	private Date brdate;
	
	public BoardDto() {}

	public BoardDto(int bno, String mid, String bsubject, String bcontent, String bfile, int bhit, int bgroup,
			int bstep, int bindent, String bip, Date brdate) {
		this.bno = bno;
		this.mid = mid;
		this.bsubject = bsubject;
		this.bcontent = bcontent;
		this.bfile = bfile;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bip = bip;
		this.brdate = brdate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getBsubject() {
		return bsubject;
	}

	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBfile() {
		return bfile;
	}

	public void setBfile(String bfile) {
		this.bfile = bfile;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}

	public int getBgroup() {
		return bgroup;
	}

	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}

	public int getBstep() {
		return bstep;
	}

	public void setBstep(int bstep) {
		this.bstep = bstep;
	}

	public int getBindent() {
		return bindent;
	}

	public void setBindent(int bindent) {
		this.bindent = bindent;
	}

	public String getBip() {
		return bip;
	}

	public void setBip(String bip) {
		this.bip = bip;
	}

	public Date getBrdate() {
		return brdate;
	}

	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}

	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", mid=" + mid + ", bsubject=" + bsubject + ", bcontent=" + bcontent
				+ ", bfile=" + bfile + ", bhit=" + bhit + ", bgroup=" + bgroup + ", bstep=" + bstep + ", bindent="
				+ bindent + ", bip=" + bip + ", brdate=" + brdate + "]";
	}
	
}
	