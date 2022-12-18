<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
/>

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<style type="text/css">
.banner-wrap{
width: 100%;
height: 500px;
background-color: #000000;
overflow: hidden;
}
</style>
</head>
<body>
<div class="banner-wrap">
<video autoplay muted loop  height="100%" width="100%">
					<source src="${pageContext.request.contextPath}/save/img/banner/info.mp4" type="video/mp4">
				</video>
</div>

</body>
</html>