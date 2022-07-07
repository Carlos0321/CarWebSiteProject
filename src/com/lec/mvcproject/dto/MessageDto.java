package com.lec.mvcproject.dto;

public class MessageDto {
	private int msid;
	private String mname;
	private String memail;
	private int mphone;
	private String memo;
	
	public MessageDto(int msid, String mname, String memail, int mphone, String memo) {
		this.msid = msid;
		this.mname = mname;
		this.memail = memail;
		this.mphone = mphone;
		this.memo = memo;
	}

	public int getMsid() {
		return msid;
	}

	public void setMsid(int msid) {
		this.msid = msid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public int getMphone() {
		return mphone;
	}

	public void setMphone(int mphone) {
		this.mphone = mphone;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "MessageDto [msid=" + msid + ", mname=" + mname + ", memail=" + memail + ", mphone=" + mphone + ", memo="
				+ memo + "]";
	}
	
	
}
