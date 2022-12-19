package web.mvc;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.type.LocalDateTimeType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.userdetails.User;
import org.springframework.test.annotation.Commit;

import web.mvc.domain.Authority;
import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;
import web.mvc.domain.Product;
import web.mvc.domain.Users;
import web.mvc.repository.AuthoritiesRepository;
import web.mvc.repository.OrderdetailsRepository;
import web.mvc.repository.OrdersRepository;
import web.mvc.repository.ProductRepository;
import web.mvc.repository.UsersRepository;
import web.mvc.service.ProductService;
import web.mvc.service.UsersService;
import web.mvc.util.RoleConstants;

@SpringBootTest
@Transactional
@Commit
class sampleDataOrder {

	@Autowired
	private OrdersRepository ordersRep;
	@Autowired
	private ProductRepository productRep;
	@Autowired
	private OrderdetailsRepository orderdetailsRep;
	@Autowired
	private UsersRepository userRep;
	@Autowired
	private ProductService productService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private AuthoritiesRepository authorRep;

	@Test
	void contextLoads() {
	}

	/**
	 * 테스트 샘플 레코드 생성용
	 * 1) 주문+상세
	 */
	@Test //월별로 넣기
	public void insertSampleOrders() {
		String usersId="user";
		String product1="A03";
		String album1="A06";//bornPink
		String album2="A05";
		String album3="A02";
		String album4="A01";
		
		for(int i=0; i<10; i++) {
			String dateS="2021-11";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<12; i++) {
			String dateS="2022-01";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<11; i++) {
			String dateS="2022-02";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<14; i++) {
			String dateS="2022-03";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<12; i++) {
			String dateS="2022-04";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<15; i++) {
			String dateS="2022-05";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<13; i++) {
			String dateS="2022-06";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<17; i++) {
			String dateS="2022-07";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<15; i++) {
			String dateS="2022-08";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<19; i++) {
			String dateS="2022-09";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<17; i++) {
			String dateS="2022-10";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<21; i++) {
			String dateS="2022-11";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}

		for(int i=0; i<25; i++) {
			String dateS="2022-12";
			saveOrdersMethod(dateS, i, usersId, product1, album1, album2, album3, album4);
		}
		//주문일자는 안먹힘...set으로 변경하기
	}
	
	@Test//주문일자 변경용
	public void modifyOrdersDate() {

		Long l=221L;
		
		for(int i=0; i<10; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2021-11";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=0; i<8; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-12";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=10; i<22; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-01";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=22; i<33; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-02";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=33; i<47; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-03";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=47; i<59; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-04";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=59; i<74; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-05";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=74; i<87; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-06";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=87; i<104; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-07";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=104; i<119; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-08";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=119; i<138; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-09";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=138; i<155; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-10";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=155; i<176; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-11";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

		for(int i=176; i<201; i++) {
			Orders orders=ordersRep.findById(l+i).orElse(null);
			
			String dateS="2022-12";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
			orders.setOrdersDate(dateC);
		}

	}
	
	public void saveOrdersMethod(String dateS, int i, String usersId,
			String pproduct1, String aalbum1, String aalbum2, String aalbum3, String aalbum4) {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		Users users=userRep.findById(usersId).orElse(null);
		Product product1=productRep.findById(pproduct1).orElse(null);
		Product album1=productRep.findById(aalbum1).orElse(null);
		Product album2=productRep.findById(aalbum2).orElse(null);
		Product album3=productRep.findById(aalbum3).orElse(null);
		Product album4=productRep.findById(aalbum4).orElse(null);
		
		LocalDateTime dateC=LocalDateTime.parse(dateS+"-01 00:00:00", formatter);
		Orders orders=Orders.builder().ordersReceiverName("주문자t"+i)
				.ordersAddr("서울시 용산구 배송지t"+i).ordersStatus("주문완료")
				.ordersReceiverPhone("t"+i).ordersZipcode("t"+i).users(users)
				.ordersDate(dateC).build();
		Orders afterOrders=ordersRep.save(orders);
		Orderdetails details1=Orderdetails.builder().orders(afterOrders).product(product1)
				.orderdetailsPrice(product1.getProductPrice()*1).orderdetailsQty(1).build();
		Orderdetails details2=Orderdetails.builder().orders(afterOrders).product(album1)
				.orderdetailsPrice(album1.getProductPrice()*1).orderdetailsQty(1).build();
		Orderdetails details3=Orderdetails.builder().orders(afterOrders).product(album2)
				.orderdetailsPrice(album2.getProductPrice()*2).orderdetailsQty(2).build();
		Orderdetails details4=Orderdetails.builder().orders(afterOrders).product(album3)
				.orderdetailsPrice(album3.getProductPrice()*3).orderdetailsQty(3).build();
		Orderdetails details5=Orderdetails.builder().orders(afterOrders).product(album4)
				.orderdetailsPrice(album4.getProductPrice()*4).orderdetailsQty(4).build();
		orderdetailsRep.save(details1);
		orderdetailsRep.save(details2);
		orderdetailsRep.save(details3);
		orderdetailsRep.save(details4);
		orderdetailsRep.save(details5);
	}
	
@Test /**회원정보,권한*/
	public void insert() {
		//멤버회원
		for(int i=1; i<=10; i++) {
			Users users=userRep.save(new Users("usersT"+i, "1111", "0t"+i, "usersT"+i+"@naver.com", "usersT"+i, 1, null));
			authorRep.save(Authority.builder().users(users).authorityRole(RoleConstants.ROLE_USER).build());
			authorRep.save(Authority.builder().users(users).authorityRole(RoleConstants.ROLE_MEMBER).build());
		}
		
		//일반회원
		for(int i=11; i<=30; i++) {
			Users users=userRep.save(new Users("usersT"+i, "1111", "0t"+i, "usersT"+i+"@naver.com", "usersT"+i, 0, null));
			authorRep.save(Authority.builder().users(users).authorityRole(RoleConstants.ROLE_MEMBER).build());
		}
	}

///////////////////////////////////////////////////////////////////////////////	
//@Test/**테스트완0.2->product*///
//void insertProduct() {
//	
//	productRep.save(Product.builder()
//			.productCode("A01")
//			.productName("상품1")
//			.productEngName("pro1")
//			.productStock(3000)
//			.productPrice(1000)
//			.productMainImg("이미지경로1-1")
//			.productDetailImg("이미지경로1-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A02")
//			.productName("상품2")
//			.productEngName("pro2")
//			.productStock(0)
//			.productPrice(1000)
//			.productMainImg("이미지경로2-1")
//			.productDetailImg("이미지경로2-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A03")
//			.productName("상품3")
//			.productEngName("pro3")
//			.productStock(-1)
//			.productPrice(1000)
//			.productMainImg("이미지경로3-1")
//			.productDetailImg("이미지경로3-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A04")
//			.productName("멤버쉽카드")
//			.productEngName("pro3")
//			.productStock(-1)
//			.productPrice(1000)
//			.productMainImg("이미지경로4-1")
//			.productDetailImg("이미지경로4-2")
//			.productReadNo(0)
//			.productMembershipOnly(1)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A05")
//			.productName("상품5")
//			.productEngName("pro5")
//			.productStock(3)
//			.productPrice(1000)
//			.productMainImg("이미지경로3-1")
//			.productDetailImg("이미지경로3-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A06")
//			.productName("상품6")
//			.productEngName("pro5")
//			.productStock(3)
//			.productPrice(1000)
//			.productMainImg("이미지경로3-1")
//			.productDetailImg("이미지경로3-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	
//}
//////////////////////////////////////////////////////////////////////////////////
//@Test
//public void insffertProduct() {	
//	productRep.save(Product.builder()
//			.productCode("A01")
//			.productName("피규어(제니)")
//			.productEngName("product1")
//			.productStock(3000)
//			.productPrice(28000)
//			.productMainImg("이미지경로1-1")
//			.productDetailImg("이미지경로1-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.productSize("15.7 x 14 x 22.5cm")
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A02")
//			.productName("피규어(지수)")
//			.productEngName("product2")
//			.productStock(200)
//			.productPrice(28000)
//			.productMainImg("이미지경로2-1")
//			.productDetailImg("이미지경로2-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.productSize("15.7 x 14 x 22.5cm")
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A03")
//			.productName("피규어(리사)")
//			.productEngName("product3")
//			.productStock(-1)
//			.productPrice(15000)
//			.productMainImg("이미지경로3-1")
//			.productDetailImg("이미지경로3-2")
//			.productReadNo(0)
//			.productMembershipOnly(1)
//			.productSize("15.7 x 14 x 22.5cm")
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A04")
//			.productName("멤버쉽카드")
//			.productEngName("product4")
//			.productStock(-1)
//			.productPrice(35000)
//			.productMainImg("이미지경로4-1")
//			.productDetailImg("이미지경로4-2")
//			.productReadNo(0)
//			.productMembershipOnly(1)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A05")
//			.productName("피규어(로제)")
//			.productEngName("product5")
//			.productStock(50)
//			.productPrice(20000)
//			.productMainImg("이미지경로5-1")
//			.productDetailImg("이미지경로5-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.productSize("15.7 x 14 x 22.5cm")
//			.build());
//	productRep.save(Product.builder()
//			.productCode("A06")
//			.productName("블랙핑크 포스터")
//			.productEngName("product6")
//			.productStock(3)
//			.productPrice(5000)
//			.productMainImg("이미지경로6-1")
//			.productDetailImg("이미지경로6-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.productSize("30 x 35cm")
//			.build());
//	productRep.save(Product.builder()
//			.productCode("B01")
//			.productName("BornPink")
//			.productEngName("BornPink")
//			.productStock(10000)
//			.productPrice(50000)
//			.productMainImg("BornPink이미지경로7-1")
//			.productDetailImg("BornPink이미지경로7-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("B02")
//			.productName("THEALBUM")
//			.productEngName("THEALBUM")
//			.productStock(10000)
//			.productPrice(45000)
//			.productMainImg("THEALBUM이미지경로8-1")
//			.productDetailImg("THEALBUM이미지경로8-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("B03")
//			.productName("KillThisLove")
//			.productEngName("KillThisLove")
//			.productStock(10000)
//			.productPrice(40000)
//			.productMainImg("KillThisLove이미지경로9-1")
//			.productDetailImg("KillThisLove이미지경로9-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//	productRep.save(Product.builder()
//			.productCode("B04")
//			.productName("SquareUp")
//			.productEngName("SquareUp")
//			.productStock(10000)
//			.productPrice(35000)
//			.productMainImg("SquareUp이미지경로10-1")
//			.productDetailImg("SquareUp이미지경로10s-2")
//			.productReadNo(0)
//			.productMembershipOnly(0)
//			.build());
//
//}
//
//	@Test/**테스트완0.1->users넣는건 성공*///
//	void insertUsers() {
//		userRep.save(Users.builder().usersId("user")
//				.usersPwd("1234")
//				.usersPhone("1234-12134")
//				.usersEmail("1234@1234.com")
//				.usersNickName("에라이")
//				.usersMemberShip(0)
//				.build());
//	}
//	
//	@Test/**테스트완0.2->product*///
//	void insertProduct() {
//		
//		productRep.save(Product.builder()
//				.productCode("A01")
//				.productName("상품1")
//				.productEngName("pro1")
//				.productStock(3000)
//				.productPrice(1000)
//				.productMainImg("이미지경로1-1")
//				.productDetailImg("이미지경로1-2")
//				.productReadNo(0)
//				.productMembershipOnly(0)
//				.build());
//		productRep.save(Product.builder()
//				.productCode("A02")
//				.productName("상품2")
//				.productEngName("pro2")
//				.productStock(0)
//				.productPrice(1000)
//				.productMainImg("이미지경로2-1")
//				.productDetailImg("이미지경로2-2")
//				.productReadNo(0)
//				.productMembershipOnly(0)
//				.build());
//		productRep.save(Product.builder()
//				.productCode("A03")
//				.productName("상품3")
//				.productEngName("pro3")
//				.productStock(-1)
//				.productPrice(1000)
//				.productMainImg("이미지경로3-1")
//				.productDetailImg("이미지경로3-2")
//				.productReadNo(0)
//				.productMembershipOnly(0)
//				.build());
//		productRep.save(Product.builder()
//				.productCode("A04")
//				.productName("멤버쉽카드")
//				.productEngName("pro3")
//				.productStock(-1)
//				.productPrice(1000)
//				.productMainImg("이미지경로4-1")
//				.productDetailImg("이미지경로4-2")
//				.productReadNo(0)
//				.productMembershipOnly(1)
//				.build());
//		productRep.save(Product.builder()
//				.productCode("A05")
//				.productName("상품5")
//				.productEngName("pro5")
//				.productStock(3)
//				.productPrice(1000)
//				.productMainImg("이미지경로3-1")
//				.productDetailImg("이미지경로3-2")
//				.productReadNo(0)
//				.productMembershipOnly(0)
//				.build());
//		productRep.save(Product.builder()
//				.productCode("A06")
//				.productName("상품6")
//				.productEngName("pro5")
//				.productStock(3)
//				.productPrice(1000)
//				.productMainImg("이미지경로3-1")
//				.productDetailImg("이미지경로3-2")
//				.productReadNo(0)
//				.productMembershipOnly(0)
//				.build());
//		
//	}
	
	@Test/**테스트중*/
	public void /* Page<Orders> */ selectAllOrders(/*
													 * int inCase, Users users, String startDate, String finalDate,
													 * Pageable pageable
													 */) {
		
		Page<Orders> ordersList=null;
//		String usersId=null;
		/**테스트(인수넣어서)*/
		Pageable pageable=PageRequest.of(0, 10, Direction.DESC, "ordersDate");
		Users users=userRep.findById("user").orElse(null);
		
		//////////////////////////////////////////////////////////
		String startDate="20221129 00:00:00";
		String finalDate="20221202 00:00:00";
		
		int inCase=3;
		
		////////////////////////////////////
		if(inCase==1) { //관리자페이지-main 주문내역(페이징처리)
			
			ordersList=ordersRep.findAll(pageable);
			
		}else if(inCase==2) { //마이페이지-main 주문내역 10개 출력용 메소드		
//			usersId=users.getUsersId();
//			Pageable mainPage=PageRequest.of(0, 10, Direction.DESC, "ordersDate");
			
//			ordersList=ordersRep.findByUsersId(users, mainPage);
			ordersList=ordersRep.findByUsers(users, pageable);
			
		}else if(inCase==3) { //마이페이지-기간별 주문내역 조회	
//			usersId=users.getUsersId();
			
			//String형식 날짜 Date로 변환
//			SimpleDateFormat dateFormat= new SimpleDateFormat ("yyyyMMdd");

			//String형식을 LocalDateTime으로 변환
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd HH:mm:ss");
			
			LocalDateTime dateStartDate=null;
			LocalDateTime dateFinalDate=null;
			LocalDateTime finalPlus=null;
			
			try {
//				dateStartDate=LocalDateTime.parse(startDate);
//				dateFinalDate=LocalDateTime.parse(finalDate);
				
				dateStartDate=LocalDateTime.parse(startDate, formatter);
				dateFinalDate=LocalDateTime.parse(finalDate, formatter);
				finalPlus=dateFinalDate.plusDays(1);
			}catch (Exception e) {
				e.printStackTrace();
//				throw new RuntimeException("날짜 형식을 확인해주세요 ex)20221128");
			}
			ordersList=ordersRep
					.findByUsersAndOrdersDateGreaterThanEqualAndOrdersDateLessThan
					(users, dateStartDate, finalPlus, pageable);
		}
		
		/**테스트코드*/

		ordersList.forEach(b->System.out.println(b));
		
		/////////////////////////////////////////
		
//		return ordersList;
	} //selectAllOrders end

//	@Test/**테스트 완*/
//	public void/*Page<Orderdetails>*/ selectAllOrderdetails(/*Long ordersNo, Pageable pageable*/) {
//		/*테스트용 추가*/
//		Long ordersNo=3L;
//		Pageable pageable=PageRequest.of(0, 10, Direction.DESC, "orderdetailsNo");
//		//////////////////////////////////////////////////////
//		Orders orders=ordersRep.findById(ordersNo).orElse(null);
//		
//		Page<Orderdetails> orderdetailsList=orderdetailsRep.findByOrders(orders, pageable);
//		
//		//////////////////////////////////////////////////////////
//		/*테스트용*/
//		System.out.println("****************");
//		System.out.println("orderdetailsList"+orderdetailsList);
//		orderdetailsList.forEach(b->System.out.println(b));
//		
////		return orderdetailsList;
//		
//	} //selectAllOrdersdetails end
	
	@Test /**List로 변경후 테스트*/
	public void selectAllOrderdetails() {
		Long ordersNo=3L;
		Orders orders=ordersRep.findById(ordersNo).orElse(null);
		
		List<Orderdetails> orderdetailsList=orderdetailsRep.findByOrders(orders);

//		//////////////////////////////////////////////////////////
		/*테스트용*/
		System.out.println("****************");
		System.out.println("orderdetailsList"+orderdetailsList);
		orderdetailsList.forEach(b->System.out.println(b));
	} //selectAllOrdersdetails end

	/* 체크만 한 후 RuntimeException 처리
	 * - 1) 멤버쉽 체크는 시큐리티 사용해야돼서 뷰->컨트롤러로 카트 담을 때 분류하는게 좋을듯 (1번 삭제)
	 * */
	/* 예외처리 안할거면 selectCheckBeforeOrders에서 String으로 "forward:" 리턴하여, 
	 * 아래 insertOrdersOrderdetails에서 Runtime대신 기본 리턴값 "redirect:" 를 리턴하여 받아서
	 * 장바구니에 담는 곳으로 되돌리는 경로 설정하면 어떨까 하지만,
	 * 우선 RunTimeException으로 설정*/
	@Test/** 멤버쉽카드인지 는 확인 못함 */
	public void selectCheckBeforeOrders(Users users, Orders ordersProduct) {
		//반복문 사용해서 List 속의 상품들 꺼내서 비교하기
				List<Orderdetails> cartList=ordersProduct.getOrderdetailsList();
				for(Orderdetails orderdetails : cartList){
//					//1) 멤버쉽 주문이 맞는지 조회 (Product ordersProduct)
//					if(orderdetails.getProduct().getGoods().getGoodsMemberShiponly()==1){
//						if(users.getUsersMemberShip()==0) throw new RuntimeException("멤버쉽 회원만 주문 가능한 상품입니다");
//					}
					
//					//2) 상품이 멤버쉽카드인지 조회 //프론트 사용해서 주석처리
//					if(orderdetails.getProduct().getProductCode().equals("A04")){
//						if(users.getUsersMemberShip()==1) throw new RuntimeException("이미 멤버쉽 회원입니다");
//					}

					//3) 상품 재고량이 주문 가능한 숫자인지 조회
					Product product=productRep.findById(orderdetails.getProduct().getProductCode()).orElse(null);
					if(product.getProductStock()>=0){
						if(orderdetails.getProduct().getProductStock()>product.getProductStock() || product.getProductStock()==0)
								throw new RuntimeException("상품 재고량이 부족합니다. 개수를 확인해주세요.");
					}
				}//장바구니 리스트 꺼내서 유효성 체크하는 for문끝
	} //selectCheckBeforeOrders end
	
	/**테스트 찾기*/
	@Test
	public void findUsersTest() {
		Users users=userRep.findById("user").orElse(null);
		System.out.println("-----------------------------");
		System.out.println("Users users="+users);
	}
	/**테스트 찾기*/
	@Test
	public void findProductTest() {
		Product product=productRep.findById("A01").orElse(null);
		System.out.println("-----------------------------");
		System.out.println("Product product="+product);
	}

//	@Test/**인수 받아서 출력 테스트, 체크메소드 호출 : */
//	public void beforeInsertpublic(/*Users users, Orders ordersProduct*/ /*, List<Orderdetails> cartList*/) {
//		/**테스트용 인수*/
//		Users users=userRep.findById("user").orElse(null);
//		System.out.println("**********************");
//		System.out.println("test-insert-users담기");
//		System.out.println("users="+users);
//		
//		Orders ordersProduct=Orders.
//				builder()
//				.users(users)
//				.ordersAddr("주소1")
//				.ordersReceiverName("받는자")
//				.ordersReceiverPhone("01011111111")
//				.ordersZipcode("12312")
//				.ordersStatus("결제완료").build();
//		
//		System.out.println("**********************");
//		System.out.println("test-insert-객체에 레코드 저장");
//		
//		List<Orderdetails> cartList=new ArrayList<Orderdetails>();
//		for (int i = 1; i <6 ; i++) {
////			Product product=Product.builder().productCode("A01").build();
//			Product product=productRep.findById("A01").orElse(null);
//			System.out.println("for문 cartList담는중");
//			cartList.add(Orderdetails.builder()
//					.orders(ordersProduct)
//					.product(product)
//					.orderdetailsPrice(product.getProductPrice()*2)
//					.orderdetailsQty(2)
//					.build());
//		}
//		System.out.println("**********************");
//		System.out.println("test-insert-for직후");
//
//		ordersProduct.setOrderdetailsList(cartList);
//		
//		System.out.println(ordersProduct);
//		ordersProduct.getOrderdetailsList().forEach(b->System.out.println(b));
//	}
	
	//인수로 Orders에 한번에 담을 수 있는지 확인 후 안담아지면
	//List로 주문상세정보 받아서 추가로 담기
	@Test/**테스트1 완료!!->멤버쉽카드만 못함->함 */
	public void insertOrdersOrderdetails(/*Users users, Orders ordersProduct*//*, List<Orderdetails> cartList*/) {
		/**테스트용 인수*/
		Users users=userRep.findById("user").orElse(null);
		System.out.println("**********************");
		System.out.println("test-insert-users담기");
		System.out.println("users="+users);
		
		Orders ordersProduct=Orders.
				builder()
				.users(users)
				.ordersAddr("주소1")
				.ordersReceiverName("받는자")
				.ordersReceiverPhone("01011111111")
				.ordersZipcode("12312")
				.ordersStatus("결제중").build();
		
		System.out.println("**********************");
		System.out.println("test-insert-객체에 레코드 저장");
		
		List<Orderdetails> cartList=new ArrayList<Orderdetails>();
		for (int i = 1; i <6 ; i++) {
//			Product product=Product.builder().productCode("A01").build();
			Product product=productRep.findById("A06").orElse(null);
			System.out.println("for문 cartList담는중");
			cartList.add(Orderdetails.builder()
					.orders(ordersProduct)
					.product(product)
					.orderdetailsPrice(product.getProductPrice()*2)
					.orderdetailsQty(2)
					.build());
		}
		System.out.println("**********************");
		System.out.println("test-insert-for직후");

		ordersProduct.setOrderdetailsList(cartList);
		
		System.out.println(ordersProduct);
		ordersProduct.getOrderdetailsList().forEach(b->System.out.println(b));
		
		//////////////////////////////////////////
		
		//주문 체크 메소드 호출하여 주문전 체크
		this.selectCheckBeforeOrders(users, ordersProduct);
		//이상없다면 Exception없이 빠져나옴
		
		String usersId=users.getUsersId();

		
		//insert
		Orders finishOrders=ordersRep.save(ordersProduct); //한 번에 insert 되면 이걸로 끝내기
		
		//상세정보 따로 담아야 하면 쓰기
		List<Orderdetails> orderdetailsList=finishOrders.getOrderdetailsList();
		
		//저장값 꺼내서 상품에 해당하는 상품 재고량 감소 및 멤버쉽 수정 구현
		//if 재고량이 1이상일때 : 재고량 감소 / 재고량-상품수량<0 이면 실패
		//멤버쉽카드일시 :  위 재고량 로직+ 권한생성 + 회원 멤버쉽 1로 update
		List<Orderdetails> finishOrderdetailsList=orderdetailsRep.saveAll(orderdetailsList);
		
		for(Orderdetails orderdetails : finishOrderdetailsList){
			
			//상품 수정 기능구현을 위한 상품 조회
			String getProdCode=orderdetails.getProduct().getProductCode();
			Product product=productRep.findById(getProdCode).orElse(null);

			//1-1) 상품이 멤버쉽카드인지 조회
			//1-2) 멤버쉽 수정 기능구현을 위한 유저 조회 (혹은 인수 사용->인수에 모든 정보 없을듯하니 조회하기)
			//1-3) 유저 정보의 멤버쉽 업데이트
//			if(getProdCode=="멤버쉽카드의 상품코드"){
//				Users dbUsers=userRep.findById(usersId).orElse(null);
//				dbUsers.setUsersMemberShip(1);
//			}
//			/*테스트 완료*/
//			//2-1) 상품 재고량이 주문 가능한 숫자인지 조회 (0개 초과부터)
//			//2-2) 상품 재고량 감소
//			if(product.getProductStock()>0){
//				product.setProductStock(product.getProductStock()-orderdetails.getOrderdetailsQty());
//			}
			
			if(getProdCode.equals("A04")){//상품코드 String
				Users dbUsers=userRep.findById(usersId).orElse(null);
				usersService.updateUsersMemberShip(dbUsers, true);
			}
			
			if(product.getProductStock()>0){
				int qty=orderdetails.getOrderdetailsQty();
				productService.decreaseProductStock(getProdCode, qty);
			}
			
		}//장바구니 리스트 꺼내서 유효성 체크하는 for문끝

		/**테스트 insert 출력*/
		finishOrderdetailsList.forEach(b->System.out.println(b));
		////////////////////////////////
		
	} //insertOrdersOrderdetails end

	/**검증하는 메소드
	 * @throws Exception */
	@Test/*테스트 완료*/
	public void verifyOrders() throws Exception {
		Long ordersNo=12L;
		int verifyAmount=10000;
		String status="결제완료";
		
		/////////////////////////////////////////////////////
		//비교하기 위해 값 꺼내기
		Orders orders=ordersRep.findById(ordersNo).orElse(null);
		List<Orderdetails> orderdetailsList=orders.getOrderdetailsList();
		int amount=0;
		for(Orderdetails orderdetails : orderdetailsList){
			amount+=orderdetails.getOrderdetailsPrice();
		}

		//비교하기
		if (amount==verifyAmount) {
			//성공시 주문상태 업데이트
			orders.setOrdersStatus(status);
		}else {
			for(Orderdetails orderdetails : orderdetailsList){
			
				//1) 멤버쉽 카드라면 다시 회원 정보의 멤버쉽유무 0으로 수정
				if(orderdetails.getProduct().getProductCode().equals("A04")) {
					Users users=orders.getUsers();
					usersService.updateUsersMemberShip(users, false);
				}
				
				//2) 재고량 원복
				if(orderdetails.getProduct().getProductStock()>=0) {
					int qty=(0-orderdetails.getOrderdetailsQty());					
					productService.decreaseProductStock(orderdetails.getProduct().getProductCode(), qty);
				}
			}
			
			//DB금액과 결제금액이 다를 경우 주문 삭제 : 보안상 위조된 값
			ordersRep.delete(orders); //cascade설정으로 주문상세도 삭제됨

			//주문 삭제후 트랜젝션과는 관련 없는 Exception 일으키기
			throw new Exception("위조된 결제 시도 : FBI WARNING");
			
		}//검증실패시 기능 끝
	}//verifyOrders end
}
