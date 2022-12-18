package web.mvc.handler;

import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import web.mvc.dto.ChatMessage;
import web.mvc.dto.ChatRoom;
import web.mvc.service.ChatService;

@Component
@RequiredArgsConstructor
public class SocketTextHandler extends TextWebSocketHandler {

	// Java 객체로 deserialization 하거나 Java 객체를 JSON으로 serialization 할 때 사용하는 Jackson 라이브러리의 클래스
	private final ObjectMapper objectMapper;
	private final ChatService chatService;

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		// 메시지 발송
		String msg = message.getPayload();
        /*
         * socket.send(JSON.stringify({
	 			'type': "ENTER",
	 			'roomId': LisaRoomID,
	 			'sender':  $("#chatSenderName").val(),
	 			'message': "aa",
	 		}));
         * */
		// json 객체를 자바 객체로 역직렬화
		ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
		System.out.println("chatMessage.getRoomId() = " + chatMessage.getRoomId());
		
		ChatRoom chatRoom = chatService.findRoomById(chatMessage.getRoomId());
		System.out.println("chatRoom ====" + chatRoom);
		chatRoom.handlerActions(session, chatMessage, chatService);
	}

}
