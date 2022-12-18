package web.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import web.mvc.domain.Product;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Cart {

	private Product product;

	private int cartPrice;
	private int cartQty;

}
