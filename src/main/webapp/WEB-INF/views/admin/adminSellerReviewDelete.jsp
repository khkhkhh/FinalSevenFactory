<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="관리자용" name="title" />
</jsp:include>
<jsp:include page="/WEB-INF/views/template/adminSide.jsp" />

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
.container {
   width: 70%;
   height: 700px;
   display: fiexd;
   /*       margin-left:100px; */
}

tr, th {
   text-align: center;
}

select {
   width: 140px;
   padding: .6em .3em;
   font-family: inherit;
   background:
      url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
      no-repeat 95% 50%;
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

.Btn { /* 버튼 : 회원추가, 전체회원 리스트 */
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
      function fn_ReviewDeleteOk(a){
         if( confirm('삭제승인 하시겠습니까?') ){
            var url = 'adminSellerReviewDeleteRequest?mId=' + a ;
               location.href= url;
               alert("승인이 완료되었습니다.");
           }
         }
</script>
<div class="container">
   <h3 class="text-center">리뷰삭제 요청목록</h3>
   <br>

   <br>
   <form method="POST">
      <table class="table table-hover">
         <thead>
            <tr class="text-center">
               <th>회원아이디</th>
               <th>제목</th>
               <th>등록일</th>
               <th>방 이름</th>
               <th>별점</th>
               <th></th>
            </tr>
         </thead>
         <tbody class="search row">
            <c:choose>
               <c:when test="${empty list }">
                  <tr>
                     <td colspan="6">리뷰 삭제 요청목록이 없습니다.</td>
                  </tr>
               </c:when>

               <c:when test="${not empty list }">
                  <c:forEach var="rDTO" items="${list }" varStatus="status">
                     <!-- 삭제 승인 대기 중 -->
                     <c:if test="${rDTO.rIsdelete eq 2}">
                        <tr>
                           <td>${rDTO.mId }</td>
                           <td>${rDTO.rTitle }</td>
                           <td>${rDTO.rRegDate }</td>
                           <td>${rDTO.gName }</td>
                           <td>${rDTO.rRating }/5.0 점</td>
                           <td><input class="Btns confirmBtn" type="button"
                              value="승인대기" id="Btn" onclick="fn_ReviewDeleteOk('${rDTO.mId}')">
                           </td>
                        </tr>
                     </c:if>

                     <!-- 삭제 완료 -->
                     <c:if test="${rDTO.rIsdelete eq 0}">
                        <tr>
                           <td>${rDTO.mId }</td>
                           <td>${rDTO.rTitle }</td>
                           <td>${rDTO.rRegDate }</td>
                           <td>${rDTO.gName }</td>
                           <td>${rDTO.rRating }/5.0 점</td>
                           <td><input type="button" value="승인완료"></td>
                        </tr>
                     </c:if>
                  </c:forEach>
               </c:when>
            </c:choose>
         </tbody>
      </table>
   </form>
</div>

<!-- 관리자가 로그인하면 "관리자메뉴"를 표시한다. -->

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>