package web.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="Payment_gen")
	@SequenceGenerator(name="Payment_gen", allocationSize=1, sequenceName="Payment_seq")
	private Long paymentNo;
	
	private String impUid; //결제후 전달받는 결제번호

	private int countPrice; //결제 금액 및 취소금액
	
//	@ManyToOne(fetch = FetchType.LAZY)
	@ManyToOne
	@JoinColumn(name="orders_no")
	private Orders orders; //양방향 설정후 cascade설정->차후 주문목록 조회시 편리하게 조회할 예정
	
//	@OneToOne(fetch = FetchType.LAZY)
	@OneToOne //기본eager
	@JoinColumn(nullable = true, name="orderdetails_no")
	private Orderdetails orderdetails;
	
	@CreationTimestamp//(수정이 아닌 추가 레코드 생성이기에 Creation으로 사용-UpdateTimestamp사용안함)
	private LocalDateTime paymentDate; //결제 및 변동-추가사항에 관한 시간
	
}
