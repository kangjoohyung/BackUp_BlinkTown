<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.background-img{
  width: 100%;
  overflow: hidden;
  background-color:#000000;
  position:absolute;
  top:550px;
  z-index:-1;
}

.cover {
  background-color:#000000;
  width: 100vw;
  margin-bottom: 10vw;
  display: flex;
}

.cover:nth-child(1) {
  transform: rotate(-2deg);
  background-color: #F8D8E3;
  width: 100vw;
}

.cover:nth-child(2) {
  transform: rotate(2deg);
  background-color: #F4A7BB;
  width: 100vw;
  justify-content: flex-end;
}

.cover:nth-child(3) {
  transform: rotate(-2deg);
  background-color: #F8D8E3;
  width: 100vw;
}
.cover:nth-child(4) {
  transform: rotate(2deg);
  background-color: #F4A7BB;
  width: 100vw;
  justify-content: flex-end;
}

.cover:nth-child(5) {
  transform: rotate(-2deg);
  background-color: #F8D8E3;
  width: 100vw;
}
.cover:nth-child(6) {
  transform: rotate(2deg);
  background-color: #F4A7BB;
  justify-content: flex-end;
  margin-bottom:0px;
  width: 100vw;
}

p {
  display: flex;
  font-size: clamp(1vw, 4vw, 2.5rem);
}
</style>

</head>
<body>
<div class="background-img">
	<div class="cover">
	  <p class="first-parallel"></p>
	</div>
	<div class="cover">
	  <p class="second-parallel"></p>
	</div>
	<div class="cover">
	  <p class="third-parallel"></p>
	</div>
	<div class="cover">
	  <p class="forth-parallel"></p>
	</div>
	<div class="cover">
	  <p class="hifth-parallel"></p>
	</div>
	<div class="cover">
	  <p class="sixth-parallel"></p>
	</div>
</div>
<script type="text/javascript">
	const pTag1 = document.querySelector('.first-parallel')
	const pTag2 = document.querySelector('.second-parallel')
	const pTag3 = document.querySelector('.third-parallel')
	const pTag4 = document.querySelector('.forth-parallel')
	const pTag5 = document.querySelector('.hifth-parallel')
	const pTag6 = document.querySelector('.sixth-parallel')
	
	const textArr1 = ' BLACKPINK IN YOUR AREA  BLACKPINK IN YOUR AREA  BLACKPINK IN YOUR AREA'.split(' ')

	let count1 = 0
	let count2 = 0
	let count3 = 0
	let count4 = 0
	let count5 = 0
	let count6 = 0
	
	initTexts(pTag1, textArr1)
	initTexts(pTag2, textArr1)
	initTexts(pTag3, textArr1)
	initTexts(pTag4, textArr1)
	initTexts(pTag5, textArr1)
	initTexts(pTag6, textArr1)

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

	  count1 = marqueeText(count1, pTag1, -1)
	  count2 = marqueeText(count2, pTag2, 1)
	  count3 = marqueeText(count3, pTag3, -1)
	  count4 = marqueeText(count4, pTag4, 1)
	  count5 = marqueeText(count5, pTag5, -1)
	  count6 = marqueeText(count6, pTag6, 1)

	  window.requestAnimationFrame(animate)
	}

	function scrollHandler() {
	  count1 += 15
	  count2 += 15
	  count3 += 15
	  count4 += 15
	  count5 += 15
	  count6 += 15
	}

	window.addEventListener('scroll', scrollHandler)
	animate()
</script>
</body>
</html>