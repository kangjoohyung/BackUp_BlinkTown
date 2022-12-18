package web.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ChatMessage {
	
	public enum MessageType{
		ENTER, TALK
	}
	
	// 입장 시, 대화 구분
	private MessageType type;
	private String roomId;
	private String sender;
	private String message;
	
}
