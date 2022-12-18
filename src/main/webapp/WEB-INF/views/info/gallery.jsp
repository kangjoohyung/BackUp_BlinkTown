<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
 background-color: #000000;
 width: 100%;
 height: 100%;
 margin: 0px;
}
.content-wrap {
	width: 1300px;
	margin: 0 auto;
	color: #ffffff;
	 background-color: #000000;
}

.content-col {
	width: inherit;
	margin: 0 auto;
	padding: 0px 0px 125px 0px;
	color: #ffffff;
	overflow: hidden;
}

.column {
	width: 320px;
	height: 180px;
	margin-left: 5px;
	margin-bottom: 5px;
	background-color: red;
	float: left;
}
.title{
	padding-top:100px;
	font-size: 45px;
	font-weight: 900;
	margin-bottom: 5px;
	padding-left: 140px;
}
.title> span:nth-child(2) {
	color: #f4a7bb;
}
.neon {
  color: #fff;
  text-shadow:
    0 0 5px #FF316680,
    0 0 10px #FF316680,
    0 0 20px #FF316680,
    0 0 40px #FF316680,
    0 0 80px #FF316680,
    0 0 90px #FF316680,
    0 0 100px #FF316680,
    0 0 150px #FF316680;
}
:root {
  --d: 700ms;
  --e: cubic-bezier(0.19, 1, 0.22, 1);
  --font-sans: "Rubik", sans-serif;
  --font-serif: "Cardo", serif;
}

.page-content {
  display: grid;
  grid-gap: 1rem;
  padding: 1rem;
  max-width: 1024px;
  margin: 0 auto;
  font-family: var(--font-sans);
}

@media (min-width: 600px) {
  .page-content {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (min-width: 800px) {
  .page-content {
    grid-template-columns: repeat(4, 1fr);
  }
}

.card {
  background-size:cover;
  position: relative;
  display: flex;
  align-items: flex-end;
  overflow: hidden;
  padding: 1rem;
  width: 100%;
  text-align: center;
  color: whitesmoke;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1), 0 2px 2px rgba(0, 0, 0, 0.1), 0 4px 4px rgba(0, 0, 0, 0.1), 0 8px 8px rgba(0, 0, 0, 0.1), 0 16px 16px rgba(0, 0, 0, 0.1);
}
@media (min-width: 600px) {
  .card {
    height: 350px;
  }
}
.card:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 110%;
  background-size: cover;
  background-position: 0 0;
  transition: transform calc(var(--d) * 1.5) var(--e);
  pointer-events: none;
}
.card:after {
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 200%;
  pointer-events: none;
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.009) 11.7%, rgba(0, 0, 0, 0.034) 22.1%, rgba(0, 0, 0, 0.072) 31.2%, rgba(0, 0, 0, 0.123) 39.4%, rgba(0, 0, 0, 0.182) 46.6%, rgba(0, 0, 0, 0.249) 53.1%, rgba(0, 0, 0, 0.32) 58.9%, rgba(0, 0, 0, 0.394) 64.3%, rgba(0, 0, 0, 0.468) 69.3%, rgba(0, 0, 0, 0.54) 74.1%, rgba(0, 0, 0, 0.607) 78.8%, rgba(0, 0, 0, 0.668) 83.6%, rgba(0, 0, 0, 0.721) 88.7%, rgba(0, 0, 0, 0.762) 94.1%, rgba(0, 0, 0, 0.79) 100%);
  transform: translateY(-50%);
  transition: transform calc(var(--d) * 2) var(--e);
}


@media (hover: hover) and (min-width: 600px) {
  .card:after {
    transform: translateY(0);
  }

  .card:hover,
.card:focus-within {
    align-items: center;
  }
  .card:hover:before,
.card:focus-within:before {
    transform: translateY(-4%);
  }
  .card:hover:after,
.card:focus-within:after {
    transform: translateY(-50%);
  }
  .card:hover .content,
.card:focus-within .content {
    transform: translateY(0);
  }
  .card:hover .content > *:not(.title),
.card:focus-within .content > *:not(.title) {
    opacity: 1;
    transform: translateY(0);
    transition-delay: calc(var(--d) / 8);
  }

  .card:focus-within:before, .card:focus-within:after,
.card:focus-within .content,
.card:focus-within .content > *:not(.title) {
    transition-duration: 0s;
  }
}
.viewmore{
	border: none;
	color: #ffffff;
	font-size:12px;
	padding:  5px 10px;
	float: right;
	position: relative;
	right: 150px;
	top: 40px;
}
/**gradaion*/
.moving-grad {
  background: linear-gradient(270deg, #FF3166, #F8D8E3);
  background-size: 200% 200%;
  animation: MoveGrad 5s ease infinite;
}


@keyframes MoveGrad {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
</style>
</head>
<body>
<div class="body">	
	<div class="content-wrap">
	<div class="title neon">
		<span>BLACK</span><span>PINK</span>
	</div>
		<div class="content-col">
		<div class="page-content">
				<c:forEach items="${fileNames }" var="fileName">
				<a href="${pageContext.request.contextPath}/gallery/down?fileName=${fileName}">
					<div class="card"
						style="background-image: url('${pageContext.request.contextPath}/save/gallery/${fileName}');">
					</div>
					</a>
					</c:forEach>
				</div>
			</div>
	</div>
	

</div>
</body>
</html>