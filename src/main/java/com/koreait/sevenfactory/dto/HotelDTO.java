package com.koreait.sevenfactory.dto;

public class HotelDTO {
   private int hNo, hAmount, hMinprice,hApproval;
   private String hName,hAddress,hThumbnail;

   public HotelDTO() {}
   
   public HotelDTO(int hNo, int hAmount, int hMinprice, int hApproval ,String hName, String hAddress, String hThumbnail) {
      super();
      this.hNo = hNo;
      this.hAmount = hAmount;
      this.hMinprice = hMinprice;
      this.hName = hName;
      this.hAddress = hAddress;
      this.hThumbnail = hThumbnail;
      this.hApproval = hApproval;
   }

   public int gethNo() {
      return hNo;
   }

   public void sethNo(int hNo) {
      this.hNo = hNo;
   }

   public int gethAmount() {
      return hAmount;
   }

   public void sethAmount(int hAmount) {
      this.hAmount = hAmount;
   }
   

   public int gethMinprice() {
      return hMinprice;
   }

   public void sethMinprice(int hMinprice) {
      this.hMinprice = hMinprice;
   }

   public String gethName() {
      return hName;
   }

   public void sethName(String hName) {
      this.hName = hName;
   }

   public String gethAddress() {
      return hAddress;
   }

   public void sethAddress(String hAddress) {
      this.hAddress = hAddress;
   }

   public String gethThumbnail() {
      return hThumbnail;
   }

   public void sethThumbnail(String hThumbnail) {
      this.hThumbnail = hThumbnail;
   }

   public int gethApproval() {
      return hApproval;
   }

   public void sethApproval(int hApproval) {
      this.hApproval = hApproval;
   }

}