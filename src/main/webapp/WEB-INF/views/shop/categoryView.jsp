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
	href="${pageContext.request.contextPath}/css/shop/shopMain.css">
</head>
<body>
<div class="shop-wrap">
	<div class="shop-main-wrap">
		<div class="shop-aside-container">
			<div class="shop-aside">
				<div class="shop-aside-title">SHOP</div>
				<div class="aside-menu">MEMBERSHIP</div>
				<div class="aside-menu">GOODS</div>
				<div class="aside-menu">ALBUM</div>
			</div>

		</div>
		<!-- shop-aside-container -->


		<div class="shop-main-coontainer">
			<div class="title">
			<div></div>
				<div>MEMBERSHIP</div>
			</div>
			<div class="wrapper">
				<article class="flow">
					<div class="team">
						<ul class="auto-grid" role="list">
							<li><a href="/shop/details" target="_blank " class="profile">
									<h3 class="profile__name">[EUP23] BLACKPINK COLLECTIBLE
										FIGURE_ JISOO</h3>
									<div class="price-text">
										<p>000000</p>
										<p>원</p>
									</div> <img alt="Anita Simmons"
									src="${pageContext.request.contextPath}/img/FIGURE_JENNIE.png" />
							</a></li>

							<li><a href="#" target="_blank " class="profile">
									<h3 class="profile__name">[EUP23] BLACKPINK COLLECTIBLE
										FIGURE_ JISOO</h3>
									<div class="price-text">
										<p>000000</p>
										<p>원</p>
									</div> <img alt="Anita Simmons"
									src="${pageContext.request.contextPath}/img/FIGURE_JENNIE.png" />
							</a></li>

							<li><a href="#" target="_blank " class="profile">
									<h3 class="profile__name">[EUP23] BLACKPINK COLLECTIBLE
										FIGURE_ JISOO</h3>
									<div class="price-text">
										<p>000000</p>
										<p>원</p>
									</div> <img alt="Anita Simmons"
									src="${pageContext.request.contextPath}/img/FIGURE_JENNIE.png" />
							</a></li>

							<li><a href="#" target="_blank " class="profile">
									<h3 class="profile__name">[EUP23] BLACKPINK COLLECTIBLE
										FIGURE_ JISOO</h3>
									<div class="price-text">
										<p>000000</p>
										<p>원</p>
									</div> <img alt="Anita Simmons"
									src="${pageContext.request.contextPath}/img/FIGURE_JENNIE.png" />
							</a></li>
						</ul>
					</div>
				</article>
			</div>
<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a class="active" href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
</div>
		<!-- shop-main-container -->
	</div>
</div>
	<script type="text/javascript">
	const nonClick = document.querySelectorAll(".aside-menu");

	function handleClick(event) {
	  // div에서 모든 "click" 클래스 제거
	  nonClick.forEach((e) => {
	    e.classList.remove("click");
	  });
	  // 클릭한 div만 "click"클래스 추가
	  event.target.classList.add("click");
	}

	</script>
</body>
</html>