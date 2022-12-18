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
	href="${pageContext.request.contextPath}/css/shop/cart.css">
	
	<script type="text/javascript">
	
	$(function() {
		
		$(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	    });
		
		$("#deleteAll").on("click", function() {
			if(confirm("장바구니를 비우시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/cart/deleteAll";
			}
		});
			
		$("#deleteOne").on("click", function() {
			
			let array = [];
			let i = 0;
			$('input:checkbox[name=cart-select]').each(function (index) {
				if($(this).is(":checked")==true && $(this).val() != 'selectall'){
			    	array[i++] = $(this).val();
			    }
			});	
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/cart/deleteOne",
				dataType:"json",
				data:JSON.stringify(array),
				contentType: 'application/json',
				success:function(result){		
					location.reload();
				},
				error : function(request,status,err){//에러 : 보통 콜백함수
					  alert("code="+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+err);	  
				 } 
			});
				
		});
	
		calc_total();
	})
		
		function calc_total(){
			  let sum = 0;
			  
			  $('.price_cart').each(function(){
				console.log($(this).text());
			    sum += parseInt($(this).text());
			  });
			  console.log(sum);
			  $("#totalPrice").html(sum);
		}
	

	</script>
</head>
<body id="body">
  <section class="cart">
  <h1>장바구니</h1>
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 session에 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
            </ul>
        </div>
         <form>
         <div class="cart__optionbtn">
         	<button class="cart__list__optionbtn moving-grad" id="deleteOne" onclick="return false;">선택상품 삭제</button>
         	<button class="cart__list__optionbtn moving-grad" id="deleteAll" onclick="return false;">장바구니 비우기</button>
        </div>
        <table class="cart__list">   
     
                <thead>
                    <tr>
                        <td>
                        	<div class="checkbox-animate" >
							  <label> <input type="checkbox" name='cart-select' value='selectall'
									onclick='selectAll(this)'> <span class="input-check"></span>
							  </label>
							</div>
						</td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                	<c:when test="${empty sessionScope.cartList}">
                		<tr>
                			<td colspan="9" style="text-align: center;"> <h3>장바구니 내역이 없습니다.</h3></td>
                		</tr>
                	</c:when>
                	
                	<c:otherwise>
		                <c:forEach items="${sessionScope.cartList}" var="cart" varStatus="state">
		                	 <tr class="cart__list__detail">
		                        <td>
									<div class="checkbox-animate">
									  <label>
									    <input type="checkbox"  name='cart-select' value='${cart.product.productCode}'>
									    <span class="input-check"></span>
									  </label>
									</div>
								</td>
		                        <td><img src="${pageContext.request.contextPath}/save/shopImg/title/${cart.product.productMainImg}" alt="magic keyboard"></td>
		                        <td id="productCode"><a href="#">${cart.product.productCode}</a>
		                            <p>${cart.product.productEngName}<br>${cart.product.productName}</p>
		         
		                        <td>
		                            <p>총 주문수량: <span>${cart.cartQty}</span>개</p>
		                        </td>
		                        <td>
									  <span class="price_cart">${cart.cartPrice}</span><span>원</span>
		                        </td>
		                    </tr>
		                </c:forEach>
	                </c:otherwise>
                </c:choose>
                
        
                </tbody>
               
                <tfoot>
                	<tr>
                	<td colspan="5"></td>
                	</tr>
                    <tr class="cart__list__detail moving-grad">
                        <td></td>
                        <td colspan="3" style="background-color: inherit;"></td>
  
                        <td><span class="price"><span>총 </span><span id="totalPrice"></span></span><span>원</span></span><br>
                        </td>
                    </tr>
                    
                </tfoot>
            
        </table>
        <div class="cart__mainbtns">
         <button class="cart__bigorderbtn left" id="continue" onclick="location.href = '${pageContext.request.contextPath}/shop/main'; return false;">쇼핑 계속하기</button>

			<!-- 로그인하면 구매버튼 보이게 설정 -->
			<sec:authorize access="isAuthenticated()">
            <button class="cart__bigorderbtn right" onclick="location.href='${pageContext.request.contextPath}/orders/ordersForm'; return false;">주문하기</button>
            </sec:authorize>
        </div>
        </form>
    </section>
    
    <script type="text/javascript">
    function selectAll(selectAll)  {
    	  const checkboxes 
    	       = document.getElementsByName('cart-select');
    	  
    	  checkboxes.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	}
    
    </script>
</body>
</html>