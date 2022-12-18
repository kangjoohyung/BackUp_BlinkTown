package web.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;

public interface OrderdetailsRepository extends JpaRepository<Orderdetails, Long> , QuerydslPredicateExecutor<Orderdetails> {
	
	/**
	 * 주문 내역 클릭시 해당 주문 코드로 주문 상세 내역 조회
	 * 리턴 정보 : 주문+주문 상세+상품
	 */
//	Page<Orderdetails> findByOrders(Orders orders, Pageable pageable);
	List<Orderdetails> findByOrders(Orders orders);
}
