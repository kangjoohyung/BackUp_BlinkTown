<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board/boardInsertForm.css">
<style type="text/css">
.input_field{
margin-bottom: 5px;
 border: 1px solid #F4A7BB50;
 padding: .5em .75em;
 width: 90%;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  float:left;
  padding: .4em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #F4A7BB;
  cursor: pointer;
  border: 1px solid #F4A7BB;
  border-bottom-color: #F4A7BB;
  border-radius: .25em;
  margin: 10px 0px 20px 0px;
}

/* named upload */
.filebox .upload-name {
  float:left;
  display: block;
  width:70%;
  padding: .4em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #000000;
  border: 1px solid #F4A7BB50;
  border-bottom-color: #F4A7BB50;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  color: #ffffff;
  margin: 10px 5px 20px 0px;
}
h3{
margin-bottom: 20px;
}
.image {
    width: 100%;
    height: 500px;
    background-position: center center;
    background-size: cover;
 	background-repeat:no-repeat;
    display: inline-block;
 	box-shadow:0px -3px 6px 2px rgba(0,0,0,0.2);
}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/shop/updateGoods" method="post">
	<section class="main">
		<div class="wrapper">
			<div class="left-col">
				<div class="post">
					<div class="row">
						<div class="col-sm-2 imgUp">
							<div class="image" style="background-image: url('${pageContext.request.contextPath}/save/shopImg/title/${product.productMainImg}')"></div>
						</div>
						<!-- col-2 -->
					</div>
					<!-- row -->
				</div>
			</div>

			<div class="right-col">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
			<h3>Goods Update</h3>
				<input type="text" name="categoryCode" value="${product.category.categoryCode}" class="input_field" readonly="readonly"><br>
				<input type="text" name="productCode" value="${product.productCode}" placeholder="상품코드" class="input_field" readonly="readonly"><br>
				<input type="text" name="productName" value="${product.productName}" placeholder="상품명 [KOR]" class="input_field" readonly="readonly"><br>
				<input type="text" name="productEngName" value="${product.productEngName}" placeholder="상품명 [ENG]" class="input_field" readonly="readonly"><br>
				<input type="text" name="productPrice" placeholder="가격" class="input_field"><br>
				<input type="number" name="productStock"  placeholder="재고" class="input_field"><br>
				<input type="text" name="productSize" value="${product.productSize}" placeholder="사이즈" class="input_field" readonly="readonly"><br>
				<input type="text"  name="goodsMaterial" placeholder="재질" class="input_field"><br>
				<input type="text" name="goodsCountry" placeholder="제조국" class="input_field"><br>

				<div class='insert-submt'>
					<button class='closeBtn'>취소</button>
					<button type="submit" class='submitBtn'>수정</button>
				</div>

			</div>
		</div>
	</section>
</form>
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
	</div>
	<script type="text/javascript">
	const pTag1 = document.querySelector('.first-parallel')
	const pTag2 = document.querySelector('.second-parallel')
	const pTag3 = document.querySelector('.third-parallel')
	const pTag4 = document.querySelector('.forth-parallel')

	
	const textArr1 = ' BLACKPINK IN YOUR AREA BLACKPINK IN YOUR AREA BLACKPINK IN YOUR AREA'.split(' ')

	let count1 = 0
	let count2 = 0
	let count3 = 0
	let count4 = 0

	
	initTexts(pTag1, textArr1)
	initTexts(pTag2, textArr1)
	initTexts(pTag3, textArr1)
	initTexts(pTag4, textArr1)


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


	  count1 = marqueeText(count1, pTag1, -1)
	  count2 = marqueeText(count2, pTag2, 1)
	  count3 = marqueeText(count3, pTag3, -1)
	  count4 = marqueeText(count4, pTag4, 1)


	  window.requestAnimationFrame(animate)
	}

	function scrollHandler() {
	  count1 += 15
	  count2 += 15
	  count3 += 15
	  count4 += 15

	}

	window.addEventListener('scroll', scrollHandler)
	animate()
</script>
</body>
</html>