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
}

.swiper-container {
    width: 100%;
    height: 90%;
   	padding-top: 20px;
} 

.swiper-slide {
   background-color: purple;

}

img{
 width: 100%;
 height: 100%;
}
</style>
</head>
<body>
<div class="banner-wrap">
<!-- Slider main container -->
<div class="swiper-container">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->
        		<div class="swiper-slide">
					<img alt="blackpinkBanner"
						src="${pageContext.request.contextPath}/save/img/banner/shop/blackpinkBanner02.jpg" />
				</div>
        	
				<div class="swiper-slide">
					<img alt="blackpinkBanner"
						src="${pageContext.request.contextPath}/save/img/banner/shop/blackpinkBanner01.jpg" />
				</div>
				
				<div class="swiper-slide">
					<img alt="blackpinkBanner"
						src="${pageContext.request.contextPath}/save/img/banner/shop/blackpinkBanner04.jpg" />
				</div>
			</div>
</div>
</div>
<script type="text/javascript">

var mySwiper = new Swiper ('.swiper-container', {
  speed: 400,
  spaceBetween: 100,
  initialSlide: 0,
  //truewrapper adoptsheight of active slide
  autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
  delay : 2000,   // 시간 설정
  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
},
  autoHeight: false,
  // Optional parameters
  direction: 'horizontal',
  loop: true,
  // delay between transitions in ms
  //scrollbar: '.swiper-scrollbar',
  // "slide", "fade", "cube", "coverflow" or "flip"
  effect: 'coverflow',
  slideToClickedSlide : true,
  // Distance between slides in px.
  spaceBetween: 60,
  //
  slidesPerView: 2,
  //
  centeredSlides: true,
  //
  slidesOffsetBefore: 0,
  //
  grabCursor: true,
})        

</script>
</body>
</html>