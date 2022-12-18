package web.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import web.mvc.domain.Board;
import web.mvc.domain.Likes;
import web.mvc.domain.Users;


public interface BoardService {
	/**
	 * 전체 게시판검색
	 * (게시물번호, 제목, 조회수 보여짐)
	 * */
	List<Board> selectAll();
	
	/**
	 * 게시글 상세보기
	 * : Long boardNo(pk) 게시물번호를 인수로 받음
	 */
	Board selectByBoardNo(Long boardNo);	
	
	/**
	 * 아티스트별 게시판 검색
	 * : 아티스트 아이디로 전체 board 검색
	 */
	List<Board> selectByUsers(Users users);
	
	/**
	 * 게시글 등록(아티스트, 관리자가 작성)
	 * : 아이디, 제목, 내용, 이미지(없어도 됨), 작성일, 좋아요 수(기본 0으로)
	 * */
	void insertBoard(Board board, Users users);

    /**
     * 게시글 삭제하기
     * : Long boardNo(pk) 게시물번호를 인수로 받음
     * */
    void deleteBoard(Long boardNo);

    /**
     * 좋아요한 글 모아보기
     * 인수: userId
     * like 테이블과 조인 or 서브 쿼리
     */
    List<Board> selectByUserId(String userId);
       
    /**
     * 좋아요 기능
     * */
    int isLike(Likes likes);
    
    /**
     * 좋아요 늘리기
     * : Long boardNo
     * */
    void increaseLikeNo(Likes likes);
    
    /**
     * 좋아요 줄이기
     * : Long boardNo
     * */
    void decreaseLikeNo(Likes likes);
    
    
    
}










