<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<style>
/*
Noto+Sans+KR
Noto+Sans
Roboto
  */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:wght@100;300;400;500;700;900&display=swap')
	;
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	font-family: NotoSans;
}
::-webkit-scrollbar {
    display: none; /* 크롬, 사파리, 오페라, 엣지 */
}
.header-wrap {
	width: 100%;
	height: 70px;
	background-color: #000000;
}

.header-top {
	width: 100%;
	height: 30px;
}

.header-menu {
	color: #ffffff;
	background-color:inherit;
	width: 100px;
	border: none;
	float: right;
	text-align: center;
	font-size: 15px;
	padding: 8px 0px;
}

.header-bottom {
	width: 100%;
	height: 38px;
}

.menu-popup-button {
	width: 35px;
	height: 35px;
	float: left;
	position: relative;
	margin-left: 20px;
	top: -13px;
	display: block;
}

.header-logo {
	width: 178px;
	height: 42px;
	background-image: url(/save/img/SOURCE/logo.png);
	background-size:cover;
	margin: 0 auto;
	position: relative;
	top: -13px;
}

.header-languag {
	float: right;
}
.select-option {
background-color:#000000;
font-size: 18px;
border: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#selectbox").change(function(){	
			 var lang = $("#selectbox option:selected").val();
			//현재 주소를 가져온다.
			var renewURL = location.href;
			//현재 주소 중 page 부분이 있다면 날려버린다.
			renewURL = renewURL.split('?');
			var newURL = renewURL[0]
			
			$.ajax({
			    type:"get",
			    success:function(result){				
					newURL += '?lang='+lang;
					//페이지 갱신 실행!
					history.pushState(null, null, newURL);
					document.location.reload();
			    }
			  })
		
		  
		});//click
	});//jquery
</script>
</head>
<body>
	<div class="header-wrap">
		<div class="header-top">
			<select id="selectbox" name="selectbox" class="header-languag header-menu">
				<option selected="selected" value="ko" class="select-option" <c:if test="${param.lang.toString()== 'ko'}"> selected</c:if>>KOR</option>
				<option value="en"  class="select-option" <c:if test="${param.lang.toString()==  'en'}"> selected</c:if>>ENG</option>
			</select>
			
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		function logout() {
			$("input[value='로그아웃']").click();
		}
	
	</script>
			
			
			
<form name="logout2" action="${pageContext.request.contextPath}/logout" method="post" style="display: none;">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="submit" value="로그아웃">
</form>

			<sec:authorize access="isAnonymous()">
			<div class="header-cart header-menu">
				<a href="${pageContext.request.contextPath}/system/loginForm"
					style="color: #ffffff; text-decoration: none;">LOGIN</a>
			</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div class="header-login header-menu">
					<a href="#" style="color: #ffffff; text-decoration: none;" onclick="logout()">LOGOUT</a>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="header-cart header-menu">
					<a href="${pageContext.request.contextPath}/admin/main"
						style="color: #ffffff; text-decoration: none;">ADMIN</a>
				</div>
			</sec:authorize>
			<sec:authorize  access="hasRole('ROLE_USER')">
				<div class="header-mypage header-menu">
					<a href="${pageContext.request.contextPath}/users/findUser"
						style="color: #ffffff; text-decoration: none;">MYPAGE</a> <sec:authorize access="hasRole('ROLE_MEMBER')"><i
						class="fa-solid fa-crown"></i></sec:authorize>
				</div>
			</sec:authorize>

			
			<sec:authorize access="isAuthenticated()">
				<div class="header-cart header-menu">
					<a href="${pageContext.request.contextPath}/shop/cart"
						style="color: #ffffff; text-decoration: none;">CART</a>
				</div>
			</sec:authorize>

		</div>
	
	<div class="header-bottom">
		<div class="menu-popup-button" id="popup-button">
			<a href="#popup-article" class="open-popup"
				onclick="openPopup('popup-button')"> <i class="fi fi-br-menu-burger" style="color: #ffffff; font-size: 20px;"></i></a>
		</div>
		<div class="header-logo"></div>
	</div>
</div>
	<script>
		function openPopup(id) {
			var e = document.getElementById(id);
			e.style.display = ((e.style.display != 'none') ? 'none' : 'block');
		}
		
	</script>


</body>
</html>