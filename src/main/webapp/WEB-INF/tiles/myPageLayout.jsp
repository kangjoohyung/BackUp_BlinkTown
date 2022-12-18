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
body{
background-color: #000000;
}
header{
background-color: #000000;
}

aside{
background-color: #000000;
width:20%;
float: left;
position: sticky;
top: 0px;
}

section{
background-color: #000000;
width:80%;
float: right;
}

footer{
background-color: #000000;
clear: both;
}
</style>
</head>
<body>
<header>
<tiles:insertAttribute name="header"/>
</header>
<tiles:insertAttribute name="banner"/>


<aside>
<tiles:insertAttribute name="aside"/>
</aside>

<section>
<tiles:insertAttribute name="content"/>
</section>
<footer>
<tiles:insertAttribute name="footer"/>
</footer>
<tiles:insertAttribute name="popup-menu"/>

</body>
</html>