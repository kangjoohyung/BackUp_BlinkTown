<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<sec:authentication property="principal" var="prc"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board/boardDetails.css">
</head>
<body>
	<section class="main">
		<div class="wrapper">
			<div class="left-col">
				<div class="post box">
					<div class="info moving-grad">
						<div class="user">
							<div class="profile-pic">
								<img
									src="${pageContext.request.contextPath}/img/board/blackpinkprofile.jfif"
									alt="">
							</div>
							<p class="username">${board.users.usersId}</p>
							<button class="board-delete" id="boardDelete">
								<i class="fi fi-br-cross"></i>
							</button>
						</div>
			
					</div>
					<img
						src="${pageContext.request.contextPath}/save/${board.boardImg}"
						class="post-image" alt="">
					<div class="post-content">
						<div class="reaction-wrapper">
						  <c:choose>
						    <c:when test="${not empty likes}">
						        <div class="heart is-active"></div>
						    </c:when>
						    <c:otherwise>
						        <div class="heart"></div>
						    </c:otherwise>
						  </c:choose>
							
							<p class="likes">
								<spring:message code="BoardLike"/> <span id="likesCount">${board.boardLikeNo}</span><spring:message code="EA"/>
							</p>
						</div>
						<p class="description">${board.boardContent}</p>
						<p class="post-time">${board.boardRegDate}</p>
					</div>
				</div>
			</div>

			<div class="right-col box">
				<div class="profile-card-wrap">
					<!-- 댓글양식 -->
					<div id="reply"></div>

					<!-- 댓글양식 -->

				</div>
				<div class="comment-wrapper">
					<img src="${pageContext.request.contextPath}/img/board/reply.png"
						class="icon" alt=""> <i class="fi fi-rr-comment-alt"></i> <input
						type="text" class="comment-box" placeholder=<spring:message code="BoardInputComments"/> id="replyContent" name="replyContent">
					<button class="comment-btn" type="submit" id="submitReply">post</button>
				</div>
		
		<script type="text/javascript">
		$(function(){
			
			$(document).ajaxSend(function(e, xhr, options) {
			       xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			  });
			 
			$('#submitReply').on("click", function(){
				var replyContent = $('#replyContent').val();
				var boardNo = ${board.boardNo};
				
				$.ajax({
					url : "${pageContext.request.contextPath}/reply/details/${board.boardNo}",
					type : "post",
					dataType : "json",
					data : {
						"replyContent" : replyContent
					},						
					success : function(reply) {							
						initReply();
						document.getElementById('replyContent').value=null; 					
					},
					error : function() {
						alert("댓글 등록 실패");	
					}		
				});
			});// 등록끝
	
			
			///////////////////////////////
			//댓글 로딩
			function initReply() {								
				$.ajax({
					url : "${pageContext.request.contextPath}/reply/select",
					type : "post",
					dataType :"json",
					data : {
						"boardNo" : ${board.boardNo}
					},					
					success : function(result) {
						let str="";
						$.each(result.replyList , function(index, item){
							str+='<div class="profile-card" >';
							str+="<div class='profile-pic'>"
							str+="<img src='${pageContext.request.contextPath}/img/board/userProfile.png' alt=''> </div>";
							str+='<div class="profile-text"><p class="username">'+result.nicList[index]+'</p>';	
							str+='<p class="sub-text">'+item.replyContent+'</p></div>';
							str+="<button class='action-btn' name='"+item.replyNo +"' value='"+result.usersList[index]+"'><i class='fi fi-br-cross'></i></button>";
							str+='</div>';
						})														
						$("#reply").html(str);
					},
					error : function() {
						alert("댓글가져오기를 실패했습니다.");	
					}
	
				});
			}			
			////////////////////////////////////////////////////////////
			
			//댓글삭제
			$(document).on("click","button[class=action-btn]", function(){
				if("${prc.usersId}" == $(this).val()){
					$.ajax({
						url : "${pageContext.request.contextPath}/reply/delete",
						type : "post",
						dataType :"text", // 서버에서 보내준 데이터타입
						data : {
							"replyNo" : $(this).attr("name"),
							"boardNo" : ${board.boardNo}
						},					
						success : function(result) {
							alert("댓글을 삭제했습니다.");
							initReply();
						},
						error : function() {
							alert("댓글 삭제에 실패했습니다(오류!)");
						}
	
					});
				}else{
					alert("댓글 작성자만 삭제할수 있습니다!");
				}
			})
			
			////////////////////////////////////////////////////////////
			
			//게시글 삭제하기
			$("#boardDelete").click(function(){				
				if("${prc.usersId}"== "${board.users.usersId}") {
				location.href = 
					'/board/delete?boardNo=${board.boardNo}';
					alert("게시글을 삭제했습니다")
				} else {
					alert("게시물 작성자가 일치하지 않아 삭제할 수 없습니다!")
				}
			});
							
			////////////////////////////////////////////////////////////
			initReply();	
		});//ready끝		
	</script>
			</div>
		</div>
	</section>

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

	<script type="text/javascript">
$(function() {
	  $(".heart").on("click", function() {
	     $(this).toggleClass("is-active");
	     
	     $.ajax({
				url : "${pageContext.request.contextPath}/board/likes",
				type : "post",
				dataType :"text", // 서버에서 보내준 데이터타입
				data : {
					"boardNo" : ${board.boardNo} ,
					"userId" : "${prc.usersId}"
				},					
				success : function(likesCount) {
					$("#likesCount").html(likesCount);
				},
				error : function() {
					alert("실패했습니다.......");
				}

			});
	  });
	});
</script>
</body>
</html>