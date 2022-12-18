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
</style>
<script type="text/javascript">
$(document).ready(function() {
	var str ="";
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=40&order=date&channelId=UCOmHUn--16B90oW2L6FRR3A&type=video&key=AIzaSyD9cPaoBha4w0gCgrvVM8T4L8CvQyViFPQ",
        contentType : "application/json",
        success : function(data) {
            data.items.forEach(function(element, index) {
            	str += '<div class="column"><iframe width="100%" height="100%" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="palyYoutube"></iframe></div>'            
            });
            $('.content-col').html(str);
        },
        complete : function(data) {
        },
        error : function(xhr, status, error) {
            console.log("유튜브 요청 에러: "+error);
        }
    });
});
</script>
</head>
<body>
<div class="body">	
	<div class="content-wrap">
	<div class="title neon">
		<span>BLACK</span><span>PINK</span>
	</div>
		<div class="content-col"></div>
	</div>
</div>
</body>
</html>