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
class ordersSample {

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
	 * ->생성일자 변경해야함 수동으로
	 */
	@Test //월별로 넣기 //생성후 생성일자 변경 메소드 돌리기
	public void insertSampleOrders() {
		String usersId="jh";
		String product1="G01";
		String album1="A01";
		String album2="A02";
		String album3="A03";
		String album4="A04";//bornPink
		
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

		Long l=1L;
		
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

///////////////////////////////
//@Test//수동 권한 생성
//public void authorityManul() {
//	Users users=userRep.findById("admin").orElse(null);
//	System.out.println("ss");
//	authorRep.save(Authority.builder().users(users).authorityRole(RoleConstants.ROLE_MEMBER).build());
//	authorRep.save(Authority.builder().users(users).authorityRole(RoleConstants.ROLE_ADMIN).build());
//}

/*
insert into category values('A', 'Album');
insert into category values('G', 'Goods');
insert into category values('M', 'MembershipCard');
 */
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
}
