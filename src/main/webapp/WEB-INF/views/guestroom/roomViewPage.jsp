<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
* {
   textalign: center;
}

.roomListOne {
   display: inline-block;
   padding: 40px;
   transition: 0.5s;
}

.roomListOne:hover {
   transform: scale;
   scale: 1.02;
   opacity: 0.8;
}

img {
   width: 500px;
}

.roomListBox {
   padding-top: 50px;
   text-align: center;
}

.roomInfoLeft, .roomInfoRight {
   display: inline-block;
   padding: 5px;
}

.roomInfoLeft {
   text-align: left;
}

.roomInfoRight {
   text-align: right;
}

#line {
   margin: auto;
   color: gray;
   width: 1400px;
   border: 1px solid silver
}

.roomList_backimg {
   width: 100%;
   height: 750px;
   background-size: cover;
   background-image: url("resources/assets/background_img/hoteldog.png");
   text-align: center;
   color: white;
   padding-top: 300px;
}

#pagetitle {
   font-size: 85px;
   color: white;
}

#sevenfactory {
   font-weight: bold;
   color: white;
}

#roominfo {
   width: 200px;
}
</style>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="객실소개" name="title" />
</jsp:include>

<!-- roomInfo 리스트 페이지  -->
<!-- 수정 form태그 추가 -->
<form>
   <div class="roomList_backimg">
      <h3 id="sevenfactory">Together</h3>
      <h1 id="pagetitle">Preview Rooms</h1>
   </div>
   <div class="roomListBox">
      <img id="roominfo" alt="roominfo"
         src="resources/assets/name_img/roominfo_name.png" /><br />
      <h2>사진을 클릭하면 예약화면으로 넘어갑니다.</h2>
      <br />
      <c:forEach var="gDTO" items="${list }" varStatus="status">
         <div class="roomListOne">
            <a href="romdetail?hNo=${gDTO.hNo }&gNo=${gDTO.gNo}&rCheckIn=${rCheckIn}&rCheckOut=${rCheckOut}">
               <img alt="${gDTO.gName }"
               src="resources/assets/guestroom/${gDTO.gThumbnail }.JPG">
            </a>
            <!-- 방정보  -->
            <div class="roomInfoLeft">
               <h3>${gDTO.gName }</h3>
               <br /> ${gDTO.gExplain}<br /> 최저가: ${gDTO.gPrice}<br /> 
               최소인원: ${gDTO.gMinPeople} | 최대인원: ${gDTO.gMaxPeople}<br />
               평점 : ${Rating[status.index] } / 5.0
            </div>
         </div>
         <br />
         <hr id="line" />
      </c:forEach>
   </div>
</form>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>