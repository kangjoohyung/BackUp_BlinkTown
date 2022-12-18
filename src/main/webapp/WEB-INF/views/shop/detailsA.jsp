<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shop/details.css">
<script type="text/javascript">
		$(function() {
			
			$(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		    });
			
			$(".button").on("click", function() {
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/cart/insert",
					data:{"productCode":"${product.productCode}", "productName":"${product.productName}", "productMainImg":"${product.productMainImg}",
						"productEngName":"${product.productEngName}","productPrice":"${product.productPrice}", "qty":$("input[type=number]").val()},	
					dataType:"text",
					success:function(result){
						if(confirm('장바구니 추가 완료했습니다. 장바구니로 이동하시겠습니까?')){
							location.href="${pageContext.request.contextPath}/cart/select";
						}
					},
					error:function(error){
						alert(error);
					}
				});
			});
		})
	</script>
</head>
<body>
	<div id='contents' class="contents-wrap">
		<div class="container">
			<div class="product-img">
				<img id="productImg" src="${pageContext.request.contextPath}/save/shopImg/detail/${product.productDetailImg}">
			</div>
		</div>
		<div class="product-cont">
			<div class="column-col">
				<div class="product-col-img">
					<img src="${pageContext.request.contextPath}/save/shopImg/title/${product.productMainImg}">
					<button class="accordion"><spring:message code="GoodsProductDeails"/> </button>
					<div class="panel">
						<br>
						<h4>[<spring:message code="GoodsSize"/>]</h4>
						<p>${product.productSize}</p>
						<br>

						<h4>[<spring:message code="AlbumComponent"/>]</h4>
						<p>${product.albumComponent}</p>
						<br>
						
						<h4>[<spring:message code="AlbumReleaseDate"/>]</h4>
						<p>${product.albumReleaseDate}</p>
						<br>

						<h4>[<spring:message code="GoodsCautions"/>]</h4>
						<p>
						<spring:message code="GoodsCautionsDetails"/>
						</p>
						<br> <br> <br>
					</div>
				</div>
				<div class="product-text-wrap">
				<div class="product-text">
					<div>
						<a href="">MEMBERSHIP</a>
					</div>
					<p>[${product.productEngName}]<br>${product.productName}</p>
					<div id='detail-price'>
						<div class='amount'>
							<span id='won'><spring:message code="Won"/></span><span id='num'>${product.productPrice}</span>
						</div>
					
						<div class="product-quantity">
					      <input type="number" value="1" min="1" id="orderdetailsQty">
					    </div>
					</div>
					
					<!-- 바로구매 버튼 -->
					<c:choose>
						<c:when test="${product.productMembershipOnly==1}">
							<sec:authorize access="hasRole('ROLE_MEMBER')">
								<button class="btn-order sell" id="directOrderBtn" onclick="return false;"><spring:message code="GoodsBuy"/></button>
							</sec:authorize>
							
						</c:when>
						<c:otherwise>
							<sec:authorize access="isAuthenticated()">
								<button class="btn-order sell" id="directOrderBtn" onclick="return false;"><spring:message code="GoodsBuy"/></button>
							</sec:authorize>
						</c:otherwise>
					</c:choose>
					
					<!-- 카트담기도 버튼부터 조건 설정 -->
					<c:choose>
						<c:when test="${product.productMembershipOnly==1}">
							<sec:authorize access="hasRole('ROLE_MEMBER')">
								<button class="button" id="addcart">
								    <span><spring:message code="GoodsAddCart"/></span>
								    <div class="cart" >
								        <svg viewBox="0 0 36 26">
								            <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
								            <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
								        </svg>
								    </div>
								</button>
							</sec:authorize>
						</c:when>
						<c:otherwise>
							<sec:authorize access="isAuthenticated()">
								<button class="button" id="addcart">
								    <span><spring:message code="GoodsAddCart"/></span>
								    <div class="cart">
								        <svg viewBox="0 0 36 26">
								            <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
								            <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
								        </svg>
								    </div>
								</button>
							</sec:authorize>
						</c:otherwise>
					</c:choose>
					
				</div>
				</div>
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
				
			</div>
		</div><!-- 상품정보 -->
		<!-- container -->
	</div>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>
	<script type="text/javascript">
	document.querySelectorAll('.button').forEach(button => button.addEventListener('click', e => {
	    if(!button.classList.contains('loading')) {

	        button.classList.add('loading');

	        setTimeout(() => button.classList.remove('loading'), 3700);

	    }
	    e.preventDefault();
	}));

	</script>
	
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
<!-- 바로구매 버튼 동작 -->
<script>
$(function() {
	
	$("#directOrderBtn").on("click", function() { //#directOrderBtn //.btn-order sell
		location.href = "${pageContext.request.contextPath}/orders/directOrder/${product.productCode}/"+$("#orderdetailsQty").val();
	});//바로구매 버튼 동작 끝
});//function 끝
</script>
<!-- 바로구매 끝 -->

</body>
</html>