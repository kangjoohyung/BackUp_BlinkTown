package web.mvc.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.querydsl.jpa.impl.JPAQueryFactory;
import web.mvc.domain.Authority;
import web.mvc.util.RoleConstants;
import lombok.RequiredArgsConstructor;
import web.mvc.domain.Users;
import web.mvc.repository.AuthoritiesRepository;
import web.mvc.repository.UsersRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class UsersServiceImpl implements UsersService {


	
	private final UsersRepository usersRep;
	
	private final AuthoritiesRepository authoritiesRep;

	private final PasswordEncoder encoderPwd;
	
	
	
	
	@Autowired
	private JPAQueryFactory queryFactory;

	//회원가입 
	@Override
	public Users insertUser(Users users) throws Exception {
		//전달된 비밀번호(평문)을 암호화
		String rawPwd = users.getUsersPwd();//원문
		String enPwd = encoderPwd.encode(rawPwd);//해쉬
		users.setUsersPwd(enPwd);
		
		 Users dbUser=usersRep.save(users);
		 authoritiesRep.save(
				 Authority.builder().users(dbUser)
				 .authorityRole(RoleConstants.ROLE_USER).build());
//		 (new Authority(null, users.getUsersId(),RoleConstants.ROLE_USER));
		 System.out.println("가입 부분 서비스 입니다.");
         return dbUser;
	}

	// true면 중복
	// 아이디 중복체크
	@Override
	public boolean UsersIdCheck(String usersId) throws Exception {
		boolean result = false;

		Users users = usersRep.findById(usersId).orElse(null);
		if (users != null)
			result = true;

		return result;

	}
	
	// true면 중복
	// 메일 중복체크
	@Override
	public boolean UsersEmailCheck(String UsersEmail) throws Exception {
		boolean result = false;
		
		Users users = usersRep.findByUsersEmail(UsersEmail).orElse(null);
		if (users != null)
			result = true;
		return result;
	}
	// true면 중복
	// 닉네임 중복체크
	@Override
	public boolean UsersNickCheck(String UsersNickName) throws Exception {
		boolean result = false;
		
		Users users = usersRep.findByUsersNickName(UsersNickName);
		if (users != null)
			result = true;
		return result;
	}
	// true면 중복
	// 전화번호 중복체크
	@Override
	public boolean UsersPhoneCheck(String UsersPhone) throws Exception {
		boolean result = false;
		
		Users users = usersRep.findByUsersPhone(UsersPhone);
		if (users != null)
			result = true;
		return result;
	}
	//회줭정보 수정
	@Override
	public Users updateUsers(Users users , String passwordchk) {
		
		//변경할 비밀번호를 암호화한다 
		
		
		Users dbUsers = usersRep.findById(users.getUsersId()).orElse(null);
		//기존 비번하고 입력한 비번이 같은지 체크 
		if(!encoderPwd.matches(passwordchk, dbUsers.getUsersPwd())){
		   throw new RuntimeException("비밀번호가 맞지 않아 수정 할수 없습니다.");
		}
		
		//Db수정
		String encodePassword=encoderPwd.encode(users.getUsersPwd());
		dbUsers.setUsersPwd(encodePassword);//암호화!!!
		dbUsers.setUsersEmail(users.getUsersEmail());
		dbUsers.setUsersNickName(users.getUsersNickName());
		
		//회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		Users user=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// 수정
		user.setUsersPwd(encodePassword);
		user.setUsersEmail(users.getUsersEmail());
		user.setUsersNickName(users.getUsersNickName());

		return dbUsers;
	}
	
	//회원탈퇴
	@Override
	public void deleteByUsersId(String usersPwd) {
		Users user=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Users dbUsers = usersRep.findById(user.getUsersId()).orElse(null);
		
		if(!encoderPwd.matches(usersPwd, dbUsers.getUsersPwd())){
			   throw new RuntimeException("비밀번호가 맞지 않아 삭제 할수 없습니다.");
		 }
		
		usersRep.deleteById(dbUsers.getUsersId());
	}
	
	//Email로 회원찾기 (카카오 회원가입시 중복체크 시 사용)
	//@Transactional
	public Users selectbyUserEmail(String usersEmail) {
		Optional<Users> users = usersRep.findByUsersEmail(usersEmail);
		
		return users.orElseGet(Users::new);
	}
	
	//관리자 회원 전체조회
	@Override
	public List<Users> selectAll() {
		 return usersRep.findAll(Sort.by(Sort.Direction.DESC, "usersRegDate"));
	}
	
	//관리자 회원정보 상세보기
	@Override
	public Users selectByUsersId(String usersId) {
		
		Users dbUsers = usersRep.findById(usersId).orElse(null);
		return dbUsers;
	}
	
	//맴쉽  유/무료회원 조회
	//0이면 무료, 1이면 유료, null 이면 전체 회원 검색
	
	public List<Users> selectByUsersMemberShip(Integer usersMemberShip) {
		
		List<Users> usersList=null;
		//usersMemberShip이 null이면 전체조회
		if(usersMemberShip==null) {
			usersList=usersRep.findAll(Sort.by(Sort.Direction.DESC, "usersRegDate"));
		}else{ //null이 아닌 경우
			//membership(0 또는 1에 해당하는 user조회
			usersList=usersRep.findByUsersMemberShipOrderByUsersRegDateDesc(usersMemberShip);
		}
		return usersList;
	}
	
	
	 //주문-멤버쉽업데이트
	   @Override
	   public void updateUsersMemberShip(Users users, boolean willMember) {
		  if(willMember==true) { //멤버쉽카드 구매시 회원 정보 업데이트, 권한 설정
			 users.setUsersMemberShip(1);
			 authoritiesRep.save(
					 Authority.builder().users(users)
					 .authorityRole(RoleConstants.ROLE_MEMBER).build());
		  }
		  else { //멤버쉽카드 구매 오류로 원복할 시 회원 정보 원복, 권한 다시 삭제
			  users.setUsersMemberShip(0);
			  Authority deleteAuthority=authoritiesRep
					  .findByUsersAndAuthorityRole(users, RoleConstants.ROLE_MEMBER);
			  authoritiesRep.delete(deleteAuthority);
		  }
	   }

	@Override//회원카운트
	public Long countUsers(int usersMemberShip) {
		return usersRep.countByUsersMemberShip(usersMemberShip);
	}

	@Override
	public List<Authority> findByUsers(Users users) {
		
		return authoritiesRep.findByUsers(users);
	}
}