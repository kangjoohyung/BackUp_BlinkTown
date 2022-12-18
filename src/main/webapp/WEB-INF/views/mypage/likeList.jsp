<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage/likeList.css">
</head>
<body>
	<div class="likeList-wrap box">
		<div class="userInfo-title">내가 좋아한 게시물</div>
		<div class="wrapper">
			<article class="flow">
				<div class="team">
				<c:choose>
					    <c:when test="${empty likesList}">
				
					            <div class="userInfo-title" style="color: #ffffff; font-size: 18px;">좋아요 표시한 게시물이 없습니다.</div>
						    
					    </c:when>	
						<c:otherwise>	
					<ul class="auto-grid" role="list">					
													
						<c:set var="doneLoop" value="false"/>									 
						<c:forEach items="${likesList}" var="likesImage" varStatus="state">
							    <c:if test="${state.count > 20}"> <!-- 좋아요 보여지는 갯수 여기서 변경 -->
							       <c:set var="doneLoop" value="true"/>
							    </c:if> 
							    <c:if test="${not doneLoop}" >
							    <li>
							    <a href="${pageContext.request.contextPath}/board/details/${likesImage.boardNo}"
							    target="_blank " class="profile">
							 
						           <img src="${pageContext.request.contextPath}/save/${likesImage.boardImg}">
						        </a>  
						        </c:if>		
					           </li>
						</c:forEach> 
						</c:otherwise>
						</c:choose>    
					</ul>
				</div>
			</article>
		</div>

	</div>
</body>
</html>