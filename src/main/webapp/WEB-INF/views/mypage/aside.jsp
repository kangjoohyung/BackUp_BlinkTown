<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.slide:hover,
.slide:focus {
  box-shadow: inset 15em 0 0 0 #F4A7BB;
  border-color: #F4A7BB;
  color: #fff;
}

.slide {
  width:100%;
  background: none;
  border: none;
  font: 40px;
  line-height: 1;
  margin: 0px;
  padding: 1em 2em;
  color: #F8D8E3;
  transition: 0.25s;
  float: right;
}
.side-Btn{
	width: 200px;
	margin-top:100px;
	margin-right:20px;
	float: right;
}
.side-title{
  width:200px;
  height:40px;
  text-align:center;
  border-top: 2px solid #F4A7BB60;
  border-bottom: 2px solid #F4A7BB60;
  font-size: 20px;
  color: #F4A7BB;
  float: right;
  font-weight: 400;
  padding: 5px 0px;
}
</style>
</head>
<body>


<div class="side-Btn">
	<div class="side-title">마이페이지</div>
	<button class="slide" onclick="location.href='/users/findUser'">회원정보</button>
	<button class="slide" onclick="location.href='/mypage/orderList'">주문조회</button>
	<button class="slide" onclick="location.href='/mypage/likeList'">좋아한 게시물</button>
</div>
</body>
</html>