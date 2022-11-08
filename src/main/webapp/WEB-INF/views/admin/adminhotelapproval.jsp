<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="관리자용" name="title"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/template/adminSide.jsp" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
   .container {
      width: 70%;
      height: 700px;
      display: fiexd;
/*       margin-left:100px; */
   }
   
   tr, th {text-align: center;}
   select {
     width: 140px;
     padding: .6em .3em;
     font-family: inherit;
     background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
     -webkit-appearance: none;
     -moz-appearance: none;
     appearance: none;
     border: 1px solid #999;
     border-radius: 0px;
   }
   select::-ms-expand {
     /* for IE 11 */
     display: none;
   }
   
   .Btn{ /* 버튼 : 회원추가, 전체회원 리스트 */
      
      background-color: #4CAF50; /* Green */
      border: none;
      color: white;
      padding: 10px 24px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      transition-duration: 0.4s;
      cursor: pointer;
   }
   .btnAdd, .btnTotalList {
     background-color: white; 
     color: black; 
     border: 2px solid #4CAF50;
   }
   .btnAdd:hover, .btnTotalList:hover {
     background-color: #4CAF50;
     color: white;
   }
    
</style>
<script type="text/javascript">
   
    //테이블에서 행에있는 버튼을 누르면 해당 행의 hNo를 뽑아오기 위해 사용   
      function approval(i){
         var url = 'hotelapproval?hNo='+i;
         location.href= url;
         alert("승인이 완료되었습니다.");
      }
</script>
<div class="container">
   <h3 class="text-center">미승인호텔</h3><br>
   
   <div class="text-center">전체 ${totalRecord} 개</div>
   
   <br>
   <table class="table table-hover">
      <thead>
         <tr class="text-center">
            <th>호텔번호</th>
            <th>호텔이름</th>
            <th>호텔주소</th>
            <th>방개수</th>
            <th>최저가</th>
            <th>승인하기</th>
         </tr>
      </thead>
      <tbody class="search row">
         
         <c:choose>
         
            <c:when test="${empty list }">
               <tr>
                  <td colspan="6">미승인호텔이 없습니다.</td>
               </tr>
            </c:when>
            
            <c:when test="${not empty list }">
               <c:forEach var="hDTO" items="${list }">
               <!-- 미승인호텔 -->
                  <c:if test="${hDTO.hApproval eq 0}">
                        <tr>
                           <td>${hDTO.hNo }</td>
                           <td>${hDTO.hName }</td>
                           <td>${hDTO.hAddress }</td>
                           <td>${hDTO.hAmount }</td>
                           <td>${hDTO.hMinprice }</td>
                           <td><input type="button" value="승인하기" onclick="approval(${hDTO.hNo })"></td>
                        </tr>
                  </c:if>
               </c:forEach>
            </c:when>
         </c:choose>
      </tbody>
   </table>
   <h3 class="text-center">승인완료호텔</h3>
   <table class="table table-hover">
      <thead>
         <tr class="text-center">
            <th>호텔번호</th>
            <th>호텔이름</th>
            <th>호텔주소</th>
            <th>방개수</th>
            <th>최저가</th>
         </tr>
      </thead>
      <tbody class="search row">
         
         <c:choose>
         
            <c:when test="${empty list }">
               <tr>
                  <td colspan="6">미승인호텔이 없습니다.</td>
               </tr>
            </c:when>
            
            <c:when test="${not empty list }">
               <!-- 승인호텔 -->
               <c:forEach var="hDTO" items="${list }">
               <c:if test="${hDTO.hApproval ne 0}">
                         <tr>
                           <td>${hDTO.hNo }</td>
                           <td>${hDTO.hName }</td>
                           <td>${hDTO.hAddress }</td>
                           <td>${hDTO.hAmount }</td>
                           <td>${hDTO.hMinprice }</td>   
                        </tr>
                  </c:if>
                   </c:forEach>
            </c:when>
         </c:choose>
      </tbody>
   </table>
</div>

<!-- 관리자가 로그인하면 "관리자메뉴"를 표시한다. -->

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>