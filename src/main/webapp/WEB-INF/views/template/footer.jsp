<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.fa-2x {
	font-size: 13px;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wkmpm92bc1&submodules=geocoder">
	
</script>
<div>
	<div class="footer">
		<ul class="footer_menu">
			<li>이용약관</li>
			<li>개인정보보호정책</li>
			<li>이메일 무단 수집 금지</li>
			<li>영상정보처리기기 설치 및 운영방침</li>
			<c:if test="${loginDTO eq null }">
				<a id="loginout" href="sellerLoginform"><i
					class="fas fa-sign-in-alt fa-2x">사업자LOGIN</i></a>
			</c:if>
		</ul>
		<ul class="company_info">
			<li>우편번호 : 24901</li>
			<li>주소 : 대전광역시 서구 대덕대로 182 오라클빌딩 10층</li>
			<li>전화번호 : 02-313-7300</li>
			<li>팩스번호 : 02-313-0516</li>
			<li>이메일 : admin@sevenfactory.com</li>
		</ul>
		<ul class="company_info">
			<li>사업체명 : sevenfactory</li>
			<li>대표자 : 강현 김승현 송인재 송지섭</li>
			<li>사업자등록번호 : 325-88-00678</li>
			<li>통신판매신고번호 : 2022-대전둔산-03148호</li>
		</ul>
		<p>Copyright © 2022 OsjMesiJJe inc. All rights reserved.</p>
	</div>
</div>
</body>
</html>