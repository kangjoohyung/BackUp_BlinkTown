package web.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import web.mvc.domain.Album;
import web.mvc.domain.Authority;
import web.mvc.domain.Board;
import web.mvc.domain.Users;

public interface AuthoritiesRepository extends JpaRepository<Authority, Long>{
	
	//insert 하기 (save)
	
	/**
	 *userId에 해당하는 권한 검색.
	 * */
	List<Authority> findByUsers(Users users);

	 /**
	  * 업데이트 원복할 때 필요한 멤버 권한 조회-이후 삭제
	  */
	Authority findByUsersAndAuthorityRole(Users users, String authorityRole);
}
