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
	
<script type="text/javascript">
let selectOption = '';

$(function() {
	
	$(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
    });
	
	selectMembershipOnlyProduct();
	selectAllGoods();
	
	$("#sortOption").on("change", function() {
		if($("#sortOption").val()==null)
			return;
		else {
			if(selectCondition != null){
				selectAllGoods(1, selectCondition);
			} else{
				selectAllGoods(1, null);
			}
		}
		
	});
	
	var selectCondition = '';
	
	$("#MEMBERSHIP").on("click", function() {
		selectCondition='M';
		selectAllGoods(1, selectCondition);
	});
	
	$("#GOODS").on("click", function() {
		selectCondition='G';
		selectAllGoods(1, selectCondition);
	});
	
	$("#ALBUM").on("click", function() {
		selectCondition='A';
		selectAllGoods(1, selectCondition);
	});
	
	$("#SHOP").on("click", function() {
		selectCondition = null;
		selectAllGoods(1, null);
	});
	
});

function selectMembershipOnlyProduct () {
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/shop/select",
		data:{"GoodsMembershipOnly":"1", "orderCondition":$('select[class=sort-option]').val()},
		dataType:"json",
		success:function(result){
			let str = "<ul class='auto-grid' role='list'>";
			$.each(result.content, function(index, item) {
				str +="<li><a href='${pageContext.request.contextPath}/shop/select/"+item.productCode+"?flag=true' target='_blank ' class='profile'>";

				// 한글 & 영문 선택
				if($("#selectbox").val() == 'ko'){
					str +="<h3 class='profile__name'>["+item.productName+"]</h3>";
				} else{
					str +="<h3 class='profile__name'>["+item.productEngName+"]</h3>";	
				}		
					str +="<div class='price-text'>";
					str +="<p>"+item.productPrice+"</p>";		
					str +="<p>원</p></div>";
					str +="<img alt='Anita Simmons' src='${pageContext.request.contextPath}/save/shopImg/title/"+item.productMainImg+"' />";			
					str +="</a></li>";				
			});
			str += "</ul>";

			$("#membershipOnly").html(str);
		},
		error:function(error){
			alert(error);
		}
	});
}

function selectAllGoods(index, categoryCode) {
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/shop/select",
		data:{"GoodsMembershipOnly":"0", "orderCondition":$('select[class=sort-option]').val(), "nowPage":index, "categoryCode":categoryCode},
		dataType:"json",
		success:function(result){
			console.log(result);
			
			var pageNo = result.pageable.pageNumber;
			var totalPage = result.totalPages;
			var startPage = 0;
			let pageNum = '';
			for(let i=1; i<=totalPage; i++){
				if(i==(pageNo+1))
					pageNum += '<a href="#" class="active">'+i+'</a>';
				else 
					pageNum += '<a href="#" onclick="selectAllGoods('+i+')")>'+i+'</a>';
			}
			
			$(".pagination").html(pageNum);
			
			let str = "<ul class='auto-grid' role='list'>";
			
			$.each(result.content, function(index, item) {
				//console.log(item);
				str +="<li><a href='/shop/select/"+item.productCode+"?flag=true' target='_blank ' class='profile'>";

				// 한글 & 영문 선택
				if($("#selectbox").val() == 'ko'){
					str +="<h3 class='profile__name'>["+item.productName+"]</h3>";
				} else{
					str +="<h3 class='profile__name'>["+item.productEngName+"]</h3>";	
				}		
					str +="<div class='price-text'>";
					str +="<p>"+item.productPrice+"</p>";		
					str +="<p>원</p></div>";
					str +="<img src='${pageContext.request.contextPath}/save/shopImg/title/"+item.productMainImg+"' />";
					str +="</a></li>";				
			});
			str += "</ul>";

			$("#goods").html(str);
		},
		error:function(error){
			alert(error);
		}
	});
}

	
</script>
</head>
<body>
<div class="shop-wrap">
	<div class="shop-main-wrap">
		<div class="shop-aside-container">
			<div class="shop-aside">
				<div class="aside-menu" id="SHOP">SHOP</div>
				<div class="aside-menu" id="MEMBERSHIP">MEMBERSHIP</div>
				<div class="aside-menu" id="GOODS">GOODS</div>
				<div class="aside-menu" id="ALBUM">ALBUM</div>
			</div>

		</div>
		<!-- shop-aside-container -->


		<div class="shop-main-coontainer">
			<div class="title">
				<div>MEMBERSHIP</div>
				<div>ONLY</div>
			</div>
			<div class="wrapper">
				<article class="flow">
					<div class="team" id="membershipOnly"></div>
				</article>
				<div class="goods-shop">
				<div class="title">
					<div>GOODS</div>
					<div>SHOP</div>							
				</div>
				<div class="select-sort">
					<select class="sort-option" id="sortOption">
						<option class="sort-option"><spring:message code="Sort"/></option>
						<option class="sort-option" value="productRegDate"><spring:message code='Newproduct' /></option>
						<option class="sort-option" value="productReadNo"><spring:message code='Popularity' /></option>
						<option class="sort-option" value="productPriceHigh"><spring:message code='Highprice' /></option>
						<option class="sort-option" value="productPriceLow"><spring:message code='Lowprice' /></option>				
						</select>
				</div>
				<article class="flow">
					<div class="team" id="goods">
						
					</div>
				</article>
				</div><!-- goods-shop -->
			</div>
<div class="pagination">

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