package com.lec.mvcproject.dto;

import java.sql.Date;

public class CommentDto {
	private int cno ;
	private String cmemo;
	private String mid;
	private int bno;
	private Date cdate;
	
	public CommentDto(int cno, String cmemo, String mid, int bno, Date cdate) {
		this.cno = cno;
		this.cmemo = cmemo;
		this.mid = mid;
		this.bno = bno;
		this.cdate = cdate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCmemo() {
		return cmemo;
	}

	public void setCmemo(String cmemo) {
		this.cmemo = cmemo;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	@Override
	public String toString() {
		return "CommentDto [cno=" + cno + ", cmemo=" + cmemo + ", mid=" + mid + ", bno=" + bno + ", cdate=" + cdate
				+ "]";
	}
	
	
}
