<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="회원상세보기" name="title"/>
</jsp:include>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
   .centered{margin-top:200px;}
   .admin-view-box {
      width: 800px;
      margin: auto;
   }
   .admin-view-box table {
      border-collapse: collapse;
      width: 600px;
      margin: auto;
   }
   .admin-view-box table td {
      border: 1px solid black;
      padding: 5px;
   }
   .admin-view-box table tbody td:nth-of-type(1) { width: 300px; text-align: left;}
   .admin-view-box table tbody td:nth-of-type(2) { width: 100px; }
   .admin-view-box table tbody td:nth-of-type(3) { width: 100px; }
   .admin-view-box table tbody td:nth-of-type(4) { width: 70px; }
   .admin-view-box table tbody thead tr:nth-of-type(1) {
      text-align: center;
      font-weight: bold;
      background-color: teal;
   }
   
</style>
<script>
   function fn_memberLeave(f){
      if( confirm('정말 탈퇴할까요?') ){
         alert('회원이 탈퇴되었습니다');
         f.action = 'adminLeave';
         f.submit();
      }
   }
   
   // 관리자 권한 부여
   function fn_adminMake(f){
      if( confirm('관리자 권한을 부여하시겠습니까?') ){
         alert('투게더의 관리자가 되었습니다!');
         f.action = 'adminMaking';
         f.submit();
      }
   }
   
   function fn_userMake(f){
      if( confirm('일반회원으로 권한을 부여하시겠습니까?') ){
         alert('sevenfactory의 일반회원으로 변경되었습니다.');
         f.action = 'userMaking';
         f.submit();
      }
   }
</script>

<div class="container">
   <h1 class="centered">${sDAO.mId}님의 회원정보</h1><br>
   <br><br>
   <form>
      <table class="table table-hover">
         <tbody>
            <c:if test="${not empty sDAO }">
               <tr>
                  <th>회원번호</th>
                  <td>${sDAO.mNo }</td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td>${sDAO.mPw }</td>
               </tr>
               <tr>
                  <th>성명</th>
                  <td>${sDAO.mName }</td>
               </tr>
               <tr>
                  <th>연락처</th>
                  <td>${sDAO.mPhone }</td>
               </tr>
               <tr>
                  <th>우편번호</th>
                  <td>${sDAO.mZipcode }</td>
               </tr>
               <tr>
                  <th>주소</th>
                  <td>${sDAO.mAddr1 }</td>
               </tr>
               <tr>
                  <th>상세주소</th>
                  <td>${sDAO.mAddr2}</td>
               </tr>
               <tr>
                  <th>가입일</th>
                  <td>${sDAO.mRegDate}</td>
               </tr>
               <tr>
                  <th>탈퇴여부</th>
                  <td>
                     <c:if test="${sDAO.mIsWithDrawal ne 1}">
                        <span>비탈퇴</span>
                     </c:if>
                     
                  </td>
               </tr>
               <tr>
                  <th>권한</th>
                  <td>
                     <c:if test="${sDAO.mRight ne 0}">
                        <span id="isAdmin">관리자</span>
                     </c:if>
                     <c:if test="${sDAO.mRight ne 1}">
                        <span id="isUser">일반회원</span>
                     </c:if>
                  </td>
               </tr>
            </c:if>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="11">
                  <input type="hidden" name="mId" value="${sDAO.mId}"> <!-- request 전달 -->
                  <input type="button" value="회원탈퇴시키기" class="btn btn-danger" onclick="fn_memberLeave(this.form)" />
                  <input type="button" value="회원목록으로  이동" class="btn btn-success" onclick="location.href='adminList'" />
                  <!-- mRight = 2이면 총관리자임  -->
                  <c:if test="${sDAO.mRight ne 1}">
                     <c:if test="${loginDTO.mRight eq 2}">
                     <input type="button" value="관리자 권한으로 승격" class="btn btn-primary" onclick="fn_adminMake(this.form)">   
                     </c:if>      
                  </c:if>
                  <c:if test="${sDAO.mRight ne 0}">
                     <c:if test="${loginDTO.mRight eq 2}">
                     <input type="button" value="일반회원으로 강등" class="btn btn-danger" onclick="fn_userMake(this.form)">         
                     </c:if>
                  </c:if>
               </td>
            </tr>
         </tfoot>
      </table>
   </form>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>