package web.mvc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.mvc.domain.Authority;
import web.mvc.domain.Users;

public interface UsersService  {
	
	/**
	 * 회원등록
	 * (domain)Users
	 * usersId,usersPwd,usersPwdCheck,usersPhone,usersEmail,
	 * usersNickName,usersMemberShip,usersRegDate
	 * */
	Users insertUser(Users users) throws Exception;
	
	/**join 중복체크*/
 
    boolean UsersIdCheck(String UsersId) throws Exception;
    boolean UsersEmailCheck(String UsersEmail) throws Exception;
    boolean UsersNickCheck(String UsersNickName) throws Exception;
    boolean UsersPhoneCheck(String phone_number) throws Exception;
	
	
	
	/**
	 * 회원수정
	 * (domain)Users
	 * usersPwd,usersEmail,usersNickName 수정가능
	 * */
	Users updateUsers(Users users , String passwordchk);
	//Users updateUsers(HttpServletRequest request, Users users);

	
	/**
	 * 회원삭제
	 * usersPwd를 인수로 받아서  db랑 비교하고 맞으면 삭제한ㄷ.
	 *  usersId는 Authentiation에서 가져온다.
	 * */
	void deleteByUsersId(String usersPwd);
	
	/**
	 * 회원 전체조회
	 * */
	List<Users> selectAll();
	
	/**
	 * usersId에 해당하는 회원조회
	 * */
	 Users selectByUsersId(String userId);
	 
	 /**
	  * usersEmail레 해당하는 회원조회 (카카오 회원가입 시 중복체크)
	  * */
	 Users selectbyUserEmail(String usersEmail);
	
	/**
	 * 멤버쉽 유무에 따른 유/무료 회원 조회
	 * */
	 List<Users> selectByUsersMemberShip(Integer usersMemberShip);
	 
	    /**
	     * 멤버쉽으로 승급
	     * 주문-멤버쉽카드 구매시 유저의 멤버쉽 업데이트
	     */
	 void updateUsersMemberShip(Users users, boolean willMember);

	/**
	 * 회원 수 조회 (일반/멤버쉽)
	 */
	 Long countUsers(int usersMemberShip);
	 
	 /**권한 가져오기 */
	 List<Authority> findByUsers(Users users);
}
