<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />
<title>Insert title here</title>
<style type="text/css">
.allcontent table {
   border-collapse: collapse;
   width: 1100px;
   text-align: center;
}

.allcontent thead td {
   background: #FEE3EC;
}

.allcontent td {
   padding: 10px;
   border-bottom: 1px solid lightgray;
}


a {
   text-decoration: none;
}

h3 {
   margin-left: 1000px;
}
</style>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<script type="text/javascript">
   function fn_SellerReviewRequest() {
      if (confirm('삭제요청 하시겠습니까?')) {
         alert('요청이 완료되었습니다.');
         sellerReview.action = 'SellerReviewRequest';
         sellerReview.submit();
      }
   }
</script>


<!--완전 REVIEWBOARDLIST따와서 비슷한형식으로 컨트롤러구성하고 XML에만 WHERE조건절 추가해주기  -->
      <h3>호텔 리뷰관리 페이지</h3>
<div class="allcontent">
   <form id="sellerReview" method="POST">
      <table>
         <thead>
            <tr>
               <td>리뷰번호</td>
               <td>ID</td>
               <td>제목</td>
               <td>작성일</td>
               <td>호실</td>
               <td>평점</td>
               <td>삭제여부</td>
               <td></td>
            </tr>
         </thead>
         <tbody>
             <c:choose>
               <c:when test="${empty list }">
                  <tr>
                     <td style="text-align: center;" colspan="7">작성된 게시글이 없습니다.</td>
                  </tr>
               </c:when>
               <c:when test="${not empty list }">
                  <c:forEach var="rDTO" items="${list }">
                     <c:if test="${rDTO.rIsdelete eq 1}">
                        <tr>
                           <td>${rDTO.rNo}</td>
                           <td>${rDTO.mId}</td>
                           <td>${rDTO.rTitle }</td>
                           <td>${rDTO.rRegDate}</td>
                           <td>${rDTO.gName }</td>
                           <td>${rDTO.rRating }/5.0</td>
                           <td>${rDTO.rIsdelete}(존재)</td>
                           <td>
                           <input type="hidden" value="${rDTO.rNo }" name="rNo" />
                           <input type="hidden" value="${loginDTO.sId }" name="sId"/>
                           <input class="Btns confirmBtn" type="button" value="승인요청하기" onclick="fn_SellerReviewRequest()">
                           </td>
                        </tr>
                     </c:if>
                     <c:if test="${rDTO.rIsdelete eq 2}">
                        <tr>
                           <td>${rDTO.rNo}</td>
                           <td>${rDTO.mId}</td>
                           <td>${rDTO.rTitle }</td>
                           <td>${rDTO.rRegDate}</td>
                           <td>${rDTO.gName }</td>
                           <td>${rDTO.rRating }/5.0</td>
                           <td>${rDTO.rIsdelete}(승인대기)</td>
                           <td>
                           <input class="Btns confirmBtn" type="button" value="승인대기중" style="background-color: gold; border: 1px solid black; border-radius: 5px;"></td>
                        </tr>
                     </c:if>
                  </c:forEach>
                </c:when>
            </c:choose>
         </tbody>
      </table>
   </form>
</div>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>