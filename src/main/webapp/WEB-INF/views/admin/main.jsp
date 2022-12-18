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
	href="${pageContext.request.contextPath}/css/admin/adminMain.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>
</head>
<body id="body">
<div class="tabs-wrap">
	<ul class="tabs">
	  <li class="active" rel="tab1" id="usersTab1">Users</li>
	  <li rel="tab2" id="shopTab">Shop</li>
	  <li rel="tab3" id="ordersTab3">Order</li>
	  <li rel="tab4" id="statsTab4">Chart</li>
	</ul>
	<div class="tab_container">
	  <h3 class="d_active tab_drawer_heading" rel="tab1">Tab 1</h3>
	  <div id="tab1" class="tab_content">
		<div class="users_chart">
					<div class="card">
						<!-- Custom information -->
						<div class="about">
							<h3>Member</h3>
							<p class="lead">Membership Trend</p>
						</div>

						<!-- Canvas for Chart.js -->
						<canvas id="canvas" height="200"></canvas>

						<!-- Custom tooltip canvas -->
						<canvas id="tooltip-canvas" width="150" height="100"></canvas>

					</div>
					<div class="users_chart02">
						<div class="user-tab">

							<ul class="user-tabs ">
								<li id="allUsersTab"><a href="#">All Member</a></li>
								<li id="normalUsersTab"><a href="#">Free Member</a></li>
								<li id="memberUsersTab"><a href="#">Registered Member</a></li>
							</ul>
							<!-- / tabs -->

							<div class="user-tab_content">

								<div class="user-tabs_item">
									<div class="tbl-header">
										<table cellpadding="0" cellspacing="0" border="0">
											<thead>
												<tr>
													<th style="width: 30%;">ID</th>
													<th style="width: 13%;">Phone</th>
													<th style="width: 20%;">E-mail</th>
													<th style="width: 15%;">Nickname</th>
													<th style="width: 4%;">M</th>
													<th style="width: 13%;">JoinDate</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="tbl-content">
										<table cellpadding="0" cellspacing="0" border="0">
											<tbody class="usersListTable">
<!-- 												<tr class="usersListTableSub"> -->
<!-- 													<td style="width: 30%;">sydy8995@gmail.com_abcdefghgfgfdsfsd</td> -->
<!-- 													<td style="width: 13%;">010-0000-000</td> -->
<!-- 													<td style="width: 20%;">comzaxxer@naver.com</td> -->
<!-- 													<td style="width: 15%;">springboot</td> -->
<!-- 													<td style="width: 4%;">N</td> -->
<!-- 													<td style="width: 13%;">2022-01-05</td> -->
<!-- 												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
								<!-- / tabs_item -->

								<div class="user-tabs_item">
									<div class="tbl-header">
										<table cellpadding="0" cellspacing="0" border="0">
											<thead>
												<tr>
													<th style="width: 30%;">ID</th>
													<th style="width: 13%;">Phone</th>
													<th style="width: 20%;">E-mail</th>
													<th style="width: 15%;">Nickname</th>
													<th style="width: 4%;">M</th>
													<th style="width: 13%;">JoinDate</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="tbl-content">
										<table cellpadding="0" cellspacing="0" border="0">
											<tbody class="usersListTable">
<!-- 												<tr> -->
<!-- 													<td style="width: 30%;">sydy8995@gmail.com_abcdefghgfgfdsfsd</td> -->
<!-- 													<td style="width: 13%;">010-0000-000</td> -->
<!-- 													<td style="width: 20%;">comzaxxer@naver.com</td> -->
<!-- 													<td style="width: 15%;">springboot</td> -->
<!-- 													<td style="width: 4%;">N</td> -->
<!-- 													<td style="width: 13%;">2022-01-05</td> -->
<!-- 												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
								<!-- / tabs_item -->

								<div class="user-tabs_item">
									<div class="tbl-header">
										<table cellpadding="0" cellspacing="0" border="0">
											<thead >
												<tr>
													<th style="width: 30%;">ID</th>
													<th style="width: 13%;">Phone</th>
													<th style="width: 20%;">E-mail</th>
													<th style="width: 15%;">Nickname</th>
													<th style="width: 4%;">M</th>
													<th style="width: 13%;">JoinDate</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="tbl-content">
										<table cellpadding="0" cellspacing="0" border="0">
											<tbody class="usersListTable">
<!-- 												<tr> -->
<!-- 													<td style="width: 30%;">sydy8995@gmail.com_abcdefghgfgfdsfsd</td> -->
<!-- 													<td style="width: 13%;">010-0000-000</td> -->
<!-- 													<td style="width: 20%;">comzaxxer@naver.com</td> -->
<!-- 													<td style="width: 15%;">springboot</td> -->
<!-- 													<td style="width: 4%;">N</td> -->
<!-- 													<td style="width: 13%;">2022-01-05</td> -->
<!-- 												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
								<!-- / tabs_item -->

							</div>
							<!-- / tab_content -->
						</div>
						<!-- / tab -->
					</div>
				</div>
	  </div>

	  <!-- #tab1 -->



			<h3 class="tab_drawer_heading" rel="tab2">Tab 2</h3>
			<div id="tab2" class="tab_content">
			<form action="/admin/insertForm">
				<button class="insert-btn" type="submit">상품등록</button>				
				<select  class="insert-select"  name="category">
					<option selected="selected" value="Category">Category</option>
					<option value="A">Album</option>
					<option value="G">Goods</option>
				</select>
			</form>
			
				<div class="tbl-header" style="clear: both;">
					<table cellpadding="0" cellspacing="0" border="0">
						<thead>
							<tr>
								<th style="width: 10%;">상품코드</th>
								<th style="width: 25%;">상품명</th>
								<th style="width: 15%;">가격</th>
								<th style="width: 10%;">재고</th>
								<th style="width: 15%;">등록일</th>
								<th style="width: 15%;">삭제</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tbl-content">
					<table cellpadding="0" cellspacing="0" border="0">
					<tbody id="productList">
					</tbody>
					</table>
				</div>
			</div>
			<!-- #tab2 -->


			<h3 class="tab_drawer_heading" rel="tab3">Tab 3</h3>			
			<div id="tab3" class="tab_content">
			<br><br>
			<div class="tbl-header" style="clear: both;">
					<table cellpadding="0" cellspacing="0" border="0">
						<thead>
							<tr>
								<th style="width: 12%;">주문번호</th>
								<th style="width: 13.5%;">주문날짜</th>
								<th style="width: 13%;">아이디</th>
								<th style="width: 12.5%;">이름</th>
								<th style="width: 12%;">전화번호</th>
								<th style="width: 37%;">주소지</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tbl-content" >
					<table cellpadding="0" cellspacing="0" border="0">
						<tbody id="ordersList">
						</tbody>
					</table>
				</div>
			</div>
			<!-- #tab3 -->
	  
	  
	  <h3 class="tab_drawer_heading" rel="tab4">Tab 4</h3>
	  <div id="tab4" class="tab_content">
	  
	  <!-- 전체매출조회 -->
	  <div class="Sales-check">
	  	<div>
	  		<h1 style="margin-bottom: 20px;" class="neon">전체매출 : <span id="allStats"></span> 원</h1>
	  	</div>
	  </div>
	  <!-- 월별매출조회 -->
	  	<div class="sales-wrap">
	  		<div class="card-monthlySales">
				  <!-- Custom information -->
				  <div class="about-monthlySales" style="height: 100px;">
				    <h3>월별매출조회</h3>
				    <p class="lead-monthlySales">Monthly Sales Trend</p>
				  </div>
				  
				  <!-- Canvas for Chart.js -->
				  <div id="canvas-month-div">
<%-- 				  <canvas id="canvas-monthlySales"></canvas> --%>
				  </div>
				  
				  <!-- Custom Axis -->
				  <div class="axis-monthlySales" id="monthStats">
<!-- 				    <div class="tick-monthlySales" id="monthStatsSub"> -->
<!-- 				      <span class="day-number-monthlySales">1</span> -->
<!-- 				      <span class="day-name-monthlySales">Jan</span> -->
<!-- 				      <span class="value-monthlySales value--this-monthlySales">00장</span> -->
<!-- 				    </div> -->
				  </div>
				</div>	  	
	  	<!-- 월별매출끝 -->
	  		
	  		
	  	<!-- 앨범별매출 -->
	  	<div class="card-monthlySales card-AlbumSales">
	  	<!-- Custom information -->
				  <div class="about-monthlySales" style="height: 0px;">
				    <h3>앨범매출조회</h3>
				    <p class="lead-monthlySales">Album Sales Trend</p>
				  </div>
				  
				  <div class="canvas-AlbumSales-wrap">
				  <!-- Canvas for Chart.js -->
				  <canvas id="canvas-AlbumSales"></canvas>
				  </div>
	  	</div>
	  	<!-- 앨범별매출 -->
	  </div>
	  <!-- #tab4 --> 
	  
	  </div>
	</div>
	<!-- .tab_container -->
</div>
<script type="text/javascript">
//tabbed content
// http://www.entheosweb.com/tutorials/css/tabs.asp
$(".tab_content").hide();
$(".tab_content:first").show();

/* if in tab mode */
$("ul.tabs li").click(function() {
	
  $(".tab_content").hide();
  var activeTab = $(this).attr("rel"); 
  $("#"+activeTab).fadeIn();		
	
  $("ul.tabs li").removeClass("active");
  $(this).addClass("active");

  $(".tab_drawer_heading").removeClass("d_active");
  $(".tab_drawer_heading[rel^='"+activeTab+"']").addClass("d_active");
  
});
/* if in drawer mode */
$(".tab_drawer_heading").click(function() {
  
  $(".tab_content").hide();
  var d_activeTab = $(this).attr("rel"); 
  $("#"+d_activeTab).fadeIn();
  
  $(".tab_drawer_heading").removeClass("d_active");
  $(this).addClass("d_active");
  
  $("ul.tabs li").removeClass("active");
  $("ul.tabs li[rel^='"+d_activeTab+"']").addClass("active");
});


/* Extra class "tab_last" 
   to add border to right side
   of last tab */
$('ul.tabs li').last().addClass("tab_last");

</script>
<script type="text/javascript">
var canvas = document.getElementById("canvas");
var tooltipCanvas = document.getElementById("tooltip-canvas");

var gradientBlue = canvas.getContext('2d').createLinearGradient(0, 0, 0, 150);
gradientBlue.addColorStop(0, '#5555FF');
gradientBlue.addColorStop(1, '#9787FF');

var gradientRed = canvas.getContext('2d').createLinearGradient(0, 0, 0, 150);
gradientRed.addColorStop(0, '#FF55B8');
gradientRed.addColorStop(1, '#FF8787');

var gradientGrey = canvas.getContext('2d').createLinearGradient(0, 0, 0, 150);
gradientGrey.addColorStop(0, '#888888');
gradientGrey.addColorStop(1, '#AAAAAA');

window.arcSpacing = 0.15;
window.segmentHovered = false;

function textInCenter(value, label) {
  var ctx = tooltipCanvas.getContext('2d');
  ctx.clearRect(0, 0, tooltipCanvas.width, tooltipCanvas.height)
  
	ctx.restore();
    
  // Draw value
  ctx.fillStyle = '#333333';
  ctx.font = '24px sans-serif';
  ctx.textBaseline = 'middle';

  // Define text position
  var textPosition = {
    x: Math.round((tooltipCanvas.width - ctx.measureText(value).width) / 2),
    y: tooltipCanvas.height / 2,
  };

  ctx.fillText(value, textPosition.x, textPosition.y);

  // Draw label
  ctx.fillStyle = '#AAAAAA';
  ctx.font = '8px sans-serif';

  // Define text position
  var labelTextPosition = {
    x: Math.round((tooltipCanvas.width - ctx.measureText(label).width) / 2),
    y: tooltipCanvas.height / 2,
  };

  ctx.fillText(label, labelTextPosition.x, labelTextPosition.y - 20);
  ctx.save();
}

Chart.elements.Arc.prototype.draw = function() {
  var ctx = this._chart.ctx;
  var vm = this._view;
  var sA = vm.startAngle;
  var eA = vm.endAngle;

  ctx.beginPath();
  ctx.arc(vm.x, vm.y, vm.outerRadius, sA + window.arcSpacing, eA - window.arcSpacing);
  ctx.strokeStyle = vm.backgroundColor;
  ctx.lineWidth = vm.borderWidth;
  ctx.lineCap = 'round';
  ctx.stroke();
  ctx.closePath();
};
/////////////////////////////////////////////////////////
//var config (회원수 카운트 동그란 챠트) 자리

</script>

<script type="text/javascript">
$(document).ready(function() { 

	(function ($) { 
		$('.user-tab ul.user-tabs').addClass('active').find('> li:eq(0)').addClass('current');
		
		$('.user-tab ul.user-tabs li a').click(function (g) { 
			var tab = $(this).closest('.user-tab'), 
				index = $(this).closest('li').index();
			
			tab.find('ul.user-tabs > li').removeClass('current');
			$(this).closest('li').addClass('current');
			
			tab.find('.user-tab_content').find('div.user-tabs_item').not('div.user-tabs_item:eq(' + index + ')').slideUp();
			tab.find('.user-tab_content').find('div.user-tabs_item:eq(' + index + ')').slideDown();
			
			g.preventDefault();
		} );
	})(jQuery);

});
</script>

<!-- 설정 자리 -->
<script>

</script>

<!-- 회원목록(첫화면)+집계count -->
<script type="text/javascript">

var usersListUrl="${pageContext.request.contextPath}/admin/usersList/all";

$(function(){
	$(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
    });
	//url구분용 변수 선언(기본값 전체 목록)
	usersListCount();
	
	$("#usersTab1").click(function(){
		usersListUrl="${pageContext.request.contextPath}/admin/usersList/all";
		usersListCount();
	})
	$("#allUsersTab").click(function(){
		usersListUrl="${pageContext.request.contextPath}/admin/usersList/all";
		usersListCount();
	})
	$("#normalUsersTab").click(function(){
		usersListUrl="${pageContext.request.contextPath}/admin/usersList/normal";
		usersListCount();
	})
	$("#memberUsersTab").click(function(){
		usersListUrl="${pageContext.request.contextPath}/admin/usersList/member";
		usersListCount();
	})
})//$(function(){}) end
////////////////////////////////////////////////
//호출함수 : 주문목록+count ajax출력
//url 가변적 조건줄수있게 변수로 사용
function usersListCount() {
// 	alert(usersListUrl);
	$.ajax({ 
		  url : usersListUrl, 
		  type : "post", 
		  dataType : "json",
		  success : function(result){
// 			  alert(result.usersList);
			  //주문목록 출력
			let str="";  
			  $(".usersListTableSub").remove();
		  	$.each(result.usersList, function(index, users){
		  		str+='<tr class=usersListTableSub>';
		  		str+='<td style="width: 30%;">'+users.usersId+'</td>';
		  		str+='<td style="width: 13%;">'+users.usersPhone+'</td>';
		  		str+='<td style="width: 20%;">'+users.usersEmail+'</td>';
		  		str+='<td style="width: 15%;">'+users.usersNickName+'</td>';
		  		if(users.usersMemberShip==0) str+='<td style="width: 4%;">'+"N"+'</td>';
		  		else if(users.usersMemberShip==1) str+='<td style="width: 4%;">'+"Y"+'</td>';
		  		str+='<td style="width: 13%;">'+users.usersRegDate+'</td>';
				str+='</tr>';
		  	});
		  	$(".usersListTable").html(str);
		  	////////////////////////////////////////////////////////////////////////
		  	//차트 자리
		  	var config = {
		  		    type: 'doughnut',
		  		    data: {
		  		        labels: ['Registered Member' , 'Free Member'],
		  		        datasets: [
		  		          {
		  		              data: [result.normalCount, result.memberCount],
		  		              backgroundColor: [
		  		              	gradientRed,
		  		                gradientBlue,
		  		              ],
		  		          }
		  		        ]
		  		    },
		  		    options: {
		  		    		cutoutPercentage: 80,
		  		    		elements: {
		  		        	arc: {
		  		          	borderWidth: 12,
		  		          },
		  		        },
		  		        legend: {
		  		        	display: false,
		  		        },
		  		        animation: {
		  		        	onComplete: function(animation) {
		  		          	if (!window.segmentHovered) {
		  		              var value = this.config.data.datasets[0].data.reduce(function(a, b) { 
		  		                return a + b;
		  		              }, 0);
		  		              var label = 'T O T A L';

		  		              textInCenter(value, label);
		  		            }
		  		          },
		  		        },
		  		        tooltips: {
		  		        	enabled: false,
		  		        	custom: function(tooltip) {
		  		          	if (tooltip.body) {
		  		              var line = tooltip.body[0].lines[0],
		  		              	parts = line.split(': ');
		  		              textInCenter(parts[1], parts[0].split('').join(' ').toUpperCase());
		  		              window.segmentHovered = true;
		  		            } else {
		  		            	window.segmentHovered = false;
		  		            }
		  		          },
		  		        },
		  		    },
		  		};//var config(회원수 카운트 챠트) end

		  		window.chart = new Chart(canvas, config);
		  }, 
		  error : function(request,status,err){//에러 : 보통 콜백함수
//			  alert("code="+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+err);	  
		  } 
	  })//ajax끝
}//usersListCount(){} end
</script>

<!-- 주문목록 리스트 -->
<script>
$(function(){
	$(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
    });
	$("#ordersTab3").click(function(){
// 		alert("#ordersTab3 click");
		$.ajax({ 
			  url : "${pageContext.request.contextPath}/admin/ordersList", 
			  type : "post", 
			  dataType : "json",
			  success : function(result){
// 				  alert("클릭성공");
				let str="";  
				$(".ordersListSub").remove();
			  	$.each(result, function(index, orders){
			  		str+='<tr class=ordersListSub>';
			  		str+='<td style="width: 12%;">'+orders.ordersNo+'</td>';
			  		str+='<td style="width: 13.5%;">'+orders.ordersDate+'</td>';
			  		str+='<td style="width: 13%;">'+orders.users.usersId+'</td>';
			  		str+='<td style="width: 12.5%;">'+orders.ordersReceiverName+'</td>';
			  		str+='<td style="width: 12%;">'+orders.ordersReceiverPhone+'</td>';
			  		str+='<td style="width: 37%;">'+orders.ordersAddr+'</td>';
			  		str+='</tr>';
			  	});
			  	$("#ordersList").html(str);
			  }, 
			  error : function(request,status,err){//에러 : 보통 콜백함수
// 				  alert("code="+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+err);	  
			  } 
		  })//ajax끝
	})//#ordersTab3 click end

	$("#shopTab").click(function() {
		$.ajax({ 
			  url : "${pageContext.request.contextPath}/shop/select", 
			  type : "post",
			  dataType : "json",
			  success : function(result){
				  console.log(result);
					let str = '';
					$.each(result.content, function(index, res) {
						str += '<tr><td style="width: 10%;">'+res.productCode+'</td>';
						str += '<td style="width: 25%;"><a href="${pageContext.request.contextPath}/admin/updateForm?productCode='+res.productCode+'">'+res.productName +"["+ res.productEngName+"]"+'</a></td>';
						str += '<td style="width: 15%;">'+res.productPrice+'</td>';
						str += '<td style="width: 10%;">'+res.productStock+'</td>';
						str += '<td style="width: 15%;">'+res.productRegDate+'</td>';
						str += '<td style="width: 15%;"><button class="deleteBtn"  onclick="deleteProduct(this); return false;">삭제</button></td></tr>';
						
					});
				
			  	$("#productList").html(str);
			  },
			  error: function(request, status, error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
			  } 
		  });
	});
   
   
});//첫function end

function deleteProduct(ele) {
	//alert(1);
	let productCode = $(ele).parent().prev().prev().prev().prev().prev().text();
	location.href='${pageContext.request.contextPath}/shop/delete?productCode='+productCode;
}
</script>

<!-- 매출 데이터 ajax로 불러오기(변수에 담아 아래 챠트에 넣을 예정) -->
<script>

var squareUp1;
var squareUp2;
var killThisLove1;
var killThisLove2;
var theAlbum1;
var theAlbum2;
var bornPink1;
var bornPink2;

$(function(){
	$(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
    });
	$("#statsTab4").click(function(){
// 		alert("#statsTab4 click");
		$.ajax({ 
			  url : "${pageContext.request.contextPath}/admin/statsChart", 
			  type : "post", 
			  dataType : "json",
			  success : function(result){
// 				  alert("클릭성공");
// 				alert(result.monthStats[0].month);//출력확인 list
// 				alert(result.bornPink.albumTotalQty);//출력확인 앨범별로 다 있음
				
				var allStats=result.allStats.totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#allStats").html(allStats);
				let str="";  
				$("#canvas-monthlySales").remove();
				$('#monthStatsSub').remove();
			  	$.each(result.monthStats, function(index, results){
			  		str+='<div class="tick-monthlySales" id="monthStatsSub">';
			  		str+='<span class="day-number-monthlySales">'+results.month+'</span>';
			  		str+='<span class="day-name-monthlySales">'+(index+1)+'</span>';
			  		str+='<span class="value-monthlySales value--this-monthlySales">'+results.totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원"+'</span>';
					str+='</div>';
			  	});
			  	let str2="";
			  	str2='<canvas id="canvas-monthlySales"></canvas>';
			  	$("#canvas-month-div").html(str2);
			  	$("#monthStats").html(str);
	////////////////////////////////////////////////////////////////////////////////////////////////////
				//월별매출 설정
				var canvas = document.getElementById("canvas-monthlySales");

				
				//Apply multiply blend when drawing datasets
				var multiply = {
				beforeDatasetsDraw: function(chart, options, el) {
				 chart.ctx.globalCompositeOperation = 'multiply';
				},
				afterDatasetsDraw: function(chart, options) {
				 chart.ctx.globalCompositeOperation = 'source-over';
				},
				};

				//Gradient color - this week
				var gradientThisWeek = canvas.getContext('2d').createLinearGradient(0, 0, 0, 150);
				gradientThisWeek.addColorStop(0, '#5555FF');
				gradientThisWeek.addColorStop(1, '#9787FF');

				//Gradient color - previous week
				var gradientPrevWeek = canvas.getContext('2d').createLinearGradient(0, 0, 0, 150);
				gradientPrevWeek.addColorStop(0, '#FF55B8');
				gradientPrevWeek.addColorStop(1, '#FF8787');

	////////////////////////////////////////////////////////////////////////////////////////////////////
				//월별 매출 조회
				var config = {
				type: 'line',
				data: {
					labels:
						result.months,
				     datasets: [
				       {
				           label: 'Temperature',
				           data: result.prices,
				           fill: false,
				           borderColor: 'rgba(255, 255, 255, 0.2)',
				           borderWidth: 2,
				           pointBackgroundColor: 'transparent',
				           pointBorderColor: '#FFFFFF',
				           pointBorderWidth: 3,
				           pointHoverBorderColor: 'rgba(255, 255, 255, 0.2)',
				           pointHoverBorderWidth: 10,
				           lineTension: 0,
				       }
				     ]
				 },
				 options: {
				 	responsive: false,
				   elements: { 
				     point: {
				       radius: 6,
				       hitRadius: 6, 
				       hoverRadius: 6 
				     } 
				   },
				   legend: {
				     display: false,
				   },
				   tooltips: {
				   	backgroundColor: 'transparent',
				     displayColors: false,
				     bodyFontSize: 14,
				     callbacks: {
				       label: function(tooltipItems, data) { 
				         return tooltipItems.yLabel + '원';
				       }
				     }
				   },
				   scales: {
				     xAxes: [{
				       display: false,
				     }],
				     yAxes: [{
				       display: false,
				       ticks: {
				         beginAtZero: true,
				       },
				     }]
				   }
				 },
				 plugins: [multiply],
				};
				
				window.chart = new Chart(canvas, config);
	////////////////////////////////////////////////////////////////////////////////////////////////////
							
				//앨범 매출 조회
				var bar = document.getElementById('canvas-AlbumSales');
				bar.height = 400
				var barConfig = new Chart(bar, {
				    type: 'horizontalBar',
				    data: {
				        labels: ['BornPink', 'THEALBUM', 'KillThisLove', 'SquareUp'],
// 				        	, 'sample'],
				        datasets: [{
				        	label : '앨범 판매 수량',
							data :
							[	result.bornPink.albumTotalQty,
								result.theAlbum.albumTotalQty,
								result.killThisLove.albumTotalQty,
								result.squareUp.albumTotalQty],
// 								, 3],
					            backgroundColor: ['#ffffff80','#ffffff80','#ffffff80','#ffffff80','#ffffff80'],
					            borderWidth: 1
					        }]
				    },
				    options: {
				    	
				        scales: {
				            xAxes: [{
				                ticks: {
				                    beginAtZero: true,
				                }
				            }]
				        },
				        legend: {
				            display: false,
				          },
				        responsive: true, // Instruct chart js to respond nicely.
				        maintainAspectRatio: false, // Add to prevent default behaviour of full-width/height 
				    }
				})//앨범매출(var barConfig) 챠트 끝
			  }, 
			  error : function(request,status,err){//에러 : 보통 콜백함수
// 				  alert("code="+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+err);	  
			  } 
		  })//ajax끝
	})//#statsTab4 click end

})//첫function end
</script>

<!-- 월별매출 -ajax 칸으로 이동(var config) -->
<script type="text/javascript">
//설정들
//var config
</script>

<!-- 앨범매출 var barConfig 자리-->
<script type="text/javascript">

</script>
</body>
</html>