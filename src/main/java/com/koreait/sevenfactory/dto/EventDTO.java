package com.koreait.sevenfactory.dto;

import java.util.Date;

public class EventDTO {

	private int eNo, ePrice,eXtend,eApproval,eDelete;
	private String gName, eAddtion, eThumbnail,sId,eReason;
	private Date eStart, eEnd, eUpdate;
	
	
	
	public EventDTO() {
		super();
	}

	public EventDTO(int eNo, int ePrice, int eXtend, int eApproval, int eDelete, String gName, String eAddtion,
			String eThumbnail, String sId, String eReason, Date eStart, Date eEnd, Date eUpdate) {
		super();
		this.eNo = eNo;
		this.ePrice = ePrice;
		this.eXtend = eXtend;
		this.eApproval = eApproval;
		this.eDelete = eDelete;
		this.gName = gName;
		this.eAddtion = eAddtion;
		this.eThumbnail = eThumbnail;
		this.sId = sId;
		this.eReason = eReason;
		this.eStart = eStart;
		this.eEnd = eEnd;
		this.eUpdate = eUpdate;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public int getePrice() {
		return ePrice;
	}

	public void setePrice(int ePrice) {
		this.ePrice = ePrice;
	}

	public int geteXtend() {
		return eXtend;
	}

	public void seteXtend(int eXtend) {
		this.eXtend = eXtend;
	}

	public int geteApproval() {
		return eApproval;
	}

	public void seteApproval(int eApproval) {
		this.eApproval = eApproval;
	}

	public int geteDelete() {
		return eDelete;
	}

	public void seteDelete(int eDelete) {
		this.eDelete = eDelete;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String geteAddtion() {
		return eAddtion;
	}

	public void seteAddtion(String eAddtion) {
		this.eAddtion = eAddtion;
	}

	public String geteThumbnail() {
		return eThumbnail;
	}

	public void seteThumbnail(String eThumbnail) {
		this.eThumbnail = eThumbnail;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String geteReason() {
		return eReason;
	}

	public void seteReason(String eReason) {
		this.eReason = eReason;
	}

	public Date geteStart() {
		return eStart;
	}

	public void seteStart(Date eStart) {
		this.eStart = eStart;
	}

	public Date geteEnd() {
		return eEnd;
	}

	public void seteEnd(Date eEnd) {
		this.eEnd = eEnd;
	}

	public Date geteUpdate() {
		return eUpdate;
	}

	public void seteUpdate(Date eUpdate) {
		this.eUpdate = eUpdate;
	}
	
	
	
	
}