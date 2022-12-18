<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/a224d3b399.js" crossorigin="anonymous"></script>
<style type="text/css">
*
=====
DEPENDENCES
=====
*/


/* 
helper to hide elements that are available only for screen readers. 
*/

.screen-reader{
  width: var(--screenReaderWidth, 1px) !important;
  height: var(--screenReaderHeight, 1px) !important;
  padding: var(--screenReaderPadding, 0) !important;
  border: var(--screenReaderBorder, none) !important;

  position: var(--screenReaderPosition, absolute) !important;
  clip: var(--screenReaderClip, rect(1px, 1px, 1px, 1px)) !important;
  overflow: var(--screenReaderOverflow, hidden) !important;
}

/*
=====
POPUP
=====
*/

/*
1. Creating the top and bottom gaps for the modal so that content doesn't touches window's edges
*/

.popup:not(:target){
  display: none;
}

.popup:target{
  width: 100%;
  height: 100vh;
  
  display: flex;
 
  position: fixed;
  top: 0;
  right: 0;  
}

.popup::before{
  content: "";
  box-sizing: border-box;
  width: 100%;
  background-color: #00000090;

  position: fixed;
  left: 0;
  top: 50%;
}

.popup::after{
  content: "";
  width: 0;
  height: 2px;
  background-color: #00000080;

  position: absolute;
  top: 50%;
  left: 0;
  margin-top: -1px;
}

.popup__container{
  box-sizing: border-box;  
  padding: 5% 15%;

  height: calc(100vh - 40px); /* 1 */
  margin: auto; /* 1 */
  overflow: auto; /* 1 */
  overscroll-behavior: contain; /* 1 */
}

.popup__title{
  --rTitleMarginBottom: 1.5rem;
  font-size: 1.5rem;
}

.popup__close{
  width: 2rem;
  height: 2rem;

  position: fixed;
  top: 1.5rem;
  right: 91rem;
  z-index:1;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  border-color:#ffffff;
  /*background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMDAwMDAwIiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4gICAgPHBhdGggZD0iTTE5IDYuNDFMMTcuNTkgNSAxMiAxMC41OSA2LjQxIDUgNSA2LjQxIDEwLjU5IDEyIDUgMTcuNTkgNi40MSAxOSAxMiAxMy40MSAxNy41OSAxOSAxOSAxNy41OSAxMy40MSAxMnoiLz4gICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjwvc3ZnPg==);
	*/
}

/*
animation
*/

.popup::before{
  will-change: height, top;
  animation: open-animation .6s cubic-bezier(0.83, 0.04, 0, 1.16) .65s both;
}

.popup::after{
  will-change: width, opacity;
  animation: line-animation .6s cubic-bezier(0.83, 0.04, 0, 1.16) both;
}

@keyframes line-animation{

  0%{
    width: 0;
    opacity: 1;
  }

  99%{
    width: 100%;
    opacity: 1;
  }

  100%{
    width: 100%;
    opacity: 0;
  }  
}

@keyframes open-animation{

  0%{
    height: 0;
    top: 50%;
  }

  100%{
    height: 100vh;
    top: 0;
  }
}

.popup__container{
  animation: fade .5s ease-out 1.3s both;
}

@keyframes fade{

  0%{
    opacity: 0;
  }

  100%{
    opacity: 1;
  }
}

/*
=====
DEMO
=====
*/

.open-popup{
  text-decoration: none;
  text-transform: uppercase;
  padding: .5rem .5rem;
  position: relative;
  top: 8px;
}

.page{
  min-height: 100vh;
  display: flex;
}

.page__container{
  max-width: 1200px;
  padding-left: .75rem;
  padding-right: .75rem;  
  margin: auto;
}
.memu-btn{
	width: 500px;
	height: 110px;
	display: block;
	font-size: 60px;
	font-weight: 900;
	color: #ffffff;
	border: none;
	background-color: inherit;
}
.memu-btn:hover {
	background-color: #F4A7BB;
	color: #000000;
}
.memu-btn:active {
	background-color: #FF678E;
	color: #000000;
}
.popup__content{
	margin-top: 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="barIcon" onclick="myFunction(this)">
					  <div class="bar1"></div>
					  <div class="bar2"></div>
					  <div class="bar3"></div>
					</div>
<div id="popup-article" class="popup">
  <div class="popup__container">
    <a href="#" class="popup__close" onclick="closePopup('popup-button')">
     <i class="fa-solid fa-xmark" style="color: #ffffff; font-size: 20px;"></i>
    </a>  
    <div class="popup__content">
    	<button onclick="location.href='${pageContext.request.contextPath}/'" class="memu-btn">HOME</button> 
    	<button onclick="location.href='${pageContext.request.contextPath}/info/main'" class="memu-btn">INFO</button>
    	<button onclick=" location.href='${pageContext.request.contextPath}/shop/main'" class="memu-btn">SHOP</button>
    	<button onclick="location.href='${pageContext.request.contextPath}/board/main'"class="memu-btn">COMMUNITY</button> 
    </div>
  </div>
</div>

<script>
function closePopup(id) {
    var e = document.getElementById(id);
    e.style.display = ((e.style.display!='none') ? 'none' : 'block');
}
</script>
</body>
</html>