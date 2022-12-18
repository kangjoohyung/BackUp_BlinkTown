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
	href="${pageContext.request.contextPath}/css/shop/order.css">
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  <!-- 주소지API(다음주소api) -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function calc_total(){ //총금액 계산 기능,$(function~~에서  calc_total(); 로 호출
	  let sum = 0;
	  
	  $('.price').each(function(){
		console.log($(this).text());
	    sum += parseInt($(this).text());
	  });
	  console.log(sum);
	  $("#totalPrice").html(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
} //calc_total() end


//카카오API사용하여 결제하기
$(function(){
// 	alert("${directOrder.orderdetailsQty}"); //값 확인용
// 	alert("${directOrder.product.productCode}"); //값 확인용
	
	if($("#productCode").val()==null) {
		$("#checkOutBtn").prop("disabled", true);
	}//값이 없는데 주문 시도할때 버튼 비활성화
	calc_total();//총 금액 계산
	
	$("#checkOutBtn").on("click", function() {
		//IMP객체 생성, 결제준비
		var IMP = window.IMP;
		IMP.init("imp75802403"); //가맹점 식별코드
		//결제 준비하기 끝
		
		//결제하기 버튼 누르면 주문 실행
		//리턴값 주문정보orders, 총합계=amount 결제할 때 사용
//			alert("버튼클릭");//호출됨
		$.ajax({
			url: "${pageContext.request.contextPath}/orders/checkout", //결제하기 메소드
			type: "post",
				dataType: "json", //리턴값 Map사용
			data: $("#ordersForm").serialize(), 
			success: function(result){
//					alert("db성공, amount="+result);//출력확인
//					alert(result.orders.ordersNo);
//					alert(result.amount);
//					alert(result.orders.orderdetailsList[0].orderdetailsPrice);
				var ordersNo=result.orders.ordersNo;
				IMP.request_pay({ //결제창 호출
					pg : "kakaopay", //"html5_inicis" //$("#paymentMethod").val()->선택지두고 페이팔도 구현할 수 있음
					pay_method : "card",
					merchant_uid : result.orders.ordersNo ,//"${orders.ordersNo}" ,//result.orders.ordersNo , 
					name : "BLINK_TOWN_GOODS",
					amount : result.amount ,
					buyer_name : result.orders.ordersReceiverName ,
					buyer_tel : result.orders.ordersReceiverPhone ,
					buyer_addr : result.orders.ordersAddr ,
					buyer_postcode : result.orders.ordersZipcode ,
					m_redirect_url : "http://localhost:8000/"
				}, //IMP.request_pay end 
				function(rsp){//callback
					if(rsp.success){
//							alert("검증시작");
						//결제 성공 시: 결제 승인에 성공한 경우
						//일치하는지 검증하기(검증 메소드 컨트롤러에서 호출)
						$.ajax({
						url: "${pageContext.request.contextPath}/orders/verifyIamport",
			            type: "post",
			            dataType: "json", //리턴되는 값이 collection일때 사용
			            dataType: "text", //void도 text
			            data: {
			            	"${_csrf.parameterName}": "${_csrf.token}",
			                imp_uid: rsp.imp_uid
			                },
						success: function(done){
// 							alert("주문 및 결제가 완료되었습니다");
							//성공페이지에서 메세지 있어서 팝업 주석처리 함
						    //검증이후 페이지 이동:주문내역 페이지나 주문성공 페이지로 이동~~(1-1 : Orders컨트롤러의 마이페이지-주문내역출력 mapping url 또는 주문 성공 페이지)
							location.href="${pageContext.request.contextPath}/orders/orderSuccess";//&${_csrf.parameterName}=${_csrf.token}";
						}, //success end
						error: function(err){
							alert("3결제에 실패하였습니다");
							//삭제는 검증 메소드에서 진행(검증 실패시 이어지게)
						}//error end
						});//ajax end
					}//rsp.success end
					else{//(request,status,err)
// 						alert("2결제에 실패하였습니다.");
//							alert(rsp.error);
//							alert("code="+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+err);
						$.ajax({
							url: "${pageContext.request.contextPath}/orders/delete", //${pageContext.request.contextPath}
							type: "post", 
							dataType: "text",
							data: {ordersNo: rsp.merchant_uid,
			            	"${_csrf.parameterName}": "${_csrf.token}"
			            	}
						})//2실패 ajax끝
//							alert("2결제실패 ajax 끝");
						location.href="${pageContext.request.contextPath}/orders/orderFail";
					}//else end
				}); //rsp,IMPrequest_pay end
			}, //success end
			error : function(request,status,err){
				//주문 실패 메세지 연결용
				location.href="${pageContext.request.contextPath}/orders/orderFail";
// 				let msg = "1주문에 실패했습니다. 다시 주문해주세요.";
// 				alert(msg);
// 				alert("code="+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+err);
			}//error end
		}); //ajax end
	}) //#checkOutBtn 클릭동작 끝
	
})//$(function(){}) end
    
</script>
<script>
//////////////////////////////////////////////////////////////

function execDaumPostcode() {//주소지 API
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			console.log(data);
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            var totalAddr=addr+' '+extraAddr+' ';
            
			// 우편번호를 해당 필드에 넣는다.
            document.getElementById("ordersPostcode").value = data.zonecode;
            document.getElementById("ordersAddress").value = totalAddr;
            // 커서를 주소의 맨 뒤로 이동한다.
            document.getElementById("ordersAddress").focus();
            document.getElementById("ordersAddress").value = '';
            document.getElementById("ordersAddress").value = totalAddr;
            
            
        }
    }).open();
}//주소지API execDaumPostcode() end
////////////////////////////////////////////////////////////////////////////
</script>
</head>
<body>
<section class="cart">
  <h1>Order</h1>
        <div class="cart__information">
            <ul>
                <li>카카오 결제 서비스만 지원합니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
            </ul>
        </div>
        

        <table class="cart__list">   
     
                <thead>
                    <tr>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                	<c:when test="${not empty directOrder}">
                		 <tr class="cart__list__detail">
		                        <td><img src="${pageContext.request.contextPath}/save/shopImg/title/${directOrder.product.productMainImg}" alt="magic keyboard"></td>
		                        <td id="productCode"><a href="#">${directOrder.product.productCode}</a>
		                        <p><c:choose>
									<c:when test="${cookie.lang.value eq 'en'}">${directOrder.product.productEngName}</c:when>
									<c:otherwise>${directOrder.product.productName}</c:otherwise>
								</c:choose></p>
		         
		                        <td>
		                            <p>총 주문수량: <span>${directOrder.orderdetailsQty}</span>개</p>
		                        </td>
		                        <td>
									  <span class="price">${directOrder.orderdetailsPrice}</span><span>원</span>
		                        </td>
		                    </tr>
                	</c:when>

                	<c:otherwise>
		                <c:forEach items="${sessionScope.cartList}" var="cart" varStatus="state">
		                	 <tr class="cart__list__detail">
		                        <td><img src="${pageContext.request.contextPath}/save/shopImg/title/${cart.product.productMainImg}" alt="magic keyboard"></td>
		                        <td id="productCode"><a href="#">${cart.product.productCode}</a>
		                        <p><c:choose>
									<c:when test="${cookie.lang.value eq 'en'}">${cart.product.productEngName}</c:when>
									<c:otherwise>${cart.product.productName}</c:otherwise>
								</c:choose></p>
		         
		                        <td>
		                            <p>총 주문수량: <span>${cart.cartQty}</span>개</p>
		                        </td>
		                        <td>
									  <span class="price">${cart.cartPrice}</span><span>원</span>
		                        </td>
		                    </tr>
		                </c:forEach>
	                </c:otherwise>
                </c:choose>
                
                </tbody>
         		
        </table>
        <div class="payment">결제수단 카카오페이</div>
        <div class="total-price">총 결제금액 <span><span id="totalPrice"></span>원</span></div>
        
         <form name="orders" id="ordersForm" method="post">
        <div class="orderInfo-wrap">
        <h3 style="color: #f4a7bb; margin-bottom: 5px; margin-left: 100px;">주문정보</h3>
	        <div class="orderInfo">
	         <input type="text" name="ordersReceiverName" placeholder="주문자 이름" class="input_field">
	          <input type="text" name="ordersReceiverPhone" placeholder="주문자 전화번호" class="input_field">
	           <input type="text" name="ordersZipcode" id="ordersPostcode" placeholder="우편번호" class="input_field addr"><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="addrBtn">
<!-- 	           <button onclick="execDaumPostcode()" class="addrBtn">우편번호찾기</button> -->
	            <input type="text" name="ordersAddr" id="ordersAddress" placeholder="주소" class="input_field">
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	        <c:if test="${not empty directOrder}">
		        <input type="hidden" name="product.productCode" value="${directOrder.product.productCode}">
		        <input type="hidden" name="orderdetailsQty" value="${directOrder.orderdetailsQty}">
		        <input type="hidden" name="orderdetailsPrice" value="${directOrder.orderdetailsPrice}">
	        </c:if>
	        </div>
        </div>
        
        
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">취소</button>
            <input type="button" id="checkOutBtn" class="cart__bigorderbtn right" value="주문하기">
        </div>
        </form>
    </section>
</body>
</html>