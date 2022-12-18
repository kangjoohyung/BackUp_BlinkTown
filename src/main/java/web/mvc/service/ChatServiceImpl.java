package web.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import web.mvc.dto.ChatRoom;


@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{

	private final ObjectMapper objectMapper;
	private Map<String, ChatRoom> chatRooms;

	@PostConstruct
	private void init() {
		chatRooms = new LinkedHashMap<String, ChatRoom>();
	}

	public List<ChatRoom> findAllRoom() {
		// map의 value들을 List 컬렉션으로 변환
		return new ArrayList<>(chatRooms.values());
	}

	public ChatRoom findRoomById(String roomId) {
		System.out.println("chatRooms = " + chatRooms);
		System.out.println("roomId..... = " + roomId);
		
		ChatRoom cr = chatRooms.get(roomId);
		System.out.println("cr ====" + cr);
		return cr;
	}

	public ChatRoom createRoom(String name) {
		String randomId = UUID.randomUUID().toString();// map키 생성
		System.out.println("randomId -  = " + randomId);
		
		ChatRoom chatRoom = ChatRoom.builder().roomId(randomId).name(name).build();
		chatRooms.put(randomId, chatRoom);

		System.out.println("chatRoom = " + chatRoom);
		System.out.println("chatRooms = " + chatRooms);
		return chatRoom;
	}

	public <T> void sendMessage(WebSocketSession session, T message) {
		try {
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(message)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
