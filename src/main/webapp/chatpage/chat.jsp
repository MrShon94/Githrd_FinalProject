<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<style>
/* 전체 CSS */
* {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
}

/* 전체 Box */
#container {
	display: inline-block;
	width: 620px;
	height: 710px;
	margin: 10px;
	border: 2px solid #EAEBEB;
	border-radius: 10px 10px 10px 10px;
}

/* 채팅방 정보 및 검색 Box*/
#chatInfoContainer{
	display: inline-block;
	width: 600px;
	height: 40px;
	padding-top: 8px;
	padding-left: 10px;
	box-sizing: border-box;
	margin-top: 10px;
	margin-left: 8px;
	border: 2px solid #EAEBEB;
	border-radius: 10px 10px 10px 10px;	
	font-size: 16px;
	font-weight: bold;
	color: #fa8258;
}

/* 1) 검색 Box */
#searchContainer {
	float: right;
	width: 250px;
	padding-right: 10px;
	line-height: 10px;
	text-align: right;
}

#inputSearch {
	clear: both;
	width: 200px;
	height: 20px;
	font-size: 12px;
}

.searchIcon {
	text-align: right;
	font-size: 20px;
	border: none;
	background-color: transparent;
  color: black;
  cursor: pointer;
  border-radius: 5px 5px 5px 5px;
}

.searchIcon:hover {
  color: #fa8258;
  cursor: pointer;
}

/* 채팅 내용 Box */
#chatContainer {
	margin: 10px;
	min-height: 490px;
	max-height: 490px;
	vertical-align: bottom;
	overflow: scroll;
	overflow-x: hidden;
	border: 2px solid #EAEBEB;
	border-radius: 10px 10px 10px 10px;
	background-color: #E1E1E1;
}

/* 메시지 입력 및 아이콘 및 전송 Box */
#bottomContainer {
	width: 605px;
	height: 140px;
	display: inline-block;
	padding: 10px;
	box-sizing: border-box;
	background-color: #fff;
	margin: 0px;
	margin-left: 8px;
	border: 2px solid #EAEBEB;
	border-radius: 10px 10px 10px 10px;	
}

/* 1) 메시지 입력 */
#inputChat {
	width: 580px;
	height: 75px;
	font-size: 15px;
	border: none;
	resize: none;
}

/* 2) 아이콘 Box */
#manuContainer {
	margin-top: 15px;
	display: inline-block;
}

.btnIcon {
	font-size: 20px;
	border: none;
	background-color: transparent;
  color: black;
  border-radius: 5px 5px 5px 5px;
}

.btnIcon:hover {
  color: #fa8258;
  cursor: pointer;
}

/* 3) 전송 Box */
#submitContainer {
	margin-top: 12px;
	float: right;
}

#btnChatSubmit {
	clear: both;
	width: 60px;
	height: 30px;
	background-color: #fa8258;
	color: #fff;
	font-weight: bold;
	border-radius: 5px 5px 5px 5px;
	cursor: pointer;
}

/* server 공지(입장, 퇴장) */
.notice {
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	width: auto;
	height: auto;
	word-break: break-all;
	display: block;
	text-align: center;
	font-size: 12px;
	border: none;
	background-color: #EEEEEE;
}

/* chat 기본설정(otherChat) 및 myChat 및 chatInfo(채팅시간)*/
.chat {
	width: auto;
	min-height: 20px;
	height: auto;
	margin: 5px;
	padding: 5px;
	text-align: left;
	font-size: 15px;
	color: black;
	word-break: break-all;
	background: #ffffff;
	
	display: inline-block;
	border-radius: 10px 10px 10px 10px;
}

.myChat {
	background: #fa8258;
	text-align: justify;
	color: #fff;
	font-weight: bold;
	font-size: 15px;
	border-radius: 10px 10px 10px 10px;
}

.chatInfo {
	clear: both;
	color: #556677;
	font-size: 10px;
	text-align: right;
	padding: 5px;
	padding-top: 0px;
}

/* 상대방이 보낸 채팅 */

.otherChatBox {
	clear: both;
	text-align: left;
	margin-left: 10px;
}

.myChatBox {
	clear: both;
	text-align: right;
	margin-right: 10px;
}

</style>
</head>
<body>
	<div id='container'>
		<div id='chatInfoContainer'>
			<i class='fas fa-comments' style='font-size:20px; color:#fa8258;'></i>
			<span>글로벌IT인재개발원 인사팀(7)</span>
			<div id='searchContainer'>
				<input type='text' id="inputSearch" placeholder='대화 내용 검색'>
				<button class='searchIcon'><i class='fas fa-search'></i></button>
			</div>
		</div>
		<div id='chatContainer'>
		</div>
		<div id='bottomContainer'>
			<textarea cols='40' rows='5' id='inputChat' autofocus='autofocus' maxlength='1000'
								placeholder='메시지를 입력하세요 (공백포함 최대 1000자)'></textarea>
			<div id='manuContainer'>
				<button class='btnIcon'><i class='far fa-smile'></i></button>
				<button class='btnIcon'><i class='far fa-images'></i></button>
				<button class='btnIcon'><i class='far fa-folder-open'></i></button>
				<button class='btnIcon'><i class='fas fa-cut'></i></button>
			</div>
			<div id='submitContainer'>
				<input type='submit' id='btnChatSubmit' value='전송'>
			</div>
		</div>
	</div>
</body>

<script>
	var webSocket = new WebSocket('ws://localhost:8888/FinalProject/multiChatServer');
	var inputChat = document.getElementById('inputChat');
	var chatArea = document.getElementById("chatContainer");

	webSocket.onerror = function(event) {
		onError(event);
	};
	webSocket.onopen = function(event) {
		onOpen(event);
	};
	webSocket.onmessage = function(event) {
		onMessage(event);
	};

	function onMessage(event) {
		var msg = event.data;
		var date = new Date();
		var dateMsg = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();
		if (msg.substring(0, 6) == 'server') {
			var $chat = $("<div class='notice'>" + msg + "</div>");
			$('#chatContainer').append($chat);
		} else {
			var $chat = $("<div class='otherChatBox'><div class='chat'>" + msg
					+ "</div><div class='chatInfo otherChatBox'>" + dateMsg
					+ "</div></div>");
			$('#chatContainer').append($chat);
		}

		$('#chatContainer').scrollTop(
				$('#chatContainer')[0].scrollHeight + 20);
	}

	function onOpen(event) {
		
	}

	function onError(event) {
		alert(event.data);
	}

	function send() {
		var msg = inputChat.value;
		var date = new Date();
		var dateMsg = date.getHours() + ":" + date.getMinutes() + ":"
				+ date.getSeconds();
		var $chat = $("<div class='myChatBox'><div class='chat myChat'>"
				+ msg + "</div><div class='chatInfo'>" + dateMsg
				+ "</div></div>");
		
		// 아무것도 입력하지 않으면 전송할 수 없게
		if (msg == '') {
			return;
		}
		
		$('#chatContainer').append($chat);
		webSocket.send(msg);
		inputChat.value = "";
		$('#chatContainer').scrollTop(
				$('#chatContainer')[0].scrollHeight + 20);
	}
</script>

<script>
$(function() {
	$('#btnChatSubmit').click(function() {
		$('#inputChat').focus();
		send();
	});
	
	$('#inputChat').keydown(function(key) {
		if (key.keyCode == 13) {
			$('#inputChat').focus();
			event.preventDefault();
			send();
		}
	});
})
</script>
</html>