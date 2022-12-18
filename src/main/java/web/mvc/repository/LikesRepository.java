package web.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Likes;
import web.mvc.domain.LikesID;

public interface LikesRepository extends JpaRepository<Likes, LikesID>, QuerydslPredicateExecutor<LikesID> {

	Long countByBoardNo(Long boardNo);
}
