<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
* {
   box-sizing: border-box;
   font-family: "Inconsolata", sans-serif;
}

body {
   margin: 0;
   padding: 0;
}

#loginout {
   margin-top: 40px;
   margin-right: 50px;
}

#loginout:hover {
   color: black;
}



.test_1 {
   width: 100%;
   height: 100%;
   display: none;
   z-index: 200;
   position: fixed;
}

.test_1.open {
   display: block;
}

.test_1.open:before {
   content: '';
   width: 100%;
   height: 100%;
   z-index: 25;
   position: fixed;
   background: black;
   opacity: 0.4;
   top: 0;
}

.test_1 .test_2 {
   position: fixed;
   margin: auto;
   top: 50%;
   z-index: 30;
   background: white;
   left: 50%;
   width: 450px;
   padding: 20px 45px 50px;
   height: 630px;
   margin-top: -268px;
   margin-left: -255px;
}

.login-box h1 {
   text-align: center;
}

.login-text {
   width: 360px;
   height: 47px;
   padding-left: 20px;
   border: 1px solid #d9d9d9;
   margin: 0 0 10px;
   font-size: 14px;
}

.find {
   float: right;
}

#loginButton {
   border: none;
   width: 360px;
   padding: 10px 0;
   background: black;
   color: white;
   margin: 10px 0;
}

#loginButton:hover {
   outline: none;
   background: #5A5A5A;
}

#registerButton {
   border: none;
   width: 360px;
   padding: 10px 0;
   background: #E3EAF3;
   margin: 0 0 10px
}

#registerButton:hover {
   outline: none;
   background: #A4CAED;
}
/*    a {text-decoration: none; font-size: 0.9em; color: black;} */
.pop-up-close {
   border: none;
   position: absolute;
   top: -20.5px;
   right: -20px;
   width: 40px;
   height: 41px;
   text-indent: -9999px;
   background-color: transparent;
   background-image: url(resources/x-button.png);
   background-repeat: no-repeat;
   background-size: 100%;
   background-position: center;
}
</style>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wkmpm92bc1&submodules=geocoder">
   
</script>
<script type="text/javascript">
   var filename;

   $(document).ready(function(){
      //$('.test_1').css("display","block");
      $('.test_1').addClass('open');

      $.ajax({
         url : 'getImage',
         type : 'POST',
         dataType : 'JSON',
         success : function(data) {
            filename = data.filename;
            $('#getchaImg').attr("src", "resources/storage/" + filename);
         },
         error : function() {
            alert('AJAX 통신이 실패했습니다1.');
         }
      });
   });

   function cc() {
      $.ajax({
         url : 'getImage',
         type : 'POST',
         dataType : 'JSON',
         success : function(data) {
            filename = data.filename;
            $('#getchaImg').attr("src", "resources/storage/" + filename);
         },
         error : function() {
            alert('AJAX 통신이 실패했습니다1.');
         }
      });
      $('#input_key').val('');
      $('#input_key').focus();
   }

   function bbb() {
      location.href = 'main';
   }

   $(document).ready(function() {
      
      // 아이디 기억하기
      var savedID = getCookie("savedID");
      $('#login_sId').val(savedID);

      // savedID 가 있으면, 체크박스를 체크 상태로 유지
      if ($('#login_sId').val() != '') {
         $('#saveIDCheck').attr('checked', true);
      }

      // 체크박스의 상태가 변하면,
      $('#saveIDCheck').change(function() {
         // 체크되어 있다
         if ($('#saveIDCheck').is(':checked')) {
            setCookie("savedID", $('#login_sId').val(), 7); // 7일간 쿠키에 보관
         }
         // 체크해제되어 있다.
         else {
            deleteCookie("savedID");
         }
      });

      // 아이디를 입력할 때
      $('#login_sId').keyup(function() {
         // 체크되어 있다
         if ($('#saveIDCheck').is(':checked')) {
            setCookie("savedID", $('#login_sId').val(), 7); // 7일간 쿠키에 보관
         }
      });
      
   });

   function fn_logout() {
      location.href = 'sellerlogout';
   }

   function fn_login(f) {
      $.ajax({
         url : 'loginCheck',
         type : 'POST',
         dataType : 'JSON',
         data : 'input_key=' + $('#input_key').val(),
         success : function(data) {
            if (data.result == true) {
               $.ajax({
                  url : 'sellerlogin',
                  type : 'POST',
                  dataType : 'JSON',
                  data : 'sId=' + $('#login_sId').val() + '&sPw='
                        + $('#login_sPw').val(),
                  success : function(data) {
                     if (data.result != 'YES') {
                        alert('로그인 실패 아이디와 비밀번호를 확인하세요.');
                        $('#login_sPw').val('');
                        $('#input_key').val('');
                        $('#login_sPw').focus();
                        cc();
                     } else {
                        var url = 'sellerMain?sId='+$('#login_sId').val();
                        location.href = url;
                        /* location.reload(); */}
                  },
                  error : function() {
                     alert('AJAX 통신이 실패했습니다.2');
                  }
               });

            } else {
               alert('그림의 인증번호와 입력하신 인증번호가 다릅니다.');
               $('#input_key').val('');
               $('#input_key').focus();
               cc();
            }
         },
         error : function() {
            alert('AJAX 통신이 실패했습니다.2');
         }
      });
   }

   // 1. 쿠키 만들기
   function setCookie(cookieName, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value)
            + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
   }
   // 2. 쿠키 삭제
   function deleteCookie(cookieName) {
      var expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires="
            + expireDate.toGMTString();
   }
   // 3. 쿠키 가져오기
   function getCookie(cookieName) {
      cookieName = cookieName + "=";
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = "";
      if (start != -1) {
         start += cookieName.length;
         var end = cookieData.indexOf(";", start);
         if (end == -1) {
            end = cookieData.length;
         }
         cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
   }
</script>
<body>
<div class="test_1">

            <div class="test_2">
               <div id="login" class="login-box">
                  <form method="POST">
                     <h1>LOGIN</h1>
                     <br /> 
                     <input class="login-text" id="login_sId" type="text" name="login_sId" placeholder="사업자번호" autofocus /><br /> 
                     <input class="login-text" id="login_sPw" type="password" name="login_sPw" placeholder="사업자 비밀번호" /><br /> 
                     <input id="saveIDCheck" type="checkbox" name="saveIDCheck" value="true" checked />아이디 기억하기 
                     <img id="getchaImg" src="" style="width: 360px; height: 120px;" /> 
                     <input id="input_key" type="text" name="input_key" style="margin-top: 5px;" /> 
                     <a href="javascript:void(0);" onclick="cc()">
                     <i class="fas fa-redo-alt"></i>새로고침</a><br /> 
                     <input id="loginButton" type="button" value="로그인" onclick="fn_login(this.form)" /> 
                     <input id="registerButton" type="button" value="회원가입" onclick="location.href='sellerRegisterPage'" />
                     <div class="find">
                        &nbsp;|&nbsp; <a href="findSellerPwPage">비밀번호 찾기</a><br/>
                     </div>
                  </form>
               </div>
               <button class="pop-up-close" onclick="bbb()"></button>
            </div>
         </div>
</body>
</html>