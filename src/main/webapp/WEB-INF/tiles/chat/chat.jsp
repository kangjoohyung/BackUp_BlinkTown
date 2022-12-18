<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<script src="https://kit.fontawesome.com/a224d3b399.js" crossorigin="anonymous"></script>
<style type="text/css">

#center-text {
	display: flex;
	flex: 1;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
}

#chat-circle {
	position: fixed;
	bottom: 50px;
	right: 50px;
	background: #f4a7bb;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	color: white;
	padding: 28px;
	cursor: pointer;
	z-index: 99;
	box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px
		rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

.btn#my-btn {
	background: white;
	padding-top: 13px;
	padding-bottom: 12px;
	border-radius: 45px;
	padding-right: 40px;
	padding-left: 40px;
	color: #5865C3;
}

#chat-overlay {
	background: rgba(255, 255, 255, 0.1);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	display: none;
}

.chat-box {
	display: none;
	background: #efefef;
	position: fixed;
	right: 30px;
	bottom: 50px;
	width: 350px;
	max-width: 85vw;
	max-height: 100vh;
	border-radius: 5px;
	z-index: 99;
}

.chat-box-toggle {
	float: right;
	margin-right: 15px;
	cursor: pointer;
}

.chat-box-header {
	background: #f4a7bb;
	height: 70px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color: white;
	text-align: center;
	font-size: 20px;
	padding-top: 17px;
}

.chat-box-body {
	position: relative;
	height: 370px;
	height: auto;
	border: 1px solid #ccc;
	overflow: hidden;
}

.chat-box-body:after {
	content: "";
	background-color: #ffffff;
	opacity: 0.1;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 100%;
	position: absolute;
	z-index: -1;
}

.message {
	background: #f4f7f9;
	width: 100%;
	position: relative;
	height: 47px;
	padding-top: 10px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 15px;
	border: none;
	resize: none;
	outline: none;
	border: 1px solid #ccc;
	color: #888;
	border-top: none;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	overflow: hidden;
}

.chat-input>form {
	margin-bottom: 0;
}

.message::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: #ccc;
}

.message::-moz-placeholder { /* Firefox 19+ */
	color: #ccc;
}

.message:-ms-input-placeholder { /* IE 10+ */
	color: #ccc;
}

.message:-moz-placeholder { /* Firefox 18- */
	color: #ccc;
}

.chat-submit {
	position: absolute;
	bottom: 3px;
	right: 10px;
	background: transparent;
	box-shadow: none;
	border: none;
	border-radius: 50%;
	color: #F4A7BB;
	width: 35px;
	height: 35px;
}

.chat-logs {
	padding: 15px;
	height: 370px;
	overflow-y: scroll;
}

.chat-logs-top {
	padding: 15px;
	height: 80px;
}

.chat-logs::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F4A7BB;
}

.chat-logs::-webkit-scrollbar {
	width: 5px;
	background-color: #F4A7BB;
}

.chat-logs::-webkit-scrollbar-thumb {
	background-color: #F4A7BB;
}

@media only screen and (max-width: 500px) {
	.chat-logs {
		height: 40vh;
	}
}

.msg-avatar {
	display: block;
	text-align: left;
	padding-left: 20px;
	color: #cccccc
}

.cm-msg-text {
	background: white;
	padding: 10px 15px 10px 15px;
	color: #666;
	max-width: 200px;
	overflow: hidden;
	float: left;
	margin-left: 10px;
	position: relative;
	margin-bottom: 20px;
	border-radius: 30px;
}

.chat-msg {
	clear: both;
}

.chat-msg.self>.cm-msg-text {
	float: right;
	margin-right: 10px;
	background: #f4a7bb;
	color: white;
}

.cm-msg-button>ul>li {
	list-style: none;
	float: left;
	width: 50%;
}

.cm-msg-button {
	clear: both;
	margin-bottom: 70px;
}

.hidden {
	display: none;
}

.show {
	display: block;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
var JisooRoomID;
var JennieRoomID;
var LisaRoomID;
var RoseRoomID;

var JisooRoomINDEX = 0; 
var JennieRoomINDEX = 0; 
var LisaRoomINDEX = 0; 
var RoseRoomINDEX = 0; 

var sock = new WebSocket('ws://192.168.0.132:8000/ws/chat');   
var socket = sock;
socket.onopen = function() {
	console.log('서버와 웹소켓 연결 성공!');
}

socket.onclose = function(){
	setTimeout(function(){connect();},1000);
}

socket.onmessage = onMessage;
$(document).ready(function(){
	    // 웹소켓 연결	
		$(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		    });
			$("#create-Room").on('click', function() { // 제출 버튼 이벤트 지정
				
				let arr = [$("#create-JisooRoom-Btn").val() , $("#create-JennieRoom-Btn").val() , $("#create-LisaRoom-Btn").val(), $("#create-RoseRoom-Btn").val()];
			
			   alert(arr)
				
				$.ajax({
					url : "/chat", // 목적지
					type : "POST", // HTTP Method
					contentType:"application/json;UTF-8",
					data :JSON.stringify(arr), // 전송 데이터 
					dataType : 'text', // 전송 데이터 형식
					success : function(res) { // 성공 시 실행
						//console.log(res.roomId);
						console.log(res);
					},
					error : function(er) { //실패 시 실행
						alert("실패 원인 : " + er);
					}
				});
	
			/*	$.ajax({
					url : "/chat", // 목적지
					type : "POST", // HTTP Method
					data : {
						name : $("#create-JennieRoom-Btn").val()
					}, // 전송 데이터
					dataType : 'json', // 전송 데이터 형식
					success : function(res) { // 성공 시 실행
						console.log(res.roomId);
					},
					error : function(er) { //실패 시 실행
						alert("실패 원인 : " + er);
					}
				});
	
				$.ajax({
					url : "/chat", // 목적지
					type : "POST", // HTTP Method
					data : {
						name : $("#create-LisaRoom-Btn").val()
					}, // 전송 데이터
					dataType : 'json', // 전송 데이터 형식
					success : function(res) { // 성공 시 실행
						console.log(res.roomId);
					},
					error : function(er) { //실패 시 실행
						alert("실패 원인 : " + er);
					}
				});
	
				$.ajax({
					url : "/chat", // 목적지
					type : "POST", // HTTP Method
					data : {
						name : $("#create-RoseRoom-Btn").val()
					}, // 전송 데이터
					dataType : 'json', // 전송 데이터 형식
					success : function(res) { // 성공 시 실행
						console.log(res.roomId);
					},
					error : function(er) { //실패 시 실행
						alert("실패 원인 : " + er);
					}
				});	*/
				
			});
			
	/* 채팅방 입장 */ 

			$("#enter-Room").on('click', function() { 
		 		$.ajax({
					url : "/chat", // 목적지
					type : "GET", // HTTP Method,
					dataType : 'json',
					success : function(res) {	
						console.log("res = " + res)
						$.each(res, function(index, item) { // 데이터 =item
							console.log(item.name);
							if(item.name=="JISOO"){
								 JisooRoomID = item.roomId;							  
								 document.getElementById('JisooChatLog').className = 'chat-logs '+JisooRoomID;

							}else if (item.name=="JENNIE") {
								 JennieRoomID = item.roomId;							  
								 document.getElementById('JennieChatLog').className = 'chat-logs '+JennieRoomID;

							}else if (item.name=="LISA") {
								 LisaRoomID = item.roomId;							  
								 document.getElementById('LisaChatLog').className = 'chat-logs '+LisaRoomID;

							}else if(item.name=="ROSE") {
								 RoseRoomID = item.roomId; 
								 document.getElementById('RoseChatLog').className = 'chat-logs '+RoseRoomID;
							}
							 document.getElementById('chat-enter-wrap').className = 'chat-logs-top';
						});
					
					},
					error : function(er) { //실패 시 실행
						alert("실패 원인 : " + er);
					}
				});
			});
			
	
	 	/*지수방입장*/
	 	$("#JisooRoomEnter").on('click', function() { 
	 		console.log("JisooRoomID = " + JisooRoomID);
	 	    socket.send(JSON.stringify({
	 			'type': "ENTER",
	 			'roomId': JisooRoomID,
	 			'sender': $("#chatSenderName").val(),
	 			'message': "aa",
	 		})); 
			document.getElementById('JisooChatRoom').className = 'chat-box-body hidden';
			document.getElementById('JennieChatRoom').className = 'chat-box-body hidden';
			document.getElementById('LisaChatRoom').className = 'chat-box-body hidden';
			document.getElementById('RoseChatRoom').className = 'chat-box-body hidden';
								
			document.getElementById('JisooChatRoom').className = 'chat-box-body';	
		});
	 
		/*제니방입장*/
		$("#JennieRoomEnter").on('click', function() { 
			socket.send(JSON.stringify({
	 			'type': "ENTER",
	 			'roomId': JennieRoomID,
	 			'sender':  $("#chatSenderName").val(),
	 			'message': "aa",
	 		}));
			document.getElementById('JisooChatRoom').className = 'chat-box-body hidden';
			document.getElementById('JennieChatRoom').className = 'chat-box-body hidden';
			document.getElementById('LisaChatRoom').className = 'chat-box-body hidden';
			document.getElementById('RoseChatRoom').className = 'chat-box-body hidden';
					
			document.getElementById('JennieChatRoom').className = 'chat-box-body';	
		});
		
	
		/*리사방입장*/
		$("#LisaRoomEnter").on('click', function() { 
			socket.send(JSON.stringify({
	 			'type': "ENTER",
	 			'roomId': LisaRoomID,
	 			'sender':  $("#chatSenderName").val(),
	 			'message': "aa",
	 		}));
			document.getElementById('JisooChatRoom').className = 'chat-box-body hidden';
			document.getElementById('JennieChatRoom').className = 'chat-box-body hidden';
			document.getElementById('LisaChatRoom').className = 'chat-box-body hidden';
			document.getElementById('RoseChatRoom').className = 'chat-box-body hidden';
					
			document.getElementById('LisaChatRoom').className = 'chat-box-body';
		});
		
		/*로제방입장*/
		$("#RoseRoomEnter").on('click', function() { 
			socket.send(JSON.stringify({
	 			'type': "ENTER",
	 			'roomId': RoseRoomID,
	 			'sender':  $("#chatSenderName").val(),
	 			'message': "aa",
	 		}));
			document.getElementById('JisooChatRoom').className = 'chat-box-body hidden';
			document.getElementById('JennieChatRoom').className = 'chat-box-body hidden';
			document.getElementById('LisaChatRoom').className = 'chat-box-body hidden';
			document.getElementById('RoseChatRoom').className = 'chat-box-body hidden';
					
			document.getElementById('RoseChatRoom').className = 'chat-box-body';
		});

		



 
/* 메세지전송 */
$('#JisooChat-submit ').on('click', function() { 	
	socket.send(JSON.stringify({
			'type': "TALK",
			'roomId': JisooRoomID,
			'sender':  $("#chatSenderName").val(),
			'message': $("#JisooMessage").val(),
	}));
	document.getElementById('JisooMessage').value=null; 
});
	
$('#JennieChat-submit').click(function(e){
	socket.send(JSON.stringify({
		'type': "TALK",
		'roomId': JennieRoomID,
		'sender':  $("#chatSenderName").val(),
		'message': $("#JennieMessage").val(),
	}));
	document.getElementById('JennieMessage').value=null; 
});


$('#LisaChat-submit').click(function(e){
	socket.send(JSON.stringify({
		'type': "TALK",
		'roomId': LisaRoomID,
		'sender':  $("#chatSenderName").val(),
		'message': $("#LisaMessage").val(),
	}));
	document.getElementById('LisaMessage').value=null; 
});

$('#RoseChat-submit').click(function(e){
	socket.send(JSON.stringify({
		'type': "TALK",
		'roomId': RoseRoomID,
		'sender':  $("#chatSenderName").val(),
		'message': $("#RoseMessage").val(),
	}));
	document.getElementById('RoseMessage').value=null; 
});


});//방생성끝

function onMessage(msg) {
    var data = msg.data;
    var sessionId =  $("#chatSenderName").val();
    //데이터를 보낸 사람
    var message = null;
    var roomData = JSON.parse(data);
    
	console.log(roomData);
	console.log(roomData.roomId);
	console.log(roomData.sender);
	console.log(roomData.message);
	
	
	if(roomData.roomId==JisooRoomID){
		console.log("지수방에 들어옴");
		if(sessionId==roomData.sender){
	    console.log("지수방에 들어옴");
		JisooRoomINDEX++
	    var str="";
	    str += "<div id='cm-msg-"+JisooRoomINDEX+"-ji' class=\"chat-msg self\">";
	    str += "          <div class=\"cm-msg-text\">";
	    str += roomData.message;
	    str += "          <\/div>";
	    str += "        <\/div>";
	    $("#JisooChatLog").append(str);
	    console.log(str);
	    $("#cm-msg-"+JisooRoomINDEX+"-ji").hide().fadeIn(300);   
	    $("#JisooChatLog").stop().animate({ scrollTop: $("#JisooChatLog")[0].scrollHeight}, 1000);  
		}else{
			JisooRoomINDEX++
			    var str="";
			    str += "<div id='cm-msg-"+JisooRoomINDEX+"-ji' class=\"chat-msg\">";
			    str += "          <div class=\"msg-avatar\">";
			    str += roomData.sender;
			    str += "          <\/div>";
			    str += "          <div class=\"cm-msg-text\">";
			    str += roomData.message;
			    str += "          <\/div>";
			    str += "        <\/div>";
			    $("#JisooChatLog").append(str);
			    $("#cm-msg-"+JisooRoomINDEX+"-ji").hide().fadeIn(300);   
			    $("#JisooChatLog").stop().animate({ scrollTop: $("#JisooChatLog")[0].scrollHeight}, 1000);    s
		}
	}else if (roomData.roomId==LisaRoomID) {
		
		console.log("리사방에 들어옴");
		if(sessionId==roomData.sender){
	    console.log("리사방에 들어옴");
	    LisaRoomINDEX++
	    var str="";
	    str += "<div id='cm-msg-"+LisaRoomINDEX+"-li' class=\"chat-msg self\">";
	    str += "          <div class=\"cm-msg-text\">";
	    str += roomData.message;
	    str += "          <\/div>";
	    str += "        <\/div>";
	    $("#LisaChatLog").append(str);
	    console.log(str);
	    $("#cm-msg-"+LisaRoomINDEX+"-li").hide().fadeIn(300);   
	    $("#LisaChatLog").stop().animate({ scrollTop: $("#LisaChatLog")[0].scrollHeight}, 1000);  
		}else{
			LisaRoomINDEX++
			    var str="";
			    str += "<div id='cm-msg-"+LisaRoomINDEX+"-li' class=\"chat-msg\">";
			    str += "          <div class=\"msg-avatar\">";
			    str += roomData.sender;
			    str += "          <\/div>";
			    str += "          <div class=\"cm-msg-text\">";
			    str += roomData.message;
			    str += "          <\/div>";
			    str += "        <\/div>";
			    $("#LisaChatLog").append(str);
			    $("#cm-msg-"+LisaRoomINDEX+"-li").hide().fadeIn(300);   
			    $("#LisaChatLog").stop().animate({ scrollTop: $("#LisaChatLog")[0].scrollHeight}, 1000);    s
		}
	}else if (roomData.roomId==JennieRoomID) {
		
		console.log("제니방에 들어옴");
		if(sessionId==roomData.sender){
	    console.log("제니방에 들어옴");
	    JennieRoomINDEX++
	    var str="";
	    str += "<div id='cm-msg-"+JennieRoomINDEX+"-je' class=\"chat-msg self\">";
	    str += "          <div class=\"cm-msg-text\">";
	    str += roomData.message;
	    str += "          <\/div>";
	    str += "        <\/div>";
	    $("#JennieChatLog").append(str);
	    console.log(str);
	    $("#cm-msg-"+JennieRoomINDEX+"-je").hide().fadeIn(300);   
	    $("#JennieChatLog").stop().animate({ scrollTop: $("#JennieChatLog")[0].scrollHeight}, 1000);  
		}else{
			JennieRoomINDEX++
			    var str="";
			    str += "<div id='cm-msg-"+JennieRoomINDEX+"-je' class=\"chat-msg\">";
			    str += "          <div class=\"msg-avatar\">";
			    str += roomData.sender;
			    str += "          <\/div>";
			    str += "          <div class=\"cm-msg-text\">";
			    str += roomData.message;
			    str += "          <\/div>";
			    str += "        <\/div>";
			    $("#JennieChatLog").append(str);
			    $("#cm-msg-"+JennieRoomINDEX+"-je").hide().fadeIn(300);   
			    $("#JennieChatLog").stop().animate({ scrollTop: $("#JennieChatLog")[0].scrollHeight}, 1000);    s
		}
	}else if (roomData.roomId==RoseRoomID) {
		
		console.log("로제방에 들어옴");
		if(sessionId==roomData.sender){
	    console.log("로제방에 들어옴");
	    RoseRoomINDEX++
	    var str="";
	    str += "<div id='cm-msg-"+RoseRoomINDEX+"-ro' class=\"chat-msg self\">";
	    str += "          <div class=\"cm-msg-text\">";
	    str += roomData.message;
	    str += "          <\/div>";
	    str += "        <\/div>";
	    $("#RoseChatLog").append(str);
	    console.log(str);
	    $("#cm-msg-"+RoseRoomINDEX+"-ro").hide().fadeIn(300);   
	    $("#RoseChatLog").stop().animate({ scrollTop: $("#RoseChatLog")[0].scrollHeight}, 1000);  
		}else{
			RoseRoomINDEX++
			    var str="";
			    str += "<div id='cm-msg-"+RoseRoomINDEX+"-ro' class=\"chat-msg\">";
			    str += "          <div class=\"msg-avatar\">";
			    str += roomData.sender;
			    str += "          <\/div>";
			    str += "          <div class=\"cm-msg-text\">";
			    str += roomData.message;
			    str += "          <\/div>";
			    str += "        <\/div>";
			    $("#RoseChatLog").append(str);
			    $("#cm-msg-"+RoseRoomINDEX+"-ro").hide().fadeIn(300);   
			    $("#RoseChatLog").stop().animate({ scrollTop: $("#RoseChatLog")[0].scrollHeight}, 1000);    s
		}
	}

	
  //  var str = "<b>" + roomData.roomId + " : " + roomData.message + "</b>";
    // $("."+roomData.roomId).html(str);
 
}
</script>

</head>
<body>
	<div id="body">

		<div id="chat-circle" class="btn btn-raised">
			<div id="chat-overlay"></div>
			<i class="fa-solid fa-heart" style="font-size: 30px; position: relative; top: -13px; right: 15px; "></i>
		</div>

		<div class="chat-box">
			<div class="chat-box-header">
				<input type="hidden" value="<sec:authentication property='principal.usersNickName'/>" id="chatSenderName"> <span class="chat-box-toggle"><i
					class="material-icons">close</i></span>
			</div>
			<div class="chat-box-body">
				<div class="chat-box-overlay"></div>
				<div class="chat-logs-top" id="createRoombtn">
					<div id='cm-msg' class="chat-msg ">
						<!-- 방생성[맴버전용] -->
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div class="cm-msg-text"
							style="margin-left: 1px; height: 44px; overflow: hidden;">
							<input type="button" id="create-Room" class="chatBtn" value="방생성하기"
								style="background-color: inherit; padding: 0px; border: none;">
							<input type="submit" value="JISOO" style="display: none;"
								id="create-JisooRoom-Btn"> <input type="submit"
								value="JENNIE"
								style="display: none; padding: 0px; border: none;"
								id="create-JennieRoom-Btn"> <input type="submit"
								value="LISA" style="display: none;" id="create-LisaRoom-Btn">
							<input type="submit" value="ROSE" style="display: none;"
								id="create-RoseRoom-Btn">
						</div>
						</sec:authorize>
						<!-- 방입장 -->

						<div class="cm-msg-text"
							style="margin-left: 1px; height: 44px; overflow: hidden;">
							<input type="button" id="enter-Room" value="채팅참여하기"
								style="background-color: inherit; padding: 0px; border: none;">
							<input type="submit" value="JISOO" style="display: none;"
								id="enter-JisooRoom-Btn"> <input type="submit"
								value="JENNIE"
								style="display: none; padding: 0px; border: none;"
								id="enter-JennieRoom-Btn"> <input type="submit"
								value="LISA" style="display: none;" id="enter-LisaRoom-Btn">
							<input type="submit" value="ROSE" style="display: none;"
								id="enter-RoseRoom-Btn">
						</div>
					</div> 
					
				</div>

				<div class="chat-logs-top hidden" id="chat-enter-wrap">
					<div id='cm-msg' class="chat-msg ">
						<!-- 방입장[회원전용] -->

						<div class="cm-msg-text"
							style="margin-left: 1px; height: 44px; overflow: hidden;">
							<input type="button" value="JISOO"
								style="background-color: inherit; padding: 0px; border: none;"
								id="JisooRoomEnter" class="RoomEnter ">
						</div> 
						<div class="cm-msg-text"
							style="margin-left: 1px; height: 44px; overflow: hidden;">
							<input type="submit" value="JENIEE"
								style="background-color: inherit; padding: 0px; border: none;"
								id="JennieRoomEnter" class="RoomEnter">

						</div>
						<div class="cm-msg-text"
							style="margin-left: 1px; height: 44px; overflow: hidden;">
							<input type="submit" value="LISA"
								style="background-color: inherit; padding: 0px; border: none;"
								id="LisaRoomEnter"class="RoomEnter">
						</div>
						<div class="cm-msg-text"
							style="margin-left: 1px; height: 44px; overflow: hidden;">
							<input type="submit" value="ROSE"
								style="background-color: inherit; padding: 0px; border: none;"
								id="RoseRoomEnter" class="RoomEnter">
						</div>
					</div>

				</div>




				<div class="chat-box-body hidden" id="JisooChatRoom">
					<div class="chat-box-overlay"></div>
					<div class="chat-logs " id="JisooChatLog"></div>
					<!--chat-log -->
					
					<div class="chat-input">
						<form name="JisooMessage-send" id="JisooMessage-send" onsubmit="return false">
							<input type="hidden" id="JisooRoomNo" class="JisooRoomNo">
							<input type="text" id="JisooMessage" class="message"
								placeholder="to.JISOO" />
							<button type="button" id="JisooChat-submit" class="chat-submit">
								<i class="material-icons">send</i>
							</button>
						</form>
					</div>
				</div> 

				<div class="chat-box-body hidden" id="JennieChatRoom">
					<div class="chat-box-overlay"></div> 
					<div class="chat-logs " id="JennieChatLog"></div>
					<!--chat-log -->
					
					<div class="chat-input">
						<form name="message-send" id="message-send" onsubmit="return false">
							<input type="hidden" id="JennieRoomNo" class="JennieRoomNo">
							<input type="text" id="JennieMessage" class="message"
								placeholder="to.Jennie" />
							<button type="button" id="JennieChat-submit" class="chat-submit">
								<i class="material-icons">send</i>
							</button>
						</form>
					</div>
				</div>

				<div class="chat-box-body hidden" id="LisaChatRoom">
					<div class="chat-box-overlay"></div>
					<div class="chat-logs "  id="LisaChatLog"></div>
					<!--chat-log -->
					
					<div class="chat-input">
						<form name="LisaMessage-send" id="LisaMessage-send" onsubmit="return false">
							<input type="hidden" id="LisaRoomNo" class="LisaRoomNo">
							<input type="text" id="LisaMessage" class="message"
								placeholder="to.LISA" />
							<button type="button" id="LisaChat-submit" class="chat-submit">
								<i class="material-icons">send</i>
							</button>
						</form>
					</div>
				</div>

				<div class="chat-box-body hidden " id="RoseChatRoom">
					<div class="chat-box-overlay"></div>
					<div class="chat-logs" id="RoseChatLog"></div>
					<!--chat-log -->
					
					<div class="chat-input">
						<form name="RoseMessage-send" id="RoseMessage-send" onsubmit="return false">
							<input type="hidden" id="RoseRoomNo" class="RoseRoomNo">
							<input type="text" id="RoseMessage" class="message"
								placeholder="to.ROSE" />
							<button type="button" id="RoseChat-submit" class="chat-submit">
								<i class="material-icons">send</i>
							</button>
						</form>
					</div>
				</div>

			</div>
		</div>




	</div>

	<script>
		$("#chat-circle").click(function() {
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
		})

		$(".chat-box-toggle").click(function() {
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
		})
	</script>


</body>
</html>