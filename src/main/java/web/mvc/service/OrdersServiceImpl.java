package web.mvc.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;
import web.mvc.domain.Payment;
import web.mvc.domain.Product;
import web.mvc.domain.Users;
import web.mvc.repository.OrderdetailsRepository;
import web.mvc.repository.OrdersRepository;
import web.mvc.repository.PaymentRepository;
import web.mvc.repository.ProductRepository;
import web.mvc.repository.UsersRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class OrdersServiceImpl implements OrdersService {
	
	private final OrdersRepository ordersRep;
	private final ProductRepository productRep;
	private final OrderdetailsRepository orderdetailsRep;
	private final UsersRepository userRep;
	private final PaymentRepository paymentRep;
	
	private final UsersService usersService;
	private final ProductService productService;
	
	//멤버쉽카드 상품코드 입력해야 함 ("멤버쉽카드의 상품코드")->M01

	@Override
	public List<Orders> selectAllOrdersAdmin() {
//		List<Orders> ordersList=ordersRep
//				.findAll(Sort.by(Sort.Direction.DESC,"ordersDate"));
		List<Orders> ordersList=ordersRep.findByUsersIsNotNullOrderByOrdersDateDesc();
		return ordersList;
	}

	@Override
	public List<Orders> selectByUsers(Users users) {
		List<Orders> ordersList=ordersRep.findByUsersOrderByOrdersDateDesc(users);
		return ordersList;
	}
	
	@Override
//	public List<Orders> selectAllOrders(int inCase, Users users, String startDate, String finalDate) {
	public Page<Orders> selectAllOrders(int inCase, Users users, String startDate, String finalDate, Pageable pageable) {
		Page<Orders> ordersList=null;
//		List<Orders> ordersList=ordersRep.findAll(Sort.by(Sort.Direction.DESC,"ordersDate"));
		
		if(inCase==1) { //관리자페이지-main 주문내역(페이징처리)
			ordersList=ordersRep.findAll(pageable);
		}else if(inCase==2) {
			ordersList=ordersRep.findByUsers(users, pageable);
		}else if(inCase==3) { //마이페이지-기간별 주문내역 조회	
			//String형식을 LocalDateTime으로 변환
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd HH:mm:ss");
			
			LocalDateTime dateStartDate=null;
			LocalDateTime dateFinalDate=null;
			LocalDateTime finalPlus=null;
			try {
				dateStartDate=LocalDateTime.parse(startDate+" 00:00:00", formatter);
				dateFinalDate=LocalDateTime.parse(finalDate+" 00:00:00", formatter);
				finalPlus=dateFinalDate.plusDays(1);
			}catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("날짜 형식을 확인해주세요 ex)20221128");
			}
			ordersList=ordersRep
					.findByUsersAndOrdersDateGreaterThanEqualAndOrdersDateLessThan
					(users, dateStartDate, finalPlus, pageable);
		}
		return ordersList;
	} //selectAllOrders end

	@Override
	public List<Orderdetails> selectAllOrderdetails(Long ordersNo) {
		Orders orders=ordersRep.findById(ordersNo).orElse(null);
		List<Orderdetails> orderdetailsList=orderdetailsRep.findByOrders(orders);
		return orderdetailsList;
	} //selectAllOrdersdetails end
	
	/* 재고량 체크 */
	@Override 
//	public void selectCheckBeforeOrders(Users users, Orders orders, List<Cart> cartList) {
	public void selectCheckBeforeOrders(Users users, Orders orders) {
//		for(Cart cart : cartList){
//			// 상품 재고량이 주문 가능한 숫자인지 조회
//			Product product=productRep.findById(cart.getProduct().getProductCode()).orElse(null);
//			if(product.getProductStock()>=0){
//				if(cart.getProduct().getProductStock()>product.getProductStock() || product.getProductStock()==0)
//						throw new RuntimeException("상품 재고량이 부족합니다. 개수를 확인해주세요.");
//			}
//		}//재고량 체크 for문끝
		
		for(Orderdetails orderdetails : orders.getOrderdetailsList()){
			//1) 상품 재고량이 주문 가능한 숫자인지 조회
			Product product=productRep.findById(orderdetails.getProduct().getProductCode()).orElse(null);
			if(product.getProductStock()>=0){
				if(orderdetails.getProduct().getProductStock()>product.getProductStock() || product.getProductStock()==0)
						throw new RuntimeException("상품 재고량이 부족합니다. 개수를 확인해주세요.");
			}//2)상품정보가 멤버쉽 상품일때 멤버쉽 회원만 구매가능하게 조건설정
			if(product.getProductMembershipOnly()==1) {
				if(users.getUsersMemberShip()==0) throw new RuntimeException("멤버쉽 회원만 가능한 상품입니다");
			}
		}//재고량 체크 for문끝
	} //selectCheckBeforeOrders end

	@Override
//	public Orders insertOrdersOrderdetails(Users users, Orders ordersProduct, List<Cart> cartList) {
	public Orders insertOrdersOrderdetails(Users users, Orders ordersProduct) {
		//재고량 체크 메소드 호출하여 한 번 더 체크
//		this.selectCheckBeforeOrders(users, cartList);
		this.selectCheckBeforeOrders(users, ordersProduct);
		//이상없다면 Exception없이 빠져나옴
		
		String usersId=users.getUsersId();
		ordersProduct.setUsers(users);

		//1) 주문정보 insert
		Orders finishOrders=ordersRep.save(ordersProduct);
		
		//2) 상세 주문 정보 불러와서 insert 
		List<Orderdetails> orderdetailsList=finishOrders.getOrderdetailsList();
		for(Orderdetails beforedetails : orderdetailsList) {
			beforedetails.setOrders(finishOrders);
		}
		List<Orderdetails> finishOrderdetailsList=orderdetailsRep.saveAll(orderdetailsList);
		
		//3) 연관 정보 변경-상품/유저
		for(Orderdetails orderdetails : finishOrderdetailsList){
			//상품 수정 기능구현을 위한 상품 조회
			String getProdCode=orderdetails.getProduct().getProductCode();
			Product product=productRep.findById(getProdCode).orElse(null);
			//1)상품 멤버쉽카드라면 유저의 멤버쉽상태 변경+권한생성(member추가)
			if(getProdCode.equals("M01")){//상품코드 String
				Users dbUsers=userRep.findById(usersId).orElse(null);
				//(도윤님 서비스 메소드를 사용)
				usersService.updateUsersMemberShip(dbUsers, true);
			}
			//2)구매한 만큼의 재고량 감소(0이하거나 null일때는 작동 안 함)
			if(product.getProductStock()>0){
				//(보경님 상품 서비스 메소드를 사용)
				int qty=orderdetails.getOrderdetailsQty();
				productService.decreaseProductStock(getProdCode, qty);
			}
		}//연관 정보 변경 for문끝
		
		//주문번호로 결제호출 위해 컨트롤러로 리턴
		finishOrders.setOrderdetailsList(finishOrderdetailsList);
//		System.out.println("insert-service끝");//확인용
		return finishOrders;  
	} //insertOrdersOrderdetails end

	@Override
	public void verifyOrders(Long ordersNo, int verifyAmount, String status, String imp_uid) throws Exception {
		//비교하기 위해 총합계 꺼내기
		Orders orders=ordersRep.findById(ordersNo).orElse(null);
		List<Orderdetails> orderdetailsList=orders.getOrderdetailsList();
		int amount=0;
		for(Orderdetails orderdetails : orderdetailsList){
			amount+=orderdetails.getOrderdetailsPrice();
		}
//		amount=1000;//테스트용
		
		//총합계와 결제내역 비교하기
		if (amount==verifyAmount) {
			//성공시 주문상태 "결제완료"로 업데이트
			orders.setOrdersStatus(status);
		}else {
			System.out.println("금액 달라 삭제 호출");
			//DB금액과 결제금액이 다를 경우 주문 삭제 호출 : 보안상 위조된 값
			deleteOrders(ordersNo);
			//주문 삭제후 트랜젝션과는 관련 없는 Exception 일으키기
			throw new Exception("위조된 결제 시도 : FBI WARNING");
		}//검증실패시 기능 끝
		
		//결제정보 저장 메소드 호출
		insertPayment(orders, imp_uid, amount, null);
		
	}//verifyOrders end

	@Override
	public void deleteOrders(Long ordersNo) {
		System.out.println("삭제시작");//확인용 출력
		Orders orders=ordersRep.findById(ordersNo).orElse(null);
		List<Orderdetails> orderdetailsList=orders.getOrderdetailsList();
		//insert할때 변경했던 내용들 다시 원복
		for(Orderdetails orderdetails : orderdetailsList){
			//1) 멤버쉽 카드라면 다시 회원 정보의 멤버쉽유무 0으로 수정+권한 설정 원복(member삭제)
			if(orderdetails.getProduct().getProductCode().equals("M01")) {
				Users users=orders.getUsers();
				usersService.updateUsersMemberShip(users, false);
			}
			//2) 재고량 원복
			if(orderdetails.getProduct().getProductStock()>=0) {
				int qty=(0-orderdetails.getOrderdetailsQty());					
				productService.decreaseProductStock(orderdetails.getProduct().getProductCode(), qty);
			}
		}//주문관련 정보들 원복 끝
		ordersRep.delete(orders); //cascade설정으로 주문상세도 삭제됨
		System.out.println("삭제 끝");
	}

	@Override
	public void insertPayment(Orders orders, String imp_uid, int amount, Orderdetails orderdetails/*, Long orderdetailsNo*/) {
		if(orderdetails==null && amount>0) { 
			//최초 생성 및 주문상세 없을 때 : 결제 검증메소드에서 결제번호를 입력받음
			paymentRep.save(Payment.builder().impUid(imp_uid).countPrice(amount).orders(orders).build());
		}
		else if(orderdetails==null && amount<0) {
			//전체 환불의 경우 (주문상세 필요없어서 null일 때, 금액이-일 때)
			paymentRep.save(Payment.builder().impUid(imp_uid).countPrice(amount).orders(orders).build());
			//주문상세 테이블의 레코드 변경 : 전체 0으로
			List<Orderdetails> orderdetailsList=new ArrayList<Orderdetails>();
			orderdetailsList=orders.getOrderdetailsList();
			for(Orderdetails details : orderdetailsList) {
				details.setOrderdetailsPrice(0);//집계 안나오게 0처리
			}
		}
		else { //최초 이후 수정 : insert로 추가 레코드 생성, 상세주문 항목 추가, 금액이-이면서 부분환불
//			Orderdetails orderdetails=new Orderdetails();
//			orderdetails=orderdetailsRep.findById(orderdetailsNo);
			paymentRep.save(Payment.builder().impUid(imp_uid).countPrice(amount).orders(orders).orderdetails(orderdetails).build());
			//주문상세 테이블의 레코드 변경
			orderdetails.setOrderdetailsPrice(0);//집계 안나오게 0처리
		}
	}

}
