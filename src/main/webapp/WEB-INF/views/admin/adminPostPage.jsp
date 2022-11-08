<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="관리자용" name="title" />
</jsp:include>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
.container {
   width: 800px;
   height: 1200px;
}

.queryBtn {
   width: 70px;
   background-color: #4CAF50; /* Green */
   border: none;
   color: white;
   padding: 7px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   cursor: pointer;
   border-radius: 4px;
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

.queryInput {
   height: 40px;
   border-radius: 3px;
}

.Btn { /* 버튼 : 게시글추가, 전체회원 리스트 */
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

.search-row {
   width: auto;
}

.noticeListBox {
   width: 1100px;
   margin-bottom: 50px;
   margin: 50px auto;
   text-align: center;
}
</style>
<script type="text/javascript">
   function fn_insertPost() {
      if (confirm('게시글 작성 페이지로 이동합니다. 이동하시겠습니까?')) {
         window.location.href = 'noticeBoardInsertPage';
      }
   }
   
   $(document).ready(function() {
	 	var totalNoticeRecord = '${totalNoticeRecord}';
	 	var totalQNARecord = '${totalQNARecord}';
	 	var totalReviewRecord = '${totalReviewRecord}';
	 	if(totalQNARecord == '' && totalReviewRecord == ''){
	 		$("#NOTICE").css("display", "inline"); 
			$("#QNA").css("display", "none"); 
			$("#REVIEW").css("display", "none"); 
	 	}else if(totalNoticeRecord == '' && totalReviewRecord == '' ){
	 		$("#QNA").css("display", "inline"); 
			$("#NOTICE").css("display", "none"); 
			$("#REVIEW").css("display", "none"); 
	 	}else{
	 		$("#QNA").css("display", "none"); 
			$("#NOTICE").css("display", "none"); 
			$("#REVIEW").css("display", "inline"); 
	 	}
	   });
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container">
   <h1 class="text-center">게시글목록</h1>
   <br>
   <form class="text-right">

      <!-- 새로운 게시글 추가하기 -->
      <c:if test="${loginDTO ne null }">
         <input class="Btn btnAdd" type="button" value="게시글 추가하기"
            onclick="fn_insertPost()" />
      </c:if>
      <c:if test="${page le 2}">
         <input type="hidden" name="page" value="${page }">
      </c:if>
      <input class="Btn btnTotalList" type="button" value="전체 회원 보기"
         onclick="location.href='adminList'" />
   </form>
   <br>
    <div class="text-center" id="NOTICE">NOTICE ${totalNoticeRecord} 개</div>
 	<div class="text-center" id="QNA">QNA ${totalQNARecord} 개</div>
 	<div class="text-center" id="REVIEW">REVIEW ${totalReviewRecord} 개</div>
   <table class="table table-hover">
      <thead>
         <tr class="text-center">
            <td>게시글번호</td>
            <td>제목</td>
            <td>내용</td>
            <td>삭제여부</td>
            <td>등록일자</td>

         </tr>
      </thead>
      <tbody>
            <%--NOTICE --%>
            <c:if test="${empty list1 }">
               <tr>
                  <td colspan="5">NOTICE 게시글이 없습니다.</td>
               </tr>
            </c:if>
            <%--  notice (0:존재 1:삭제)--%>
            <c:if test="${not empty list1 }">
               <c:forEach var="pDTO" items="${list1 }">
                  <c:if test="${pDTO.nIsDelete eq 1 }">
                     <tr>
                        <td>${pDTO.nNo }</td>
                        <td>${pDTO.nTitle }</td>
                        <td>${pDTO.nContent }</td>
                        <td>${pDTO.nIsDelete }(삭제)</td>
                        <td>${pDTO.nNoticeDate }</td>
                     </tr>
                  </c:if>
                  <c:if test="${pDTO.nIsDelete eq 0 }">
                     <tr>
                        <td><a href="noticeBoardViewPage2?nNo=${pDTO.nNo}">${pDTO.nNo }</a></td>
                        <td>${pDTO.nTitle }</td>
                        <td>${pDTO.nContent }</td>
                        <td>${pDTO.nIsDelete }</td>
                        <td>${pDTO.nNoticeDate }</td>
                     </tr>
                  </c:if>
               </c:forEach>
            </c:if>
			         <tr>
			            <td colspan="5">
			               ${pageView }   
			            </td>
			         </tr>
            <%--QNA --%>
            <c:if test="${empty list2 }">
               <tr>
                  <td colspan="5">QNA게시글 없습니다.</td>
               </tr>
            </c:if>
         <c:if test="${not empty list2 }">
               <c:forEach var="qDTO" items="${list2 }">
                  <c:if test="${qDTO.qIsdelete eq 0 }">
                     <tr>
                        <td>${qDTO.qNo }</td>
                        <td>${qDTO.qTitle }</td>
                        <td>${qDTO.qContent }</td>
                        <td>${qDTO.qIsdelete }(삭제)</td>                        
                        <td>${qDTO.qNoticedate }</td>
                     </tr>
                  </c:if>
                  <c:if test="${qDTO.qIsdelete eq 1 }">
                     <tr>
                        <td><a href="qnaBoardView?qNo=${qDTO.qNo }">${qDTO.qNo}</a></td>
                        <td>${qDTO.qTitle }</td>
                        <td>${qDTO.qContent }</td>
                        <td>${qDTO.qIsdelete }</td>
                        <td>${qDTO.qNoticedate }</td>
                     </tr>
                  </c:if>
               </c:forEach>
            </c:if>
            		<tr>
			            <td colspan="5">
			               ${pageView }   
			            </td>
			         </tr>
            <%--REVIEW --%>
            <c:if test="${empty list3 }">
               <tr>
                  <td colspan="5">REVIEW 게시글 없습니다.</td>
               </tr>
            </c:if>
            <%--  review (1:존재 0:삭제)--%>
            <c:if test="${not empty list3 }">
               <c:forEach var="rDTO" items="${list3 }">
                  <c:if test="${rDTO.rIsdelete eq 0 }">
                     <tr>
                        <td>${rDTO.rNo }</td>
                        <td>${rDTO.rTitle }</td>
                        <td>${rDTO.rContent }</td>
                        <td>${rDTO.rIsdelete }(삭제)</td>
                        <td>${rDTO.rRegDate }</td>
                     </tr>
                  </c:if>
                  <c:if test="${rDTO.rIsdelete eq 1 }">
                     <tr>
                        <td><a href="ReviewBoardViewPage?rNo=${rDTO.rNo}">${rDTO.rNo}</a></td>
                        <td>${rDTO.rTitle }</td>
                        <td>${rDTO.rContent }</td>
                        <td>${rDTO.rIsdelete }</td>
                        <td>${rDTO.rRegDate }</td>
                     </tr>
                  </c:if>
               </c:forEach>
            </c:if>
            <tr>
			            <td colspan="5">
			               ${pageView }   
			            </td>
			         </tr>
      </tbody>
   </table>
   <br>
</div>

<!-- 관리자가 로그인하면 "관리자메뉴"를 표시한다. -->

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>