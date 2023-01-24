package web.mvc.repository;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Orders;
import web.mvc.domain.Users;

public interface OrdersRepository extends JpaRepository<Orders, Long> , QuerydslPredicateExecutor<Orders> {

	/**
	 * 마이페이지-주문내역조회 -> 메인페이지
	 * 출력용 주문10개 조회
	 */
	Page<Orders> findByUsers(Users users, Pageable pageable);
	
	/**
	 * 마이페이지 List로 출력
	 */
	List<Orders> findByUsersOrderByOrdersDateDesc(Users users);
	
	/**
	 * 마이페이지-주문상세조회 / 페이징 처리
	 * : 기간 조건별 최근순 주문내역 조회
	 * -> ~부터 ~까지 (입력시 +1로 넣기)
	 */
	Page<Orders> findByUsersAndOrdersDateGreaterThanEqualAndOrdersDateLessThan(Users users, LocalDateTime startDate, LocalDateTime finalDate, Pageable pageable);

	/**
	 * 전체 주문 조회->user id not null인 경우로 조건 넣기
	 */
	List<Orders> findByUsersIsNotNullOrderByOrdersDateDesc();
	
	/** 배송상태로 주문목록 조회 */
	List<Orders> findByOrdersStatusOrderByOrdersDateDesc(String status);
}
