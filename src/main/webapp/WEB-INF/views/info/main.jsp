<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/info/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/michalsnik/aos/2.0.4/dist/aos.css">
<script src="https://cdn.rawgit.com/michalsnik/aos/2.0.4/dist/aos.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	document.querySelector("video").play();
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=3&order=viewCount&channelId=UCOmHUn--16B90oW2L6FRR3A&type=video&key=AIzaSyD9cPaoBha4w0gCgrvVM8T4L8CvQyViFPQ",
        contentType : "application/json",
        success : function(data) {
            data.items.forEach(function(element, index) {
                $('.swiper-slide'+index).html('<iframe width="100%" height="100%" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="palyYoutube"></iframe>');
            });
        },
        complete : function(data) {
        },
        error : function(xhr, status, error) {
            console.log("유튜브 요청 에러: "+error);
        }
    });
});
</script>
</head>
<body>
	<div class="content-wrap">
<audio autoplay="autoplay" hidden="true" >
	<source src="${pageContext.request.contextPath}/save/audio/BLACKPINKShutDownMV.mp3">
</audio>
		<div class="content-col" >
			<div class="title neon">
				<span>BLACK</span><span>PINK</span>
			</div>
			<div data-aos="fade-right">
				<div class="member-img">
				<video autoplay muted loop  height="310px" width="450px">
					<source src="${pageContext.request.contextPath}/save/img/BLACKPINK/BK00.mp4" type="video/mp4">
				</video>
				</div>
				<div class="member-info">
					<p><spring:message code="MemberInfo"/></p>
				</div>
			</div>
		</div>

		<div class="content-col" data-aos="fade-left">
			<div class="title neon">
				<span>ARTIST</span>
			</div>
			<div class="ARTIST">
				<div class="card card0">
					<div class="border">
						<h2>JISOO</h2>
						<h2 style="color: #ffffff; margin: 0px 20px;">1995.01.03</h2>
						<div class="snsicons">
							<a href="https://www.instagram.com/sooyaaa__/"
								style="color: #ffffff;"><i class="fa fa-instagram"
								aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
				<div class="card card1">
					<div class="border">
						<h2>JENNIE</h2>
						<h2 style="color: #ffffff; margin: 0px 20px;">1996. 01. 16</h2>
						<div class="snsicons">
							<a href="https://www.instagram.com/jennierubyjane/"
								style="color: #ffffff;"><i class="fa fa-instagram"
								aria-hidden="true"></i></a> <a
								href="https://www.youtube.com/@jennierubyjane"
								style="color: #ffffff;"><i class="fa fa-youtube-play"
								aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="card card2">
				<div class="border">
					<h2>LISA</h2>
					<h2 style="color: #ffffff; margin: 0px 20px;">1997. 03. 27</h2>
					<div class="snsicons">
						<a href="https://www.instagram.com/roses_are_rosie/"
							style="color: #ffffff;"><i class="fa fa-instagram"
							aria-hidden="true"></i></a> <a
							href="https://www.youtube.com/@roses_are_rosie"
							style="color: #ffffff;"><i class="fa fa-youtube-play"
							aria-hidden="true"></i></a>
					</div>
				</div>
			</div>
			<div class="card card3">
				<div class="border">
					<h2>ROSE</h2>
					<h2 style="color: #ffffff; margin: 0px 20px;">1997. 02. 11</h2>
					<div class="snsicons">
						<a href="https://www.instagram.com/lalalalisa_m/"><i
							class="fa fa-instagram" aria-hidden="true"
							style="color: #ffffff;"></i></a> <a
							href="https://www.youtube.com/@lalalalisa_m"
							style="color: #ffffff;"><i class="fa fa-youtube-play"
							aria-hidden="true"></i></a>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--유튜브  -->
	<div class="content-col" style="padding-bottom: 10px;"  data-aos="flip-down">
		<div class="title neon" style="text-align: center;">
			<span>YOUTUBE</span>
		</div>
	</div>
	<div class="youtube-wrap" data-aos="flip-down">
		<!-- Slider main container -->
		<div class="swiper-container">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide swiper-slide0 vedio-slide" >	
				</div>
				<div class="swiper-slide swiper-slide1 vedio-slide">
				</div>
				<div class="swiper-slide swiper-slide2 vedio-slide">
				</div>
			</div>
		</div>
	</div>
	<div class="content-col" style="padding-top: 0px;" data-aos="flip-down">
		<div class="title" style="text-align: center;">
			<a href="/info/youtube" class="moving-grad viewmore" style="text-decoration: none;">VIEW MORE</a>
		</div>
	</div>
	
	<div class="content-col" style="padding-bottom: 10px;" data-aos="flip-down">
		<div class="title neon" style="text-align: center;">
			<span>GALLERY</span>
		</div>
	</div>
	<div class="gallery-wrap" data-aos="flip-down">
		<!-- Slider main container -->
		<div class="gallery-swiper-container">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide" style="max-width: 225px; height: 336px;" >
					<img alt=""
						src="${pageContext.request.contextPath}/save/img/JISOO/JI1.jfif" />
				</div>
				<div class="swiper-slide" style="max-width: 225px; height: 336px;" >
					<img alt=""
						src="${pageContext.request.contextPath}/save/img/JENNIE/JN1.jfif" />
				</div>
				<div class="swiper-slide" style="max-width: 225px; height: 336px;" >
					<img alt=""
						src="${pageContext.request.contextPath}/save/img/LISA/L1.jfif" />
				</div>
				<div class="swiper-slide" style="max-width: 225px; height: 336px;" >
					<img alt=""
						src="${pageContext.request.contextPath}/save/img/ROSE/R1.jfif" />
				</div>
			</div>
		</div>
	</div>
	<div class="content-col" style="padding-top: 0px; text-align: center;">
			<a href="/gallery/downList" class="moving-grad viewmore" style="text-decoration: none;">VIEW MORE</a>
	</div>
	
	<!--ALBUM  -->
	<div class="content-col" style="padding-bottom: 10px;"data-aos="flip-down">
		<div class="title neon" style="text-align: center; margin-bottom: 20PX; margin-top: 20px;">
			<span>ALBUM</span>
		</div>
	</div>
	<div class="album-wrap"data-aos="flip-down">
		<!-- Slider main container -->
		<div class="album-swiper-container">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide" style="max-width: 400px; height: 400px;">
					<img alt="Anita Simmons"
						src="${pageContext.request.contextPath}/save/img/ALBUM/SQUAREUP.jfif" />
				</div>
				<div class="swiper-slide  "  style="max-width: 400px; height: 400px;">
					<img alt="Anita Simmons"
						src="${pageContext.request.contextPath}/save/img/ALBUM/KILLTHISLOVE.jfif" />
				</div>
				<div class="swiper-slide"  style="max-width: 400px; height: 400px;">
					<img alt="Anita Simmons"
						src="${pageContext.request.contextPath}/save/img/ALBUM/THEALBUM.jfif" />
				</div>
				<div class="swiper-slide"  style="max-width: 400px; height: 400px;">
					<img alt="Anita Simmons"
						src="${pageContext.request.contextPath}/save/img/ALBUM/BORNPINK.jfif" />
				</div>
			</div>
		</div>
	</div>
	<div class="content-col" style="padding-top: 60px; text-align: center; margin-bottom: 50px;">
			
	</div>
	<div class="background-img">
	<div class="cover">
	  <p class="first-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="second-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="third-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="forth-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="hifth-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="sixth-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="seventh-parallel parallel"></p>
	</div>
	<div class="cover">
	  <p class="eighth-parallel parallel"></p>
	</div>
</div>
<script type="text/javascript">
	const pTag1 = document.querySelector('.first-parallel')
	const pTag2 = document.querySelector('.second-parallel')
	const pTag3 = document.querySelector('.third-parallel')
	const pTag4 = document.querySelector('.forth-parallel')
	const pTag5 = document.querySelector('.hifth-parallel')
	const pTag6 = document.querySelector('.sixth-parallel')
	const pTag7 = document.querySelector('.seventh-parallel')
	const pTag8 = document.querySelector('.eighth-parallel')

	
	const textArr1 = ' BLACKPINK IN YOUR AREA BLACKPINK IN YOUR AREA BLACKPINK IN YOUR AREA'.split(' ')

	let count1 = 0
	let count2 = 0
	let count3 = 0
	let count4 = 0
	let count5 = 0
	let count6 = 0
	let count7 = 0
	let count8 = 0


	
	initTexts(pTag1, textArr1)
	initTexts(pTag2, textArr1)
	initTexts(pTag3, textArr1)
	initTexts(pTag4, textArr1)
	initTexts(pTag5, textArr1)
	initTexts(pTag6, textArr1)
	initTexts(pTag7, textArr1)
	initTexts(pTag8, textArr1)


	function initTexts(element, textArray) {
	  textArray.push(...textArray)
	  for (let i = 0; i < textArray.length; i++) {
	    element.innerText += `${'${textArray[i]}'}\u00A0\u00A0\u00A0\u00A0`
	  }
	}

	function marqueeText(count, element, direction) {
	  if (count > element.scrollWidth / 2) {
	    element.style.transform = `translate3d(0, 0, 0)`
	    count = 0
	  }
	  element.style.transform = `translate3d(${'${direction * count}'}px, 0, 0)`

	  return count
	}

	function animate() {
	  count1++
	  count2++
	  count3++
	  count4++
	  count5++
	  count6++
	  count7++
	  count8++


	  count1 = marqueeText(count1, pTag1, -1)
	  count2 = marqueeText(count2, pTag2, 1)
	  count3 = marqueeText(count3, pTag3, -1)
	  count4 = marqueeText(count4, pTag4, 1)
	  count5 = marqueeText(count5, pTag5, -1)
	  count6 = marqueeText(count6, pTag6, 1)
	  count7 = marqueeText(count7, pTag7, -1)
	  count8 = marqueeText(count8, pTag8, 1)


	  window.requestAnimationFrame(animate)
	}

	function scrollHandler() {
	  count1 += 15
	  count2 += 15
	  count3 += 15
	  count4 += 15
	  count5 += 15
	  count6 += 15
	  count7 += 15
	  count8 += 15
	}

	window.addEventListener('scroll', scrollHandler)
	animate()
</script>
	<script type="text/javascript">
		var VedioSwiper = new Swiper('.swiper-container', {
			speed : 400,
			spaceBetween : 20,
			initialSlide : 0,
			//truewrapper adoptsheight of active slide
			autoplay : { // 자동 슬라이드 설정 , 비 활성화 시 false
				delay : 3000, // 시간 설정
				disableOnInteraction : false, // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
			},
			autoHeight : false,
			// Optional parameters
			direction : 'horizontal',
			loop : true,
			// delay between transitions in ms
			//scrollbar: '.swiper-scrollbar',
			// "slide", "fade", "cube", "coverflow" or "flip"
			effect : 'slide',
			slideToClickedSlide : true,
			// Distance between slides in px.
			spaceBetween : 20,
			//
			slidesPerView : 2,
			//
			centeredSlides : true,
			//
			slidesOffsetBefore : 0,
			//
			grabCursor : true
		})
		$('.vedio-slide').hover(function(){
			VedioSwiper.autoplay.stop();
			}, function(){
				VedioSwiper.autoplay.start();
		});
	</script>
	<script type="text/javascript">
		var mySwiper = new Swiper('.gallery-swiper-container', {
			slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
			spaceBetween : 6, // 슬라이드 사이 여백
			loop : true, // 슬라이드 반복 여부(true시 무한 loop)
			loopAdditionalSlides: 1,
			autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
			  delay : 1000,   // 시간 설정
			  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
			  
			},
			direction: "horizontal", // 스와이프 방향
			slideToClickedSlide : true, // 해당 슬라이드 클릭시 슬라이드 위치로 이동
			centeredSlides : true // true시에 슬라이드가 가운데로 배치
			
		})
	</script>
	<script type="text/javascript">
		var mySwiper = new Swiper('.album-swiper-container', {
			slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
			spaceBetween : 6, // 슬라이드 사이 여백
			loop : true, // 슬라이드 반복 여부(true시 무한 loop)
			autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
			  delay : 1000,   // 시간 설정
			  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
			  
			},
			effect : 'coverflow',
			direction: "horizontal", // 스와이프 방향
			slideToClickedSlide : true, // 해당 슬라이드 클릭시 슬라이드 위치로 이동
			centeredSlides : true, // true시에 슬라이드가 가운데로 배치
			grabCursor : true
		})
	</script>
	<script type="text/javascript">
	AOS.init({
		  duration: 1000
		});
	</script>
</body>
</html>