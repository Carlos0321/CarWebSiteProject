package com.lec.mvcproject.dto;

public class CarDto {
	private String cid;
	private String brandid;
	private String carname;
	private String designid;
	private String brandname;
	private String designname;
	private int cprice;
	private String cfuel;
	private String cmile;
	private String cphoto;
	
	public CarDto() {}

	public CarDto(String cid, String carname, String brandname, String designname, int cprice, String cfuel,
			String cmile, String cphoto) {
		this.cid = cid;
		this.carname = carname;
		this.brandname = brandname;
		this.designname = designname;
		this.cprice = cprice;
		this.cfuel = cfuel;
		this.cmile = cmile;
		this.cphoto = cphoto;
	}
	public CarDto(String cid, String carname, int cprice, String cphoto) {
		this.cid = cid;
		this.carname = carname;
		this.cprice = cprice;
		this.cphoto = cphoto;
	}
	public CarDto(String carname, int cprice, String cphoto) {
		super();
		this.carname = carname;
		this.cprice = cprice;
		this.cphoto = cphoto;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getBrandid() {
		return brandid;
	}

	public void setBrandid(String brandid) {
		this.brandid = brandid;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public String getDesignid() {
		return designid;
	}

	public void setDesignid(String designid) {
		this.designid = designid;
	}

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public String getCfuel() {
		return cfuel;
	}

	public void setCfuel(String cfuel) {
		this.cfuel = cfuel;
	}

	public String getCmile() {
		return cmile;
	}

	public void setCmile(String cmile) {
		this.cmile = cmile;
	}

	public String getCphoto() {
		return cphoto;
	}

	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getDesignname() {
		return designname;
	}

	public void setDesignname(String designname) {
		this.designname = designname;
	}

	@Override
	public String toString() {
		return "CarDto [cid=" + cid + ", brandid=" + brandid + ", carname=" + carname + ", designid=" + designid
				+ ", cprice=" + cprice + ", cfuel=" + cfuel + ", cmile=" + cmile + ", cphoto=" + cphoto + "]";
	}
	
}
