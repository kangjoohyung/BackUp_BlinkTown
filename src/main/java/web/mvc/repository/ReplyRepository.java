package web.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Board;
import web.mvc.domain.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Long>, QuerydslPredicateExecutor<Reply>  {
	
	List<Reply> findByBoardOrderByReplyNoDesc(Board board);
	
}
