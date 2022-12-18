package web.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web.mvc.domain.Users;
import web.mvc.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	private UsersService usersService;

	// 회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Autowired
	private PasswordEncoder passwordEncoder;

	/** 등록하기 */

	// Id 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(String usersId) throws Exception {
		// System.out.println("id체크시직"+usersId);
		boolean result = usersService.UsersIdCheck(usersId);
		return result;
	}

	// 이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public boolean emailCheck(String usersEmail) throws Exception {
		boolean result = usersService.UsersEmailCheck(usersEmail);
		return result;
	}

	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public boolean nickCheck(String usersNickName) throws Exception {
		boolean result = usersService.UsersNickCheck(usersNickName);
		return result;
	}

	// 전화번호 중복체크
	@ResponseBody
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.POST)
	public boolean phoneCheck(String usersPhoneNumber) throws Exception {
		boolean result = usersService.UsersPhoneCheck(usersPhoneNumber);
		return result;
	}

	// 회원가입하기
	@RequestMapping(value = "/signup2", method = RequestMethod.POST)
	public String registerPOST(Users users) throws Exception {
		usersService.insertUser(users);
		return "redirect:/users/sucess/signup";
	}

	/**
	 * 회원가입 성공 메세지 연결용
	 */
	@RequestMapping("/sucess/signup")
	public String signupSuccess(Model model) {
		model.addAttribute("message", "회원가입되셨습니다 *^^*");
		model.addAttribute("url", "/users/loginForm");
		model.addAttribute("urlName", "로그인하러 가기");

		System.out.println(" 회원가입 성공 메세지 오니???");
		return "/success/success";

	}

	/**
	 * 가입 폼
	 */
	@RequestMapping("/signup")
	public String moveForm() {
		return "/system/signup";
	}

	// 로그인하기
	@RequestMapping("/loginForm")
	public String moveLoginForm() {
		return "/system/loginForm";
	}
	
	/**
	 *예외처리
	 **/
	/*
	 * @ExceptionHandler(Exception.class) public ModelAndView error(Exception e) {
	 * return new ModelAndView("error/error","message",e.getMessage()); }
	 */
///////////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 수정하기
	 */
	/** 상세 회원정보 조회 */
	@RequestMapping("/findUser")
	public String selectByUsersId() {

		return "mypage/userInfo";
	}

	/**
	 * 회원정보 수정하기
	 */
	@RequestMapping("/updateUserAction")
	public ModelAndView updateMemberAction(Users users, String passwordchk) {
		System.out.println(" Users  :: " + users);
		System.out.println("getUsersPwd" + users.getUsersPwd());
		System.out.println("getUsersEmail" + users.getUsersEmail());
		System.out.println("getUsersId" + users.getUsersId());
		System.out.println("getUsersNickName" + users.getUsersNickName());
		System.out.println("getUsersPhone" + users.getUsersPhone());
		usersService.updateUsers(users, passwordchk);

		return new ModelAndView("mypage/userInfo");
	}

	/** 수정폼 */
	/*
	 * @RequestMapping("/updateForm") public ModelAndView updateForm(String usersId)
	 * { Users users = usersService.selectByUsersId(usersId);
	 * 
	 * return new ModelAndView("users/update", "users", users); }
	 */

	/** 수정 완료하기 */
	/*
	 * @RequestMapping("/update") public String updateUsers(Users users , String
	 * passwordchk) {
	 * 
	 * Users dbUser = usersService.updateUsers(users , passwordchk);
	 * 
	 * 
	 * return "mypage/userInfo"; }
	 */

	/** 탈퇴하기 */
	@RequestMapping("/delete")
	private String deleteByUsersId(String usersPwd) {
		usersService.deleteByUsersId(usersPwd);
		return "redirect:/";
	}

	/** 관리자 - 회원 리스트보기 */
	@RequestMapping("/select../{usersMemberShip}") // /select?usersMemberShip=1
	public ModelAndView read(@PathVariable Integer usersMemberShip) { // int는 null값을 허용하지 않기 때문에 Integer 사용

		// usersMemberShip == null -> selectAll
		// usersMemberShip != null -> selectByUsersMemberShip

		List<Users> users = usersService.selectByUsersMemberShip(usersMemberShip);

		return new ModelAndView("board/read", "board", users);
	}

}
