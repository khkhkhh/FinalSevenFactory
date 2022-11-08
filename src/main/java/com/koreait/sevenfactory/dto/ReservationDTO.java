package com.koreait.sevenfactory.dto;

import java.sql.Date;

public class ReservationDTO {

	private int rNo, gNo, mNo, rApproval, rPeople, rPrice,hNo ;
	private Date rCheckIn, rCheckOut,rRegdate;
	private String gName, nMId,nMphone;
	
	public ReservationDTO() {	}

	public ReservationDTO(int rNo, int gNo, int mNo, int rApproval, int rPeople, int rPrice, int hNo, Date rCheckIn,
			Date rCheckOut, String gName, String nMId, String nMphone, Date rRegdate) {
		super();
		this.rNo = rNo;
		this.gNo = gNo;
		this.mNo = mNo;
		this.rApproval = rApproval;
		this.rPeople = rPeople;
		this.rPrice = rPrice;
		this.hNo =hNo;
		this.rCheckIn = rCheckIn;
		this.rCheckOut = rCheckOut;
		this.gName = gName;
		this.nMId = nMId;
		this.nMphone=nMphone;
		this.rRegdate = rRegdate;
	}

	

	public String getnMId() {
		return nMId;
	}

	public void setnMId(String nMId) {
		this.nMId = nMId;
	}

	public String getnMphone() {
		return nMphone;
	}

	public void setnMphone(String nMphone) {
		this.nMphone = nMphone;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getrApproval() {
		return rApproval;
	}

	public void setrApproval(int rApproval) {
		this.rApproval = rApproval;
	}

	public int getrPeople() {
		return rPeople;
	}

	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}

	public int getrPrice() {
		return rPrice;
	}

	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}
	

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public Date getrCheckIn() {
		return rCheckIn;
	}

	public void setrCheckIn(Date rCheckIn) {
		this.rCheckIn = rCheckIn;
	}

	public Date getrCheckOut() {
		return rCheckOut;
	}

	public void setrCheckOut(Date rCheckOut) {
		this.rCheckOut = rCheckOut;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public Date getrRegdate() {
		return rRegdate;
	}

	public void setrRegdate(Date rRegdate) {
		this.rRegdate = rRegdate;
	}

		
	
}
