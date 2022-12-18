package web.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.mvc.domain.Product;
import web.mvc.dto.Cart;
import web.mvc.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService service;

	/**
	 * 장바구니 조회
	 */
	@RequestMapping("/select")
	public String selectCartList() {
		return "shop/cart";
	}

	/**
	 * 장바구니 넣기
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public boolean insertCart(HttpSession session, Product product, Integer qty) {

		Cart cart = new Cart(product, (product.getProductPrice() * qty), qty);
		List<Cart> cartList = service.insertCart(session, cart);
		session.setAttribute("cartList", cartList);
		return true;
	}

	/**
	 * 장바구니 삭제
	 */
	@RequestMapping("/deleteAll")
	public String deleteAllCart(HttpSession session) {
		service.deleteAllCart(session);

		return "redirect:/cart/select";
	}

	@RequestMapping("/deleteOne")
	@ResponseBody
	public boolean deleteCart(HttpSession session, @RequestBody List<String> productCodes) {
		service.deleteCart(session, productCodes);
		return true;
	};

	/**
	 * 사용자 제거 - 로그아웃 메소드에 추가
	 */
	public void deleteSession(HttpSession session) {
		service.deleteSession(session);
	}

}
