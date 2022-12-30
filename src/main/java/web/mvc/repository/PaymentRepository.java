package web.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import web.mvc.domain.Orders;
import web.mvc.domain.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long>{

	/**
	 * Orders(컬럼은 orders_no) orders 로 payment List받기
	 * 최근 순으로 조회
	 */
	List<Payment> findByOrdersOrderByPaymentDateDesc(Orders orders);
}
