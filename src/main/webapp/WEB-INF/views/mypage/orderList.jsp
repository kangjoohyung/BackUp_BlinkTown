<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage/orderList.css">
</head>
<body>
	<div class="likeList-wrap box">
	 <div class="userInfo-title">주문조회</div>
		<div class="accordionWrapper ">
			<table class="titleTable">
				<!-- 고정 타이틀 -->
				<tr>
					<th style="width: 15%;">주문번호</th>
					<th style="width: 35%;">주소지</th>
					<th style="width: 10%;">이름</th>
					<th style="width: 15%;">전화번호</th>
					<th style="width: 10%;">우편번호</th>
					<th style="width: 15%;">주문날짜</th>
				</tr>
			</table>
			<!-- 고정 타이틀 -->
			<!-- 반복 -->
			<c:forEach items="${ordersList}" var="orders" varStatus="state">
				
			<div class="accordionItem close">
				<div class="accordionItemHeading">
					<table>
						<tr>
							<td style="width: 15%;">${orders.ordersNo}</td>
							<td style="width: 35%;">${orders.ordersAddr}</td>
							<td style="width: 10%;">${orders.ordersReceiverName}</td>
							<td style="width: 15%;">${orders.ordersReceiverPhone}</td>
							<td style="width: 10%;">${orders.ordersZipcode}</td>
							<td style="width: 15%;">${orders.ordersDate}</td>
						</tr>
					</table>
				</div>

				<div class="accordionItemContent">
					<br>
					<div class="orderDetail-title">[주문번호: ${orders.ordersNo}] [주문시간: ${orders.ordersDate}] [총금액: <fmt:formatNumber value="${orders.amount}" pattern="###,###,###,###"/>원]</div>
					<br>
					<br>
					<table>
						<tr style="color: #ffffff; margin-bottom: 5px;">
							<th style="width: 15%;">주문상세번호</th>
							<th style="width: 15%;">주문금액</th>
							<th style="width: 10%;">주문수량</th>
							<th style="width: 10%;">상품코드</th>
							<th style="width: 35%;">상품명</th>
							<th style="width: 15%;">상품금액</th>
						</tr>
						<c:forEach items="${orders.orderdetailsList}" var="details" varStatus="state">
						<tr>
							<td style="width: 15%;">${details.orderdetailsNo}</td>
							<td style="width: 15%;"><fmt:formatNumber value="${details.orderdetailsPrice}" pattern="###,###,###,###"/>원</td>
							<td style="width: 10%;">${details.orderdetailsQty}개</td>
							<td style="width: 10%;">${details.product.productCode}</td>
							<!--쿠키값 따라 상품명 선택 영어일때 영어상품, 나머지는 한글이름--> 
							<td style="width: 35%;">
								<c:choose>
									<c:when test="${cookie.lang.value eq 'en'}">${details.product.productEngName}</c:when>
									<c:otherwise>${details.product.productName}</c:otherwise>
								</c:choose>
							</td>
							<td style="width: 15%;"><fmt:formatNumber value="${details.product.productPrice}" pattern="###,###,###,###"/>원</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>


	<script type="text/javascript">
		var accItem = document.getElementsByClassName('accordionItem');
		var accHD = document.getElementsByClassName('accordionItemHeading');
		for (i = 0; i < accHD.length; i++) {
			accHD[i].addEventListener('click', toggleItem, false);
		}
		function toggleItem() {
			var itemClass = this.parentNode.className;
			for (i = 0; i < accItem.length; i++) {
				accItem[i].className = 'accordionItem close';
			}
			if (itemClass == 'accordionItem close') {
				this.parentNode.className = 'accordionItem open';
			}
		}
	</script>
</body>
</html>