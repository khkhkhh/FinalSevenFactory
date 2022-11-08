package com.koreait.sevenfactory.dto;

import java.util.Date;

public class SellerDTO {
   private int sNo, sNumber,extend;
   private String sId,sPw,hName,sEmail, sPhone;
   private Date sRegDate, sEndDate;
   
   public SellerDTO() {}
   public SellerDTO(int sNo, int sNumber, String sPhone,int extend,String sId, String sPw, String hName, String sEmail, Date sRegDate, Date sEndDate) {
      super();
      this.sNo =sNo;
      this.sNumber=sNumber;
      this.sPhone=sPhone;
      this.extend=extend;
      this.sId=sId;
      this.sPw=sPw;
      this.hName=hName;
      this.sEmail=sEmail;
      this.sRegDate=sRegDate;
      this.sEndDate=sEndDate;
   }
   public Date getsRegDate() {
      return sRegDate;
   }
   public void setsRegDate(Date sRegDate) {
      this.sRegDate = sRegDate;
   }
  
   public int getsNo() {
      return sNo;
   }
   public void setsNo(int sNo) {
      this.sNo = sNo;
   }
   public int getsNumber() {
      return sNumber;
   }
   public void setsNumber(int sNumber) {
      this.sNumber = sNumber;
   }
   public String getsPhone() {
      return sPhone;
   }
   public void setsPhone(String sPhone) {
      this.sPhone = sPhone;
   }
   public int getextend() {
      return extend;
   }
   public void setextend(int extend) {
      this.extend = extend;
   }
   
   public Date getsEndDate() {
      return sEndDate;
   }
   public void setsEndDate(Date sendDate) {
      sEndDate = sendDate;
   }
   public String getsId() {
         return sId;
      }
   public void setsId(String sId) {
      this.sId = sId;
   }
   public String getsPw() {
      return sPw;
   }
   public void setsPw(String sPw) {
      this.sPw = sPw;
   }
   public String gethName() {
      return hName;
   }
   public void sethName(String hName) {
      this.hName = hName;
   }
   public String getsEmail() {
      return sEmail;
   }
   public void setsEmail(String sEmail) {
      this.sEmail = sEmail;
   }
   
   
}