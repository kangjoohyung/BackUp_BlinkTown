package web.mvc.service;

import java.util.List;

import web.mvc.domain.Reply;
import web.mvc.domain.Users;

public interface ReplyService {
	
	/**
	 * 게시글에 댓글달기
	 * : 댓글(댓글번호, 댓글내용, 댓글등록일, 게시판번호, 아이디)
	 * (댓글번호는 시퀀스로 생성된다)
	 * */
	Reply insertReply(Reply reply, Users users);
		
	
	/**
	 * 댓글삭제
	 * : 댓글번호(replyNo)를 인수로 받아온다
	 * */
	void deleteReply(Long replyNo, Users users);
	
	/**
	 * 댓글 목록 출력
	 */
	List<Reply> findByBoardOrderByReplyNoDesc(Long boardNo);

}
