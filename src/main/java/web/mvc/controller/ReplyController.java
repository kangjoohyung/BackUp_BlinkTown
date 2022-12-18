package web.mvc.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.tomcat.util.digester.ArrayStack;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import web.mvc.domain.Board;
import web.mvc.domain.Reply;
import web.mvc.domain.Users;
import web.mvc.repository.ReplyRepository;
import web.mvc.service.BoardService;
import web.mvc.service.ReplyService;

@RestController
@RequestMapping("/reply")
@RequiredArgsConstructor
public class ReplyController {

	private final ReplyService replyService;	
	private final BoardService boardService;
	
	/**
	 * 댓글 등록하기
	 * ->ajax로 사용
	 * ->text형태로
	 * */
	@RequestMapping("/details/{boardNo}")
	public Reply insertReply(String replyContent, @PathVariable Long boardNo) { 
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Board board=boardService.selectByBoardNo(boardNo);
		Reply beforeReply=Reply.builder().board(board).replyContent(replyContent).users(users).build();
		
		Reply newReply=replyService.insertReply(beforeReply, users);
		return newReply;
	}
	
	/**
	 * 댓글 삭제하기
	 * */
	@RequestMapping("/delete")
	public String deleteReply(Long replyNo,  Long boardNo) {
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		replyService.deleteReply(replyNo, users);
		return "ok";
	}
	
	/**
	 * 부모글에 해당되는 댓글 가져오기
	 * */
	@RequestMapping("/select")
	public Map<String, Object> selectReply(Long boardNo) {
		List<Reply> replyList = replyService.findByBoardOrderByReplyNoDesc(boardNo);
		Map<String, Object> map = new HashMap<>();
		
		List<String> nicList = new ArrayList<String>();
		for(Reply r : replyList) {
			nicList.add(r.getUsers().getUsersNickName());
		}
		
		List<String> usersList = new ArrayList<String>();
		for(Reply l : replyList) {
			usersList.add(l.getUsers().getUsersId());
		}
		
		map.put("nicList", nicList);
		map.put("usersList", usersList);
		map.put("replyList", replyList);
		
		return map;
	}
	
}







