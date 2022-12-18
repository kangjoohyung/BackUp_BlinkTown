package web.mvc.session;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import web.mvc.dto.Cart;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Session {

	private String sessionId;
	private List<Cart> cartList;

	@PostConstruct
	public void init() {
		cartList = new ArrayList<Cart>();
	}

}
