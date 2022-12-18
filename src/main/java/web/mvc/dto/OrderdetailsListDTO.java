package web.mvc.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import web.mvc.domain.Orderdetails;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
//@ToString(exclude = "orderdetailsList")
public class OrderdetailsListDTO {
 private List<Orderdetails> orderdetailsList;
// private List<Cart> cartList;
}
