package web.mvc.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import web.mvc.domain.Board;
import web.mvc.domain.Reply;
import web.mvc.domain.Users;
import web.mvc.repository.BoardRepository;
import web.mvc.repository.ReplyRepository;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyRepository replyRep;
	@Autowired
	private BoardRepository boardRep;
	
	@Override
	public Reply insertReply(Reply reply, Users users) {	
		Reply afterReply=replyRep.save(reply);
		return afterReply;
	}
	
	@Override
	public void deleteReply(Long replyNo, Users users) {
		replyRep.deleteById(replyNo);
		
	}

	@Override
	public List<Reply> findByBoardOrderByReplyNoDesc(Long boardNo){
		Board board=boardRep.findById(boardNo).orElse(null);
		List<Reply> replyList = replyRep.findByBoardOrderByReplyNoDesc(board);
		return replyList;
	}

}