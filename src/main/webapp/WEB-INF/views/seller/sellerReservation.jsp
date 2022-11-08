<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />
<title>사업자 예약관리</title>
</head>
<script>
history.replaceState({}, null, location.pathname);
</script> 
<script>
	$(document).ready(function() {
		$(".allr").css("display", "inline"); //allr 활성화
		$(".approvalr").css("display", "none"); 
		$(".approvaldoner").css("display", "none");
	});
	function allr(){
		$(".allr").css("display", "inline"); //allr 활성화
		$(".approvalr").css("display", "none"); 
		$(".approvaldoner").css("display", "none");
	}
	function approvalr(){
		$(".allr").css("display", "none"); 
		$(".approvalr").css("display", "inline"); //approvalr 활성화
		$(".approvaldoner").css("display", "none");
	}
	function approvaldoner(){
		$(".allr").css("display", "none"); 
		$(".approvalr").css("display", "none"); 
		$(".approvaldoner").css("display", "inline");//approvaldoner 활성화
	}
	function approval(i){
		var sId = ${loginDTO.sId};
		var url ='reservationapproval?rNo='+i+'&sId='+sId;
		location.href=url;
		alert("예약승인이 완료되었습니다.");
	}
</script>
<style>
   table{border-collapse: collapse;width: 900px; text-align:center;}
   tr th {border-bottom: solid 1px lightgray;}
   td { padding:10px;border-bottom: 1px solid lightgray;}
	allcontent{
		margin:5px auto;
		padding:5px auto;
		margin-left: 200px;
		/* text-align: center; */
	}
	h4{
		margin-left:600px;
	}
	.contentul .contentli{
		display: inline-block;
	}
	.contentli{
		list-style: none;
	}
	.contentli:hover{
		color: #ff5e62;
	}
</style>
<body>

	<div class="allcontent">
	<div id="title"><h4>호텔 객실 예약승인 페이지</h4></div>
	<input type="hidden" value="${loginDTO.sId }" name="sId"/>
	<div class="nav">
		<ul class="contentul">
			<li class="contentli" onclick="allr()">전체</li>
			<li class="contentli" onclick="approvalr()">미승인예약</li>
			<li class="contentli" onclick="approvaldoner()">예약승인완료</li>
		</ul>
	</div>
	
	<div class="allr">
	 <table>
	 	<tr>
	 	<th>예약번호</th>
		<th>객실번호</th>	 	
		<th>회원번호</th>
		<th>비회원전화번호</th>
		<th>예약인원</th>
		<th>결제금액</th>
		<th>입실일</th>
		<th>퇴실일</th>
	 	</tr>
	 	
	 	<c:forEach var="rDTO" items="${list }">
	 	<tr>
	 	<td>${rDTO.rNo }</td>
	 	<td>${rDTO.gNo }</td>
	 	<td>${rDTO.mNo }</td>
	 	<c:if test="${rDTO.nMphone eq null}">
	 		<td>비회원이 아닙니다.</td>
	 	</c:if>
	 	<c:if test="${rDTO.nMphone ne null}">
	 		<td>${rDTO.nMphone }</td>
	 	</c:if>
	 	<td>${rDTO.rPeople }</td>
	 	<td>${rDTO.rPrice }</td>
	 	<td>${rDTO.rCheckIn }</td>
	 	<td>${rDTO.rCheckOut }</td>
	 	</tr>
	 	</c:forEach>
	 </table>
	 <br/><br/><br/>
		<table>
			<tr>
			<th>방번호</th>
			<th>방이름</th>
			</tr>
			<c:forEach var="gDTO" items="${list2 }">
			<tr>
			<td>${gDTO.gNo }</td>
			<td>${gDTO.gName }</td>
			</c:forEach>
		</table>
	</div>
	
	<div class="approvalr">
	 <table>
	 	<tr>
	 	<th>예약번호</th>
		<th>객실번호</th>	 	
		<th>회원번호</th>
		<th>비회원전화번호</th>
		<th>예약인원</th>
		<th>결제금액</th>
		<th>입실일</th>
		<th>퇴실일</th>
		<td>예약승인하기</td>
	 	</tr>
	 	<c:forEach var="rDTO" items="${list }">
	 	<c:if test="${rDTO.rApproval eq 0}">
	 	<tr>
	 	<td>${rDTO.rNo }</td>
	 	<td>${rDTO.gNo }</td>
	 	<td>${rDTO.mNo }</td>
	 	<c:if test="${rDTO.nMphone eq null}">
	 		<td>비회원이 아닙니다.</td>
	 	</c:if>
	 	<c:if test="${rDTO.nMphone ne null}">
	 		<td>${rDTO.nMphone }</td>
	 	</c:if>
	 	<td>${rDTO.rPeople }</td>
	 	<td>${rDTO.rPrice }</td>
	 	<td>${rDTO.rCheckIn }</td>
	 	<td>${rDTO.rCheckOut }</td>
	 	<td><input type="button" value="승인하기" onclick="approval(${rDTO.rNo })"></td>
	 	</tr>
	 	</c:if>
	 	</c:forEach>
	 </table>
	 <br/><br/><br/>
		<table>
			<tr>
			<th>방번호</th>
			<th>방이름</th>
			</tr>
			<c:forEach var="gDTO" items="${list2 }">
			<tr>
			<td>${gDTO.gNo }</td>
			<td>${gDTO.gName }</td>
			</c:forEach>
		</table>
	</div>

	
	<div class="approvaldoner">
	 <table>
	 	<tr>
	 	<th>예약번호</th>
		<th>객실번호</th>	 	
		<th>회원번호</th>
		<th>비회원전화번호</th>
		<th>예약인원</th>
		<th>결제금액</th>
		<th>입실일</th>
		<th>퇴실일</th>
	 	</tr>
	 	<c:forEach var="rDTO" items="${list }">
	 	<c:if test="${rDTO.rApproval eq 1}">
	 	<tr>
	 	<td>${rDTO.rNo }</td>
	 	<td>${rDTO.gNo }</td>
	 	<td>${rDTO.mNo }</td>
	 	<c:if test="${rDTO.nMphone eq null}">
	 		<td>비회원이 아닙니다.</td>
	 	</c:if>
	 	<c:if test="${rDTO.nMphone ne null}">
	 		<td>${rDTO.nMphone }</td>
	 	</c:if>
	 	<td>${rDTO.rPeople }</td>
	 	<td>${rDTO.rPrice }</td>
	 	<td>${rDTO.rCheckIn }</td>
	 	<td>${rDTO.rCheckOut }</td>
	 	</tr>
	 	</c:if>
	 	</c:forEach>
	 </table>
		<br/><br/><br/>
		<table>
			<tr>
			<th>방번호</th>
			<th>방이름</th>
			</tr>
			<c:forEach var="gDTO" items="${list2 }">
			<tr>
			<td>${gDTO.gNo }</td>
			<td>${gDTO.gName }</td>
			</c:forEach>
		</table>
	 
	</div>
	</div>
</body>
</html>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>