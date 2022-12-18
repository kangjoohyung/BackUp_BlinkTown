package web.mvc.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



import web.mvc.domain.Board;
import web.mvc.domain.Likes;
import web.mvc.domain.LikesID;
import web.mvc.domain.Reply;
import web.mvc.domain.Users;
import web.mvc.service.BoardService;
import web.mvc.service.LikesService;
import web.mvc.service.ReplyService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private LikesService likesService;
	
	
	/**
	 * 전체 검색 페이지
	 * */
	@RequestMapping("/board/main") 
	public void list(Model model) { 
		List<Board> boardList = boardService.selectAll(); 
		model.addAttribute("mainPageList", boardList);
		
		/**
		 * 아티스트별 게시판
		 * */
		//1) 지수 담기
		Users jisoo=Users.builder().usersId("JISOO♥").build();
		List<Board> jisooList = boardService.selectByUsers(jisoo);
		model.addAttribute("jisooList", jisooList);
		
		//2) 제니 담기
		Users jennie=Users.builder().usersId("JENNIE♥").build();
		List<Board> jennieList = boardService.selectByUsers(jennie);
		model.addAttribute("jennieList", jennieList);
		
		//3) 로제 담기
		Users rose=Users.builder().usersId("ROSE♥").build();
		List<Board> roseList = boardService.selectByUsers(rose);
		model.addAttribute("roseList", roseList);
		
		//4) 리사 담기
		Users lisa=Users.builder().usersId("LISA♥").build();
		List<Board> lisaList = boardService.selectByUsers(lisa);
		model.addAttribute("lisaList", lisaList);
	}
	

	/**
	 * 상세보기
	 * */
	@RequestMapping("/board/details/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo) {
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Board board = boardService.selectByBoardNo(boardNo);

		//글번호를 현재 로그인한 사용자가 like 한 상태인지를 가져오기
		Likes likes =likesService.selectLike(new LikesID(boardNo, users.getUsersId()));
		ModelAndView mv = new ModelAndView("board/details");
		mv.addObject("board", board);
		
		if(likes!=null)mv.addObject("likes","ok");

		return  mv;
	}
	
	
	/**
	 * 게시글 등록폼
	 * */
	@RequestMapping("/admin/boardInsertForm")
	public void write() {}

	
	/**
	 * 파일등록을 포함한 게시물등록하기
	 * */
	@RequestMapping("/admin/upload")
	public ModelAndView insertBoard(Board board, MultipartFile file, HttpSession session) {
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String saveDir = session.getServletContext().getRealPath("/save/boardImg");
		String originalFileName = file.getOriginalFilename();
		
		try {
			file.transferTo(new File(saveDir+ "/" + originalFileName));
		 
		}catch (Exception e) {
			e.printStackTrace();
		}

		board.setBoardImg("boardImg/"+originalFileName);
		
		boardService.insertBoard(board, users);
		
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("redirect:/board/main");
		return mv;
	}
		
	
	/**
	 * 게시글 삭제하기
	 * */
	@RequestMapping("/board/delete")
	public String delete(Long boardNo) {
		boardService.deleteBoard(boardNo);
		return "redirect:/board/main";
	}
	
	@RequestMapping("{url}")
	public void url() {}
	
	
	/**
	 * 좋아요 기능 눌렀을 때 좋아요가 변경되는 기능
	 * */
	@RequestMapping("/board/likes")
	@ResponseBody
	public int isLike(Likes likes) {
		int likesedCount = boardService.isLike(likes);
		return likesedCount;		
	}
	
	
	/**
	 * 좋아요 표시한 글 모아보기
	 * */
	@RequestMapping("/mypage/likeList") 
	public void selectByUserId(Model model, String userId) {
		List<Board> likesBoardList = boardService.selectByUserId(userId);
		model.addAttribute("likesList",likesBoardList);
	}
	
}
