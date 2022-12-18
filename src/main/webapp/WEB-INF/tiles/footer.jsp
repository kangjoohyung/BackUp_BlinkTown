<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style type="text/css">
* {
	margin: 0;
	font-family: NotoSans;
}
.footer-wrap{
clear:both;
display: block;
background-color:#000000;
width: auto;
height: 68px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

*:focus,
*:active {
  outline: none !important;
  -webkit-tap-highlight-color: transparent;
}


.footer-wrapper {
  display: inline-flex;
  list-style: none;
  position: relative;
  top: 10px;
}

.footer-wrapper .icon {
  color:#f4a7bb;
  position: relative;
  border: 1px solid #f4a7bb50;
  border-radius: 50%;
  padding: 15px;
  margin: 10px;
  width: 25px;
  height: 25px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.footer-wrapper .tooltip {
  position: absolute;
  top: 0;
  font-size: 14px;
  background: #ffffff;
  color: #ffffff;
  padding: 5px 8px;
  border-radius: 5px;
  box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.footer-wrapper .tooltip::before {
  position: absolute;
  content: "";
  height: 8px;
  width: 8px;
  background: #ffffff;
  bottom: -3px;
  left: 50%;
  transform: translate(-50%) rotate(45deg);
  transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.footer-wrapper .icon:hover .tooltip {
  top: -45px;
  opacity: 1;
  visibility: visible;
  pointer-events: auto;
}

.footer-wrapper .icon:hover span,
.footer-wrapper .icon:hover .tooltip {
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.1);
}

.footer-wrapper .facebook:hover,
.footer-wrapper .facebook:hover .tooltip,
.footer-wrapper .facebook:hover .tooltip::before {
  border:none;
  background: #1877F2;
  color: #ffffff;
}

.footer-wrapper .twitter:hover,
.footer-wrapper .twitter:hover .tooltip,
.footer-wrapper .twitter:hover .tooltip::before {
  border:none;
  background: #1DA1F2;
  color: #ffffff;
}

.footer-wrapper .instagram:hover,
.footer-wrapper .instagram:hover .tooltip,
.footer-wrapper .instagram:hover .tooltip::before {
  border:none;
  background: #E4405F;
  color: #ffffff;
}

.footer-wrapper .youtube:hover,
.footer-wrapper .youtube:hover .tooltip,
.footer-wrapper .youtube:hover .tooltip::before {
  border:none;
  background: #CD201F;
  color: #ffffff;
}
.SNS-official{
	color: #f4a7bb;
}
.SNS-official:hover {
	color:#ffffff;
	
}
</style>
</head>
<body>
<div class="footer-wrap">
<ul class="footer-wrapper">
  <a href="https://www.facebook.com/BLACKPINKOFFICIAL/" class="SNS-official">
	  <li class="icon facebook">
	    <span class="tooltip">Facebook</span>
	    <span><i class="fab fa-facebook-f"></i></span>
	  </li>
  </a>
  <a href="https://twitter.com/blackpink/" class="SNS-official">
	  <li class="icon twitter">
	    <span class="tooltip">Twitter</span>
	    <span><i class="fab fa-twitter"></i></span>
	  </li>
  </a>
   <a href="https://www.instagram.com/BLACKPINKOFFICIAL/" class="SNS-official">
	  <li class="icon instagram">
	    <span class="tooltip">Instagram</span>
	   <span><i class="fab fa-instagram"></i></span>
	  </li>
  </a>
  <a href="https://www.youtube.com/@BLACKPINK" class="SNS-official">
	  <li class="icon youtube">
	    <span class="tooltip">Youtube</span>
	  <span><i class="fab fa-youtube"></i></span>
	  </li>
  </a>
</ul>
</div>
</body>
</html>