package web.mvc.repository;

import java.util.List;

import org.hibernate.annotations.Parameter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import web.mvc.domain.Board;
import web.mvc.domain.Users;


public interface BoardRepository extends JpaRepository<Board, Long>, QuerydslPredicateExecutor<Board> {
	
	/**
	 * 아티스트별 게시판검색
	 * : String userId(fk)를 인수로 받아서 검색
	 * 검색하는 userId에 해당되는 것 전부를 List로 보여준다
	 * */
	List<Board> findByUsers(Users users);
	
	/**
	 * 아이디별 검색하여 게시판 리스트 출력 / boardNo기준으로 최근순 정렬
	 */
	List<Board> findByUsersOrderByBoardNoDesc(Users users);
}
