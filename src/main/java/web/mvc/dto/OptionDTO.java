package web.mvc.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import web.mvc.domain.Users;
import web.mvc.domain.Orders;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OptionDTO {
	private List<Integer> optionCode; //optionCode.size 로 중복 체크
	private Integer statusNumber;
//	private Users users; //users.usersId , users.usersNickName
    private String usersId; 
    private String usersNickName;
//    private Orders orders; //orders.ordersNo
	private Long OrdersNo;
	private String startDate;
	private String finalDate;
}
