package web.mvc.dto;

import javax.annotation.Nonnull;

import com.querydsl.core.annotations.QueryProjection;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Stats {
	//월별 매출
	private String month; //to_char로 String 설정
	private Long totalPrice; //sum
	
	//앨범 매출 -> 현재로서는 수량만 사용
	private Long albumTotalPrice; //sum
	private Long albumTotalQty; //sum
	
	//회원 수
	private Long allusers; //count
	private Long normalusers; //count
	private Long memberusers; //count
}
