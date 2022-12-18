package web.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import web.mvc.dto.Cart;

@Service
public class CartServiceImpl implements CartService {

	/**
	 * 장바구니 넣기
	 */
	public List<Cart> insertCart(HttpSession session, Cart cart) {
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
		
		if (cartList == null) {
			cartList = new ArrayList<Cart>();
			cartList.add(cart);
		} else {
			modifyCart(cartList, cart);
		}
		
		return cartList;
	}

	private void modifyCart(List<Cart> cartList, Cart cart) {
		// 객체 추가
		boolean state = false;

		if(cartList.isEmpty())
			state = true;
		
		for (Cart sessionCart : cartList) {
			if (sessionCart.getProduct().getProductCode().equals(cart.getProduct().getProductCode())) {

				sessionCart.setCartPrice(cart.getCartPrice() + sessionCart.getCartPrice());
				sessionCart.setCartQty(cart.getCartQty() + sessionCart.getCartQty());
				break;
			} else
				state = true;
		}

		if (state) {
			cartList.add(cart);
		}

	}


	/**
	 * 장바구니 전체삭제
	 */
	public void deleteAllCart(HttpSession session) {
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
		cartList.clear();
	}

	/**
	 * 장바구니 개별삭제
	 */
	public void deleteCart(HttpSession session, List<String> productCodes) {
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
		List<Cart> deleteList = new ArrayList<Cart>();
		for (Cart cart : cartList) {
			for(String productCode:productCodes) {
				if(productCode.equals(cart.getProduct().getProductCode())) {
					deleteList.add(cart);
				}
			}
		}
		cartList.removeAll(deleteList);
	}

	/**
	 * 로그아웃
	 */
	@Override
	public void deleteSession(HttpSession session) {
		session.invalidate();
	}

}
