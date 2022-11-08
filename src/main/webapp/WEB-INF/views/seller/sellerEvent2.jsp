<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />
<title>이벤트 연장 삭제요청</title>
<!--CSS -->
<style>
.allcontent {
	margin: 5px auto;
	padding: 5px auto;
}

h4 {
	margin-left: 600px;
	margin-bottom: 70px;
}
tr, th, td {
	text-align: center;
	border : 1px solid black;
}
th{
	width :120px;
}
</style>
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function requestExtend(f) {
		if (confirm("관리자에게 이벤트연장 요청하시겠습니까?")) {
			  f.action = 'eventUpdateExtendCommand';
				alert("이벤트 연장 요청을 완료했습니다.");
			f.submit();	
		}
	}

	function requestDelete(f) {
		if (confirm("관리자에게 이벤트삭제를 요청하시겠습니까?")) {
			f.action = 'eventDeleteRequest';			
			alert("이벤트 삭제 요청을 완료했습니다.");
		    f.submit();
		}
	}
</script>
</head>
<body>
<body>
	<div class="allcontent">
		<div id="title">
			<h4>이벤트 연장,삭제 요청</h4>
		</div>
		<div>
		<form id="se1" action="">
			<table class="table">
				<tr>
					<th>이벤트목록</th>
					<th>요청사유</th>
					<th>연장마감일</th>
					<th>연장요청</th>
					<th>삭제요청</th>
				</tr>
				<tr class="form">
					<td>
					<input type="hidden" value="${sId}" name="sId"/>
					<select name="eNo">
							<option value="">선택해주세요.</option>
							<c:forEach var="eDTO" items="${list}" varStatus="status">
								<option value="${eDTO.eNo}">${eDTO.eNo} || ${eDTO.gName}</option>
							</c:forEach>
					</select> <br /></td>
					<td><textarea id="reason" cols="20" rows="5" name="eReason" /></textarea>
					<td><input type="date" name="eUpdate" value="" /></td>
					<td><input type="button" name="extend" onclick="requestExtend(this.form)" value="연장요청"></td>
					<td><input type="button" name="delete" onclick="requestDelete(this.form)" value="삭제요청"></td>
				</tr>
			</table>
			
			</form>
		</div>
	</div>
</body>
</body>
</html>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>