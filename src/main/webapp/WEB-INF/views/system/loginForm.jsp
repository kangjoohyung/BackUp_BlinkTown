<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css">
	.links {
	  list-style-type: none;
	}
	.links li {
	  display: inline-block;
	  margin: 0 20px 0 0;
	  transition: 0.2s linear;
	}
	.links li:nth-child(2) {
	  opacity: 0.6;
	}
	.links li:nth-child(2):hover {
	  opacity: 1;
	}
	.links li:nth-child(3) {
	  opacity: 0.6;
	  float: right;
	}
	.links li:nth-child(3):hover {
	  opacity: 1;
	}
	.links li a {
	  text-decoration: none;
	  color: #0f132a;
	  font-weight: bolder;
	  text-align: center;
	  cursor: pointer;
	}
	
	body {
	  font-family: "Montserrat", sans-serif;
	  background: #000000;
	}
	
	.container {
	  display: block;
	  max-width: 680px;
	  width: 80%;
	  margin: 120px auto;
	}
	
	h1 {
	  color: #f4a7bb;
	  font-size: 30px;
	  letter-spacing: -3px;
	  text-align: center;
	  margin: 120px 0 10px 0;
	  transition: 0.2s linear;
	}

	
	form {
	  width: 100%;
	  max-width: 680px;
	  margin: 40px auto 10px;
	}
	form .input__block {
	  margin: 20px auto;
	  display: block;
	  position: relative;
	}
	form .input__block.first-input__block::before {
	  content: "";
	  position: absolute;
	  top: -15px;
	  left: 50px;
	  display: block;
	  width: 0;
	  height: 0;
	  border-left: 15px solid transparent;
	  border-right: 15px solid transparent;
	  border-bottom: 15px solid rgba(15, 19, 42, 0.1);
	  transition: 0.2s linear;
	}
	form .input__block.signup-input__block::before {
	  content: "";
	  position: absolute;
	  top: -15px;
	  left: 150px;
	  display: block;
	  width: 0;
	  height: 0;
	  border-left: 15px solid transparent;
	  border-right: 15px solid transparent;
	  border-bottom: 15px solid rgba(15, 19, 42, 0.1);
	  transition: 0.2s linear;
	}
	form .input__block input {
	  display: block;
	  width: 90%;
	  max-width: 680px;
	  height: 50px;
	  margin: 0 auto;
	  border-radius: 8px;
	  border: none;
	  color: #ffffff80;
	  padding: 0 0 0 15px;
	  font-size: 14px;
	  font-family: "Montserrat", sans-serif;
	}
	form .input__block input:focus, form .input__block input:active {
	  outline: none;
	  border: none;
	  color: #ffffff;
	}
	form .input__block input.repeat__password {
	  opacity: 0;
	  display: none;
	  transition: 0.2s linear;
	}
	form .signin__btn {
	  background: #e91e63;
	  color: white;
	  display: block;
	  width: 92.5%;
	  max-width: 680px;
	  height: 50px;
	  border-radius: 8px;
	  margin: 0 auto;
	  border: none;
	  cursor: pointer;
	  font-size: 14px;
	  font-family: "Montserrat", sans-serif;
	  transition: 0.2s linear;
	}
	form .signin__btn:hover {
	  box-shadow: 0 0 0 rgba(233, 30, 99, 0);
	}
	
	.separator {
	  display: block;
	  margin: 30px auto 10px;
	  text-align: center;
	  height: 40px;
	  position: relative;
	  background: transparent;
	  color: #ffffff80;
	  font-size: 13px;
	  width: 90%;
	  max-width: 680px;
	}
	.separator::before {
	  content: "";
	  position: absolute;
	  top: 8px;
	  left: 0;
	  background:  #ffffff80;
	  height: 1px;
	  width: 45%;
	}
	.separator::after {
	  content: "";
	  position: absolute;
	  top: 8px;
	  right: 0;
	  background: #ffffff80;
	  height: 1px;
	  width: 45%;
	}
	
	.google__btn,
	.github__btn {
	  display: block;
	  width: 90%;
	  max-width: 680px;
	  margin: 20px auto;
	  height: 50px;
	  cursor: pointer;
	  font-size: 14px;
	  font-family: "Montserrat", sans-serif;
	  border-radius: 8px;
	  border: none;
	  line-height: 40px;
	}
	.google__btn{
	  border: 2px solid #ffd40090;
	  background-color: inherit;
	  color: #ffd400;
	  transition: 0.2s linear;
	}
	.google__btn.google__btn:hover{
	  background: #ffd400;
	  color: #ffffff;
	  transition: 0.2s linear;
	}
	.github__btn{
	  border: 2px solid #f4a7bb90;
	  background-color: inherit;
	  color: #f4a7bb;
	  transition: 0.2s linear;
	}
	.github__btn:hover{
	  background: #f4a7bb;
	  color: #ffffff;
	  transition: 0.2s linear;
	}

</style>



<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

<script type="text/javascript">

//유효성검사
function loginChk() {
    var form = document.f1;
    if (!form.id.value) {
        alert("아이디를 입력해 주십시오.");
        form.id.focus();
        return;
    }
 
    if (!form.password.value) {
        alert("비밀번호를 입력해 주십시오.");
        form.password.focus();
        return;
    }
    form.action = "${pageContext.request.contextPath}/users/login"; //로그인하기기 눌렀을 떄
    form.submit();
}



</script>


</head>
<body>
 <sec:authorize access="isAuthenticated()">
   <sec:authentication property='principal.usersEmail'/>
 </sec:authorize>

<div class="container">
  <!-- Heading -->
  <h1>[ BLINK TOWN ]</h1>
  <!-- Links -->
  <ul class="links" style="margin-bottom: 0px; position: relative; top: 20px;">
    <li>
      <a href="#" id="signin" style="color: #ffffff;">SIGN IN</a>
    </li>
    <li>
      <a href="/system/signup" id="signup" style="color: #ffffff80;">SIGN UP</a>
    </li>
  </ul>
  
  <!-- Form -->
  
  
  <form name="f1" action="${pageContext.request.contextPath}/loginCheck" method="post">
    <!-- email input -->
    <div class="first-input input__block first-input__block">
       <input type="text" placeholder="Id" class="input" id="id" name="usersId" style="background-color: #ffffff20" />
    </div>
    <!-- password input -->
    <div class="input__block">
       <input type="password" placeholder="Password" class="input" id="password" name="usersPwd" style="background-color: #ffffff20"  />
    </div>
    <!-- repeat password input -->
    <div class="input__block">
       <input type="password" placeholder="Repeat password" class="input repeat__password" id="repeat__password"    />
    </div>
     <c:if test="${errorMessage!=null}">
     <b style="color:#f4a7bb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage}</b>
   </c:if>
    <!-- sign in button -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
    
    <input type="submit" class="github__btn" id="signin__btn" value="로그인">
    
  </form>
  <!-- separator -->
  <div class="separator">
    <p>or</p>
  </div>
  <!-- google button -->
  <button class="google__btn" style="margin-top: 0px;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=1b05f9fc0b0d4e666e395b0bb60c0f4b&redirect_uri=http://localhost:8000/system/auth/kakao/callback&response_type=code'">
    <i class="fa-solid fa-comment-sms"></i>
    카카오 로그인
  </button>

</div>

</body>
</html>