package web.mvc.service;

import java.util.List;

import org.springframework.web.socket.WebSocketSession;

import web.mvc.dto.ChatRoom;

public interface ChatService {

	/**
	 * 전체 채팅방 찾기
	 * @return
	 */
	public List<ChatRoom> findAllRoom();

	
	/**
	 * 채팅방 아이디로 찾기
	 * @param roomId
	 * @return
	 */
	public ChatRoom findRoomById(String roomId);

	/**
	 * 채팅방 생성
	 * @param name
	 * @return
	 */
	public ChatRoom createRoom(String name);

	/**
	 * 메시지 보내기
	 * @param <T>
	 * @param session
	 * @param message
	 */
	public <T> void sendMessage(WebSocketSession session, T message);
}
