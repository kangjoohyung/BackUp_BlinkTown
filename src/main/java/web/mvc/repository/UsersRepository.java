package web.mvc.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;
import web.mvc.domain.Users;
import web.mvc.domain.Users.UsersBuilder;


public interface UsersRepository extends JpaRepository<Users, String>,QuerydslPredicateExecutor<Users> { 
	// JpaRepository<Entity이름, pk타입> QuerydslPredicateExecutor<Entity이름>

	
	
	//이메일 중복여부확인 때 사용, 카카오 중복확인
	Optional<Users> findByUsersEmail(String usersEmail);
	
	//전화번호 중복여부확인 때 사용
	Users findByUsersPhone(String usersPhone);
	
	//닉네임 중복여부확인 때 사용
	Users findByUsersNickName(String usersNickName);
	
	//유무료 회원 조회할 때 
	List<Users> findByUsersMemberShipOrderByUsersRegDateDesc(int usersmemebership);

	//카운트
	Long countByUsersMemberShip(int usersMemberShip);
}


