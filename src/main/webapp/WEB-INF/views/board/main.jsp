<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board/boardMain.css">
</head>
<body>
	<div class="board-wrap">
		<!-- Hero -->
		<section class="et-hero-tabs">
			<div class="blackpink-board-wrap">
				<div class="blackpink-board" onclick="location.href='#tab-flexbox'">
					<img alt="" src="${pageContext.request.contextPath}/save/img/banner/board/boardbanner1.png" style="width: 100%; height: 100%;">
				</div>
				<div class="blackpink-board" onclick="location.href='#tab-react'">
					<img alt="" src="${pageContext.request.contextPath}/save/img/banner/board/boardbanner2.png" style="width: 100%; height: 100%;">
				</div>
				<div class="blackpink-board" onclick="location.href='#tab-angular'">
					<img alt="" src="${pageContext.request.contextPath}/save/img/banner/board/boardbanner3.png" style="width: 100%; height: 100%;">
				</div>
				<div class="blackpink-board" onclick="location.href='#tab-other'">
					<img alt="" src="${pageContext.request.contextPath}/save/img/banner/board/boardbanner4.png" style="width: 100%; height: 100%;">
				</div>
			</div>
			<div class="et-hero-tabs-container">
				<a class="et-hero-tab" href="#tab-es6"
					style="text-decoration: none;">BlackPink</a> <a class="et-hero-tab"
					href="#tab-flexbox" style="text-decoration: none;">Jisoo</a> <a
					class="et-hero-tab" href="#tab-react"
					style="text-decoration: none;">Jennie</a> <a class="et-hero-tab"
					href="#tab-angular" style="text-decoration: none;">Rose</a> <a
					class="et-hero-tab" href="#tab-other"
					style="text-decoration: none;">Lisa</a> <span
					class="et-hero-tab-slider"></span>
			</div>
		</section>

		<!-- Main -->
		<main class="et-main">
			<section class="et-slide" id="tab-es6">
				<div class="cover">
					<p class="first-parallel"></p>
				</div>
				<div class="et-slide-wrap">

					<h3>BLACKPINK</h3>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/boardInsertForm" class="moving-grad viewmore"
							style="color: #F8D8E3; text-decoration: none;">UPRODE</a>
					</sec:authorize>
					<div class="wrapper">
						<article class="flow">
							<div class="team">
								<ul class="auto-grid" role="list">
									<c:set var="doneLoop" value="false" />
									<c:forEach items="${mainPageList}" var="mainImage"
										varStatus="state">
										<c:if test="${state.count > 6}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										<c:if test="${not doneLoop}">
											<li><a
												href="${pageContext.request.contextPath}/board/details/${mainImage.boardNo}"
												style="color: #F8D8E3; text-decoration: none;"
												_blank " class="profile">
													<h3 class="profile__name">${mainImage.boardTitle}</h3> <img
													src="${pageContext.request.contextPath}/save/${mainImage.boardImg}">
											</a>
										</c:if>
										</li>
									</c:forEach>
								</ul>
							</div>
						</article>
					</div>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr>
									<th align="center"><spring:message code="BoardNumber"/></th>
									<th align="center"><spring:message code="BoardTitle"/></th>
									<th align="center"><spring:message code="BoardWriter"/></th>
									<th align="center"><spring:message code="BoardDate"/></th>
									<th align="center"><spring:message code="BoardComments"/></th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:choose>
									<c:when test="${empty mainPageList}">
										<tr>
											<td colspan="5">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 게시물이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${mainPageList}" var="mainBoard">
											<tr>
												<td>${mainBoard.boardNo}</td>
												<td><a
													href="${pageContext.request.contextPath}/board/details/${mainBoard.boardNo}"
													style="color: #ffffff; text-decoration: none;">${mainBoard.boardTitle}</a></td>
												<td>${mainBoard.users.usersId}</td>
												<td>${mainBoard.boardRegDate}</td>
												<td>${mainBoard.replyList.size()}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section class="et-slide" id="tab-flexbox">
				<div class="cover">
					<p class="second-parallel"></p>
				</div>
				<div class="et-slide-wrap">

					<h3>JISOO</h3>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/boardInsertForm" class="moving-grad viewmore"
							style="color: #F8D8E3; text-decoration: none;">UPRODE</a>
					</sec:authorize>
					<div class="wrapper">
						<article class="flow">
							<div class="team">
								<ul class="auto-grid" role="list">
									<c:set var="doneLoop" value="false" />
									<c:forEach items="${jisooList}" var="jisooImage"
										varStatus="state">
										<c:if test="${state.count > 6}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										<c:if test="${not doneLoop}">
											<li><a
												href="${pageContext.request.contextPath}/board/details/${jisooImage.boardNo}"
												style="color: #ffffff; text-decoration: none;"
												target="_blank " class="profile">
													<h3 class="profile__name">${jisooImage.boardTitle}</h3> <img
													src="${pageContext.request.contextPath}/save/${jisooImage.boardImg}">
											</a>
										</c:if>
										</li>
									</c:forEach>
								</ul>
							</div>
						</article>
					</div>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr>
									<th align="center"><spring:message code="BoardNumber"/></th>
									<th align="center"><spring:message code="BoardTitle"/></th>
									<th align="center"><spring:message code="BoardWriter"/></th>
									<th align="center"><spring:message code="BoardDate"/></th>
									<th align="center"><spring:message code="BoardComments"/></th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:choose>
									<c:when test="${empty jisooList}">
										<tr>
											<td colspan="5">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 게시물이 없습니다.</span></b>
												</p>
											</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:forEach items="${jisooList}" var="jisooBoard">
											<tr>
												<td>${jisooBoard.boardNo}</td>
												<td><a
													href="${pageContext.request.contextPath}/board/details/${jisooBoard.boardNo}"
													style="color: #ffffff; text-decoration: none;">${jisooBoard.boardTitle}</a></td>
												<td>${jisooBoard.users.usersId}</td>
												<td>${jisooBoard.boardRegDate}</td>
												<td>${jisooBoard.replyList.size()}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section class="et-slide" id="tab-react">
				<div class="cover">
					<p class="third-parallel"></p>
				</div>
				<div class="et-slide-wrap">

					<h3>JENNIE</h3>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/boardInsertForm" class="moving-grad viewmore"
							style="color: #F8D8E3; text-decoration: none;">UPRODE</a>
					</sec:authorize>
					<div class="wrapper">
						<article class="flow">
							<div class="team">
								<ul class="auto-grid" role="list">
									<c:set var="doneLoop" value="false" />
									<c:forEach items="${jennieList}" var="jennieImage"
										varStatus="state">
										<c:if test="${state.count > 6}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										<c:if test="${not doneLoop}">
											<li><a
												href="${pageContext.request.contextPath}/board/details/${jennieImage.boardNo}"
												style="color: #F8D8E3; text-decoration: none;"
												target="_blank " class="profile">
													<h3 class="profile__name">${jennieImage.boardTitle}</h3> <img
													src="${pageContext.request.contextPath}/save/${jennieImage.boardImg}">
											</a>
										</c:if>
										</li>
									</c:forEach>
								</ul>
							</div>
						</article>
					</div>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr>
									<th align="center"><spring:message code="BoardNumber"/></th>
									<th align="center"><spring:message code="BoardTitle"/></th>
									<th align="center"><spring:message code="BoardWriter"/></th>
									<th align="center"><spring:message code="BoardDate"/></th>
									<th align="center"><spring:message code="BoardComments"/></th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:choose>
									<c:when test="${empty jennieList}">
										<tr>
											<td colspan="5">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 게시물이 없습니다.</span></b>
												</p>
											</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:forEach items="${jennieList}" var="jennieBoard">
											<tr>
												<td>${jennieBoard.boardNo}</td>
												<td><a
													href="${pageContext.request.contextPath}/board/details/${jennieBoard.boardNo}"
													style="color: #ffffff; text-decoration: none;">${jennieBoard.boardTitle}</a></td>
												<td>${jennieBoard.users.usersId}</td>
												<td>${jennieBoard.boardRegDate}</td>
												<td>${jennieBoard.replyList.size()}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section class="et-slide" id="tab-angular">
				<div class="cover">
					<p class="forth-parallel"></p>
				</div>
				<div class="et-slide-wrap">

					<h3>ROSE</h3>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/boardInsertForm" class="moving-grad viewmore"
							style="color: #F8D8E3; text-decoration: none;">UPRODE</a>
					</sec:authorize>
					<div class="wrapper">
						<article class="flow">
							<div class="team">
								<ul class="auto-grid" role="list">
									<c:set var="doneLoop" value="false" />
									<c:forEach items="${roseList}" var="roseImage"
										varStatus="state">
										<c:if test="${state.count > 6}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										<c:if test="${not doneLoop}">
											<li><a
												href="${pageContext.request.contextPath}/board/details/${roseImage.boardNo} "
												style="color: #F8D8E3; text-decoration: none;"
												target="_blank " class="profile">
													<h3 class="profile__name">${roseImage.boardTitle}</h3> <img
													src="${pageContext.request.contextPath}/save/${roseImage.boardImg}">
											</a>
										</c:if>
										</li>
									</c:forEach>
								</ul>
							</div>
						</article>
					</div>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr>
									<th align="center"><spring:message code="BoardNumber"/></th>
									<th align="center"><spring:message code="BoardTitle"/></th>
									<th align="center"><spring:message code="BoardWriter"/></th>
									<th align="center"><spring:message code="BoardDate"/></th>
									<th align="center"><spring:message code="BoardComments"/></th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:choose>
									<c:when test="${empty roseList}">
										<tr>
											<td colspan="5">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 게시물이 없습니다.</span></b>
												</p>
											</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:forEach items="${roseList}" var="roseBoard">
											<tr>
												<td>${roseBoard.boardNo}</td>
												<td><a
													href="${pageContext.request.contextPath}/board/details/${roseBoard.boardNo}"
													style="color: #ffffff; text-decoration: none;">${roseBoard.boardTitle}</a></td>
												<td>${roseBoard.users.usersId}</td>
												<td>${roseBoard.boardRegDate}</td>
												<td>${roseBoard.replyList.size()}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section class="et-slide" id="tab-other">
				<div class="cover">
					<p class="hifth-parallel"></p>
				</div>
				<div class="et-slide-wrap">

					<h3>LISA</h3>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/boardInsertForm" class="moving-grad viewmore"
							style="color: #F8D8E3; text-decoration: none;">UPRODE</a>
					</sec:authorize>
					<div class="wrapper">
						<article class="flow">
							<div class="team">
								<ul class="auto-grid" role="list">
									<c:set var="doneLoop" value="false" />
									<c:forEach items="${lisaList}" var="lisaImage"
										varStatus="state">
										<c:if test="${state.count > 6}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										<c:if test="${not doneLoop}">
											<li><a
												href="${pageContext.request.contextPath}/board/details/${lisaImage.boardNo}"
												style="color: #F8D8E3; text-decoration: none;"
												target="_blank " class="profile">
													<h3 class="profile__name">${lisaImage.boardTitle}</h3> <img
													src="${pageContext.request.contextPath}/save/${lisaImage.boardImg}">
											</a>
										</c:if>
										</li>
									</c:forEach>
								</ul>
							</div>
						</article>
					</div>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr>
									<th align="center"><spring:message code="BoardNumber"/></th>
									<th align="center"><spring:message code="BoardTitle"/></th>
									<th align="center"><spring:message code="BoardWriter"/></th>
									<th align="center"><spring:message code="BoardDate"/></th>
									<th align="center"><spring:message code="BoardComments"/></th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:choose>
									<c:when test="${empty lisaList}">
										<tr>
											<td colspan="5">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 게시물이 없습니다.</span></b>
												</p>
											</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:forEach items="${lisaList}" var="lisaBoard">
											<tr>
												<td>${lisaBoard.boardNo}</td>
												<td><a
													href="${pageContext.request.contextPath}/board/details/${lisaBoard.boardNo}"
													style="color: #ffffff; text-decoration: none;">${lisaBoard.boardTitle}</a></td>
												<td>${lisaBoard.users.usersId}</td>
												<td>${lisaBoard.boardRegDate}</td>
												<td>${lisaBoard.replyList.size()}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
class StickyNavigation {
	
	constructor() {
		this.currentId = null;
		this.currentTab = null;
		this.tabContainerHeight = 70;
		let self = this;
		$('.et-hero-tab').click(function() { 
			self.onTabClick(event, $(this)); 
		});
		$(window).scroll(() => { this.onScroll(); });
		$(window).resize(() => { this.onResize(); });
	}
	
	onTabClick(event, element) {
		event.preventDefault();
		let scrollTop = $(element.attr('href')).offset().top - this.tabContainerHeight + 1;
		$('html, body').animate({ scrollTop: scrollTop }, 600);
	}
	
	onScroll() {
		this.checkTabContainerPosition();
    this.findCurrentTabSelector();
	}
	
	onResize() {
		if(this.currentId) {
			this.setSliderCss();
		}
	}
	
	checkTabContainerPosition() {
		let offset = $('.et-hero-tabs').offset().top + $('.et-hero-tabs').height() - this.tabContainerHeight;
		if($(window).scrollTop() > offset) {
			$('.et-hero-tabs-container').addClass('et-hero-tabs-container--top');
		} 
		else {
			$('.et-hero-tabs-container').removeClass('et-hero-tabs-container--top');
		}
	}
	
	findCurrentTabSelector(element) {
		let newCurrentId;
		let newCurrentTab;
		let self = this;
		$('.et-hero-tab').each(function() {
			let id = $(this).attr('href');
			let offsetTop = $(id).offset().top - self.tabContainerHeight;
			let offsetBottom = $(id).offset().top + $(id).height() - self.tabContainerHeight;
			if($(window).scrollTop() > offsetTop && $(window).scrollTop() < offsetBottom) {
				newCurrentId = id;
				newCurrentTab = $(this);
			}
		});
		if(this.currentId != newCurrentId || this.currentId === null) {
			this.currentId = newCurrentId;
			this.currentTab = newCurrentTab;
			this.setSliderCss();
		}
	}
	
	setSliderCss() {
		let width = 0;
		let left = 0;
		if(this.currentTab) {
			width = this.currentTab.css('width');
			left = this.currentTab.offset().left;
		}
		$('.et-hero-tab-slider').css('width', width);
		$('.et-hero-tab-slider').css('left', left);
	}
	
}

new StickyNavigation();
</script>

	<script type="text/javascript">
const pTag1 = document.querySelector('.first-parallel')
const pTag2 = document.querySelector('.second-parallel')
const pTag3 = document.querySelector('.third-parallel')
const pTag4 = document.querySelector('.forth-parallel')
const pTag5 = document.querySelector('.hifth-parallel')

const textArr1 = ' BLACKPINK IN YOUR AREA  BLACKPINK IN YOUR AREA  BLACKPINK IN YOUR AREA'.split(' ')
const textArr2 = ' JISOO IN YOUR AREA  JISOO IN YOUR AREA  JISOO IN YOUR AREA'.split(' ')
const textArr3 = ' JENNIE IN YOUR AREA  JENNIE IN YOUR AREA  JENNIE IN YOUR AREA'.split(' ')
const textArr4 = ' ROSE IN YOUR AREA  ROSE IN YOUR AREA  ROSE IN YOUR AREA'.split(' ')
const textArr5 = ' LISA IN YOUR AREA  LISA IN YOUR AREA  LISA IN YOUR AREA'.split(' ')

let count1 = 0
let count2 = 0
let count3 = 0
let count4 = 0
let count5 = 0

initTexts(pTag1, textArr1)
initTexts(pTag2, textArr2)
initTexts(pTag3, textArr3)
initTexts(pTag4, textArr4)
initTexts(pTag5, textArr5)

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
  count5++

  count1 = marqueeText(count1, pTag1, -1)
  count2 = marqueeText(count2, pTag2, -1)
  count3 = marqueeText(count3, pTag3, -1)
  count4 = marqueeText(count4, pTag4, -1)
  count5 = marqueeText(count5, pTag5, -1)

  window.requestAnimationFrame(animate)
}

function scrollHandler() {
  count1 += 15
  count2 += 15
  count3 += 15
  count4 += 15
  count5 += 15
}

window.addEventListener('scroll', scrollHandler)
animate()
</script>
</body>
</html>