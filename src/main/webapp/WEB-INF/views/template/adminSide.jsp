<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
</head>
<style>
.all{
   border: 1px solid black;
   width:250px;
   height:auto;
   float:left;   
   margin-right: 150px;
   margin-left:40px;
   position : fixed;
}
li{ 
   margin:0px 20px;
   list-style-type: none;
}
a{
   text-decoration: none;
}

</style>
<body>
   <div style="height:200px; width:100%; ">
   </div> 
<div class="all">
   <div>
      <ul> 
         <li class="icon"><i class="fa-solid fa-user-tie" style="font-size:25px;"></i>사업자 관리</li>
         <li><a href="adminsellerlist1">사업자 목록</a></li>
         <li><a href="adminHotelList">호텔 승인</a></li>
         <li><a href="adminSellerList">연장/연결승인</a></li>
         <li><a href="adminSellerReviewDelete">리뷰삭제 승인</a></li>
      </ul>
      
      <ul>
         <li class="icon"><i class="fa-solid fa-users" style="font-size:25px;"></i>회원 관리</li>
         <li><a href="adminList">회원 목록</a></li>
         <li><a href="adminBlack">블랙리스트 승인</a></li>
      </ul>
      
      <ul>
         <li class="icon"><i class="fa-solid fa-champagne-glasses" style="font-size:25px;"></i>이벤트 관리</li>
         <li><a href="adminEventList">이벤트 승인</a></li>
         <li><a href="adminEventExtendList">이벤트 연장</a></li>
      </ul>
   </div>
</div>
</body>
</html>