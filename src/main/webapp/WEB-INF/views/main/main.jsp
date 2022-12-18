<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
}


#canvas {
	background-color: red;
	z-index: -1;
	position: relative;
	top: -80px;
}
</style>

</head>
<body>

		<div id="canvas" style="width: 100%; height: 650px">
			<div class="sketchfab-embed-wrapper">
				<iframe title="Crown" frameborder="0" allowfullscreen
					mozallowfullscreen="true" webkitallowfullscreen="true"
					allow="autoplay; fullscreen; xr-spatial-tracking"
					xr-spatial-tracking execution-while-out-of-viewport
					execution-while-not-rendered web-share
					src="https://sketchfab.com/models/d0eaa0c4ec3a4a40b85c74301e1ac933/embed?autospin=1&autostart=1&preload=1&ui_theme=dark" width="100%" height="800px">
				</iframe>
				</iframe>
			</div>
		</div>



</body>
</html>