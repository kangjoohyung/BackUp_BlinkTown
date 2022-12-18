package web.mvc.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import web.mvc.domain.Authority;
import web.mvc.domain.Users;
import web.mvc.repository.AuthoritiesRepository;
import web.mvc.repository.UsersRepository;
import web.mvc.service.UsersServiceImpl;

/**
 * 인증을 처리할 클래스
 **/
@Service //id= "userAuthenticationProvider"
public class UserAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private  UsersRepository usesRep;
	
	@Autowired
	private  AuthoritiesRepository authoritiesRep;
	
	@Autowired
	private  PasswordEncoder passwordEncoder;

	/**
	 * 로그인 폼에서 전달된 userName(=id)과 password가 userNamePasswordAuthenticationToken객제로 만들어져서
	 * 인수 Authentication객체에 전달된다.
	 * 전달된 인인수에서userName과 password를 꺼내서 db에 있는 정보와 같은지 확인하고 다르면 인증실패
	 * 만약, 정보가 같으면 인증된 사용자의 정보를 
	 * Authentication의 구현체인 userNamePasswordAuthenticationToken을 생성해서 저장 후 리턴해준다. 
	 * */
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String usersId = authentication.getName();
		System.out.println("usersId = " + usersId);
		 Users users = usesRep.findById(usersId).orElse(null);
		 if(users==null) {
	            throw new UsernameNotFoundException(usersId+" 없는 아이디 입니다.");
	        }
		 
		//평문과 암호화된 비번을 체크
		String pass= (String)authentication.getCredentials().toString();
		
		if(!passwordEncoder.matches(pass, users.getUsersPwd())) {
			throw  new UsernameNotFoundException("비밀번호 오류입니다.");
		}
		
		//인증된 사용자의 권한 조회 
		List<Authority> authorityList =  authoritiesRep.findByUsers(users);
		System.out.println("authorityList = " + authorityList);
		
		 //나온 authorityListfmf security의 권한타입(grantedAuthority)에 맞게 형변환
		List<SimpleGrantedAuthority> simpleAuthList = new ArrayList<SimpleGrantedAuthority>();
		for(Authority authority:authorityList) {
			simpleAuthList.add(new SimpleGrantedAuthority(authority.getAuthorityRole()));
			
		}
		
		//인증성공했으니 인증된 사용자의 정보를 userNamePasswordAuthenticationToken에 저장
		
		UsernamePasswordAuthenticationToken auth = 
				new UsernamePasswordAuthenticationToken(users, null, simpleAuthList);
		
		return auth;
	} 

	/**
	 * 인수로 전달된 인증정보가 인증할 수 있는 유효한 객체인지를 판단해주는 메소드
	 * true리턴하면 authenticate 메소드 호출 / false이면 authenticate 메소드 호출XX
	 * */
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
