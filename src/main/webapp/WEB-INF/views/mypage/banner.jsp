<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
    0 0 150px #FF3166;
}

/* general styling */
:root {
  font-size: calc(1vw + 1vh + 1.5vmin);
}

.container {
  margin: 0 auto;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  background-color: #010a00;
  font-family: -apple-system, 
    BlinkMacSystemFont, 
    "Segoe UI", 
    Roboto, 
    Oxygen-Sans, 
    Ubuntu, 
    Cantarell, 
    "Helvetica Neue", 
    sans-serif;
  font-size: 1rem;
  height: 600px;
}



h1 {
  font-weight: 400;
  text-align: center;
  text-transform: uppercase;
  line-height: 600px;
}

.cover{
	background-color: #F4A7BB;
	width: 100%;
	height: 80px;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  z-index: 10;
}

.cover p {
  display: flex;
  font-size: clamp(1vw, 4vw, 2.5rem);
  font-weight: 800;
  font-family: NotoSans;
  font-style: italic;
  width: 100vw;
  color: #ffffff80;
}

/**gradaion*/
.moving-grad {
  background: linear-gradient(270deg, #FF3166, #F8D8E350);
  background-size: 200% 200%;
  animation: MoveGrad 5s ease infinite;
}

.moving-grad2 {
  background: linear-gradient(270deg, #FF316650, #F8D8E350);
  background-size: 200% 200%;
  animation: MoveGrad 5s ease infinite;
}
.moving-grad__txt {
  font-size: 50px;
  font-family: Arial;
  font-weight: 700;
  color: #fff;
}

@keyframes MoveGrad {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

</style>
</head>
<body>
	<div class="container">
	  <h1 class="neon">Hello BlinkTown !</h1>
	</div>
	<div class="cover moving-grad">
		<p class="first-parallel"></p>
	</div>
	
<script type="text/javascript">
const pTag1 = document.querySelector('.first-parallel')
const textArr1 = ' BLACKPINK IN YOUR AREA  BLACKPINK IN YOUR AREA  BLACKPINK IN YOUR AREA'.split(' ')

let count1 = 0
initTexts(pTag1, textArr1)


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
  count1 = marqueeText(count1, pTag1, -1)
  window.requestAnimationFrame(animate)
}

function scrollHandler() {
  count1 += 15
}

window.addEventListener('scroll', scrollHandler)
animate()
</script>
</body>
</html>