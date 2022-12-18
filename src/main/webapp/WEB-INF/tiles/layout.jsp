<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0px;
	}
</style>
</head>
<body>

		<tiles:insertAttribute name="header"/><!-- 고정이 아닌 동적 삽입 -->
	
		<tiles:insertAttribute name="content"/>
	
		<tiles:insertAttribute name="footer"/>
	<tiles:insertAttribute name="popup-menu"/>
</body>

</html>