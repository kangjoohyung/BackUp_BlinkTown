package web.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import web.mvc.dto.Cart;

public interface CartService {


	/**
	 * 장바구니 넣기
	 * 
	 * @param sessionId
	 * @param cart
	 */
	List<Cart> insertCart(HttpSession session, Cart cart);

	/**
	 * 사용자 로그아웃
	 * 
	 * @param session
	 */
	void deleteSession(HttpSession session);

	/**
	 * 장바구니 전체삭제
	 * 
	 * @param sessionId
	 */
	void deleteAllCart(HttpSession session);

	/**
	 * 장바구니 개별삭제
	 * 
	 * @param sessionId
	 * @param productCode
	 */
	void deleteCart(HttpSession session, List<String> productCode);

}
