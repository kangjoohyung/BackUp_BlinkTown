package web.mvc.dto;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import web.mvc.service.ChatService;

@Getter
@NoArgsConstructor
public class ChatRoom {
	private String roomId;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();

	@Builder
	public ChatRoom(String roomId, String name) {
		this.roomId = roomId;
		this.name = name;
	}

	public void handlerActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) {
		if (chatMessage.getType().equals(ChatMessage.MessageType.ENTER)) {
			sessions.add(session);
			chatMessage.setMessage(chatMessage.getSender() + "님이 입장하셨습니다.");
		}
		sendMessage(chatMessage, chatService);
	}

	// 컬렉션에 parallelStream을 호출하기만 하면 병렬 스트림 처리
	private <T> void sendMessage(T message, ChatService chatService) {
		sessions.parallelStream().forEach(session -> chatService.sendMessage(session, message));
	}
}
