<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<html>
<style>
* {
   margin: 0;
   padding: 0;
}

.header {
   height: 20%
}

ul {
   margin-left: 20px
}

li {
   list-style-type: none;
}

.content {
   width: 500px;
   hieght: 600px;
   display: inline-flex;
}

.left {
   width: 250px;
   height: 500px;
}

.mid {
   width: 550px;
   height: 500px;
   display: inline-table;
}
a {
  text-decoration-line: none;
  }

.right {
   width: 250px;
   height: 500px;
   display: inline-table;
}

#map {
   width: 200px;
   height: 150px;
   border: 1px solid silver;
   margin: 10 20px
}

#list {
   width: 500px;
   height: 180px;
   border: 1px solid silver;
   margin: 10 20px;
   display: inline-flex
}

#right {
   width: 200px;
   height: 250px;
   border: 1px solid silver;
   margin: 10 20px;
}
#button{
        width:80px;
        margin:auto;
        display:block;
    }
</style>

<body>
   <!-- 동적인 페이지 포함 -->
   <jsp:include page="/WEB-INF/views/template/header.jsp">
      <jsp:param value="객실소개" name="title" />
   </jsp:include>
   <div class="header"></div>

   <div class="content">
      <div class="left">
         <div id="map">map1</div>

      </div>
     <%--  <div class="mid">
         <a href="" title="호텔이름1">
         <c:forEach var="gDTO" items="${list }">
         <div id="list">        
 			<img alt="${gDTO.gName }" src="resources/guestroom/${gDTO.gThumbnail }.JPG"  width="250px"
               height="178px"> 
            <img src="resources/guestroom/${gDTO.gThumbnail }.png" alt="room1" width="250px"
               height="148px">
            <ul>
               <li>${gDTO.gName }</li>
               <li>${gDTO.gPrice }</li>
               <li>☆☆☆☆☆<br> <br> </li>
               <li>지도api기반 위치띄우기</li>
               <li><img src="resources/together/check.JPG" alt="Facilities1">
                  <img src="resources/together/circle.JPG" alt="Facilities2">
                  <img src="resources/together/check.JPG" alt="Facilities3"> 
                  <img src="resources/together/circle.JPG" alt="Facilities4">
            </ul>
         </div>
           </c:forEach>
         </a>
         </div> --%>
   </div>
   <!-- 정적인 페이지 포함 -->
   <%@ include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>