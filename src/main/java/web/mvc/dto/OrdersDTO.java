package web.mvc.dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import web.mvc.domain.Orderdetails;
import web.mvc.domain.Users;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDTO {
	private Long ordersNo;
	
	private Users users;
	
	private String ordersReceiverName;
	private String ordersReceiverPhone;
	private String ordersAddr;
	private String ordersZipcode; 
	private String ordersStatus;
	
	private LocalDateTime ordersDate;
	
	private List<Orderdetails> orderdetailsList;
	
	private int amount;
}
