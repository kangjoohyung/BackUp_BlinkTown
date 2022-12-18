<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 컨테이너 */
body{
	background-color: #000000;
}
.container {
	min-width: 800px;
	width: 1280px;
	height: 615px;
	margin: 0px auto;
	padding: 0;
}
.con{
	width: 600px;
	height: auto;
	margin: 0 auto;
	text-align: center;
	background-color: #000000;
	position: relative;
	top: 150px;
	padding: 40px;
}
.btn {
	text-decoration: none;
	font-size: 15px;
	border: none;
	padding: 8px 20px;
	color: #F4A7BB;
	border-radius: 5px;
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.1); 
}

/*box*/
@property --angle {
  syntax: '<angle>';
  initial-value: 90deg;
  inherits: true;
}

@property --gradX {
  syntax: '<percentage>';
  initial-value: 50%;
  inherits: true;
}

@property --gradY {
  syntax: '<percentage>';
  initial-value: 0%;
  inherits: true;
}

:root {
	--d: 2500ms;
	--angle: 90deg;
	--gradX: 100%;
	--gradY: 50%;
	--c1: #F4A7BB;
	--c2: #F4A7BB10;
}

.box {
	border: 0.1rem solid;
	border-image: radial-gradient(ellipse at var(--gradX) var(--gradY), var(--c1), var(--c1) 10%, var(--c2) 40%) 30;
	animation: borderRadial var(--d) linear infinite forwards;
}

@keyframes borderRotate {
	100% {
		--angle: 420deg;
	}
}

@keyframes borderRadial {
	20% {
		--gradX: 100%;
		--gradY: 50%;
	}
	40% {
		--gradX: 100%;
		--gradY: 100%;
	}
	60% {
		--gradX: 50%;
		--gradY: 100%;
	}
	80% {
		--gradX: 0%;
		--gradY: 50%;
	}
	100% {
		--gradX: 50%;
		--gradY: 0%;
	}
}

.lead{
color: #F4A7BB;
margin: 30px auto 50px;
}

.neon {
  color: #fff;
  text-shadow:
    0 0 5px #fff,
    0 0 10px #fff,
    0 0 20px #fff,
    0 0 40px #FF3166,
    0 0 80px #FF3166,
    0 0 90px #FF3166,
    0 0 100px #FF3166,
    0 0 110px #FF3166;
}

.neonb {
  color: #F4A7BB;
  text-shadow:
    0 0 5px #F4A7BB,
    0 0 10px #F4A7BB,
    0 0 20px #F4A7BB,
    0 0 40px #FF3166,
    0 0 80px #FF3166,
    0 0 90px #FF3166,
    0 0 100px #FF3166,
    0 0 110px #FF3166;
}

.neonm {
  color: #F4A7BB;
  text-shadow:
    0 0 5px #F4A7BB50,
    0 0 10px #F4A7BB50,
    0 0 20px #F4A7BB50,
    0 0 40px #FF316650,
    0 0 80px #FF316650,
    0 0 90px #FF316650,
    0 0 100px #FF316650,
    0 0 110px #FF316650;
}

</style>
</head>
<body>

	<div class="container">
		<div class='con'>
			<div class="logo neon">
				<h1>BLINK TOWN</h1>
				<br>
			</div>
			<h2 class="lead neonm">${message}</h2>

			<br />

			<div class="btn-group ">
				<a href="${pageContext.request.contextPath}/"
					class="btn  box neonb ">HOME</a> 
					<a href="${url}" class="btn  box neonb">${urlName}</a>
					<!-- javascript:history.back() 부분에 이동할 페이지 위치 유동적으로 바꿔주기 -->
			</div>

		</div>
	</div>
	<!-- container -->

</body>
</html>