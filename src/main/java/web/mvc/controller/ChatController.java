package web.mvc.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import web.mvc.dto.ChatRoom;
import web.mvc.service.ChatService;

@RequestMapping("/chat")
@RestController
@RequiredArgsConstructor
public class ChatController {
	private final ChatService chatService;
	
	@PostMapping
	public String createRoom(@RequestBody List<String> name) {
		System.out.println("controller name = " + name);
		for(String n : name) {
			chatService.createRoom(n);
		}
		
		return "ok";
		
	}
	
	@GetMapping
	public List<ChatRoom> findAllRoom(){
		List<ChatRoom>	 list = chatService.findAllRoom();
		System.out.println("list = " + list);
	    System.out.println("사이즈  =  " + list.size());
		return list;
	}
}
