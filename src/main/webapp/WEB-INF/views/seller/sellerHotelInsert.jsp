<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />
<title>Insert title here</title>
</head>
<!-- CSS -->
<style>
   allcontent{
      margin:5px auto;
      padding:5px auto;
      margin-left: 200px;
      /* text-align: center; */
      diplay:fixed;
   }
   h4{
      margin-left:600px;
   }
   #requestbtn{
      margin:10px 0px 0px 500px;
      padding:10px;
   }
   .input_text{
      width: 300px;
      height:35px;
   }
</style>
<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
 function request(f){
    if($("#hName").val().length==0){
       alert("호텔이름을 입력하세요.");
       $("#hName").focus();
    }else if($("#hAddress").val().length==0){
       alert("호텔주소를 입력하세요.");
       $("#hAddress").focus();
    }else if($("#hAmount").val().length==0){
       alert("호텔 방개수를 입력하세요.");
       $("#hAmount").focus();
    }else if($("#hMinprice").val().length==0){
       alert("호텔 방개수를 입력하세요.");
       $("#hMinprice").focus();
    } else{
       hotelregister.action='sellerhotelinsert';
       hotelregister.submit();
       alert("회원가입 및 호텔승인요청이 완료되었습니다. 승인까지 1-2일 소요됩니다. 메인페이지로 돌아갑니다.");
    }
 }
 
 //새로고침 방지
 function NotReload(){
  if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
      event.keyCode = 0;
      event.cancelBubble = true;
      event.returnValue = false;
     } 
   }
   document.onkeydown = NotReload;
</script>
<body>
   <div class="allcontent">
   <form id="hotelregister" method="POST" >
   <div id="title"><h4>호텔 등록페이지</h4></div>
      <div class="head">
      <br/>
      <span>▶ 호텔명 <br/> </span>
      <input type="text" placeholder="호텔명을 입력해주세요." id="hName" name="hName"class="input_text"/><br/><br/>
      <span>▶ 호텔주소 <br/> </span>
      <input type="text" placeholder="호텔주소 입력해주세요." id="hAddress" name="hAddress"class="input_text"/><br/><br/>
      <span>▶ 호텔 방개수 <br/> </span>
      <input type="text" placeholder="호텔의 방개수를 입력해주세요." id="hAmount" name="hAmount"class="input_text"/>개<br/><br/>
      </div>
      <div class="content">
       <div class="price">
       <span>▶ 호텔 최저가 <br/> </span>
          <input type="text" pattern="[0-9]+" id="hMinprice" name="hMinprice" class="input_text" placeholder="호텔의 최저가를 입력해주세요.">원 
       </div>
      </div>
      </form>
       <input type="button" value="등록요청하기" onclick="request(this.form)"id="requestbtn">
      
   </div>

</body>
</html>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>