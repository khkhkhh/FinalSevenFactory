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
   // 검색 결과 보기
   function fn_queryAdminList(f) {
      if (f.query.value == '') {
         //swal("검색할 입력은 필수입니다","", 'error');
         alert('검색할 입력은 필수입니다');
         f.query.focus();
         return;
      }
      if (f.column.value == 'EMPTY' && f.query.value != '' || f.board.value == 'EMPTY') {
         //swal("검색할 카테고리를 지정해주세요","", 'error');
         alert('검색할 카테고리를 지정해주세요');
         f.column.focus();
         return;
      }
      f.action = 'queryAdminPostListPage';
      f.submit();
   }

   function fn_insertPost() {
      if (confirm('게시글 작성 페이지로 이동합니다. 이동하시겠습니까?')) {
         window.location.href = 'noticeBoardInsertPage';
      }
   }
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
      <div class="text-center">NOTICE ${totalNoticeRecord} 개</div>
   
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
      <tbody class="search-row">

         <c:choose>
            <%--NOTICE --%>
            <c:when test="${empty list }">
               <tr>
                  <td colspan="5">게시글이 없습니다.</td>
               </tr>
            </c:when>
            <%--  notice (0:존재 1:삭제)--%>
            <c:when test="${not empty list }">
               <c:forEach var="pDTO" items="${list }">
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
                        <td><a href="noticeBoardViewPage?nNo=${pDTO.nNo}&page=${page}">${pDTO.nNo }</a></td>
                        <td>${pDTO.nTitle }</td>
                        <td>${pDTO.nContent }</td>
                        <td>${pDTO.nIsDelete }</td>
                        <td>${pDTO.nNoticeDate }</td>
                     </tr>
                  </c:if>
               </c:forEach>
            </c:when>
         </c:choose>
                     <tr>
			            <td colspan="5">
			               ${pageNoticeView }   
			            </td>
			         </tr>
      </tbody>
   </table>
   <br>
   <div class="text-center">QNA ${totalQnaRecord} 개</div>
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
      <tbody class="search-row">
         <c:choose>
            <%--QNA --%>
            <c:when test="${empty list2 }">
               <tr>
                  <td colspan="5">게시글이 없습니다.</td>
               </tr>
            </c:when>
            <%--  qna (1:존재 0:삭제)--%>
            <c:when test="${not empty list2 }">
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
            </c:when>
         </c:choose>
                     <tr>
			            <td colspan="5">
			               ${pageQNAView }   
			            </td>
			         </tr>
      </tbody>
   </table>
   <br>
   <div class="text-center">REVIEW ${totalReviewRecord} 개</div>
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
      <tbody class="search-row">
         <c:choose>
            <%--REVIEW --%>
            <c:when test="${empty list3 }">
               <tr>
                  <td colspan="5">게시글이 없습니다.</td>
               </tr>
            </c:when>
            <%--  review (1:존재 0:삭제)--%>
            <c:when test="${not empty list3 }">
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
                        <td><a href="ReviewBoardViewPage?rNo=${rDTO.rNo}&mId=${rDTO.mId}">${rDTO.rNo}</a></td>
                        <td>${rDTO.rTitle }</td>
                        <td>${rDTO.rContent }</td>
                        <td>${rDTO.rIsdelete }</td>
                        <td>${rDTO.rRegDate }</td>
                     </tr>
                  </c:if>
               </c:forEach>
            </c:when>
         </c:choose>
         	         <tr>
			            <td colspan="5">
			               ${pageReviewView }   
			            </td>
			         </tr>
      </tbody>
   </table>
   <br> <br>
   <div class="text-center">
         <br>
         <br>
         <form class="text-center">
            <%-- 검색 --%>
            <select name="board">
            	<option value="EMPTY">::게시판 선택::</option>
            	<option value="NOTICE">NOTICE</option>
               	<option value="QNA">QNA</option>
            	<option value="REVIEW">REVIEW</option>
            </select>
            <select name="column">
               <option value="EMPTY">::검색 선택::</option>
               <option value="TITLE">제목</option>
               <option value="CONTENT">내용</option>
            </select> 
            
            	<input class="queryInput" type="text" name="query" placeholder="검색어를 입력해주세요" size="25" /> 
               <input class="queryBtn" type="button" value="검색" onclick="fn_queryAdminList(this.form)" />
         </form>
   </div>
</div>

<!-- 관리자가 로그인하면 "관리자메뉴"를 표시한다. -->

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>