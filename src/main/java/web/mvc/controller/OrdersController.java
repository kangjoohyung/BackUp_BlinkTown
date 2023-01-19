package web.mvc.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import web.mvc.domain.Authority;
import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;
import web.mvc.domain.Product;
import web.mvc.domain.Users;
import web.mvc.dto.Cart;
import web.mvc.dto.OrdersDTO;
import web.mvc.service.CartService;
import web.mvc.service.OrdersService;
import web.mvc.service.ProductService;
import web.mvc.service.UsersService;

//@RestController
@Controller
//@RequestMapping("/orders")
@RequestMapping
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrdersVerifyController ordersVerifyController;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UsersService usersService;
	
	/**상수관리*/
	//페이지 사용 안함..
	private final static int PAGE_COUNT=10;//페이지당 출력 숫자
	private final static int BLOCK_COUNT=10;//
	
	private final static String STATUS_BEFORE="결제중";
	private final static String STATUS_AFTER="주문완료";
	private final static String STATUS_ALL_CANCEL="주문취소";
	private final static String STATUS_PART_CANCEL="부분환불";
	
	//유저 정보 받아오기 : Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
	//관리자 페이지-메인 : admin/main
	//관리자 페이지-주문조회 : admin/ordersList  (main에서 ajax호출용 url)
	//유저 마이페이지-주문조회 : /mypage/orderList
	//카트구매용 주문 폼 연결(유저/멤버) : /orders/ordersForm -> shop/order 로 연결
	//바로구매용 주문 폼 연결(유저/멤버) : /orders/directOrder -> shop/order 로 연결(directOrder값 전달)
	//주문하기(유저/멤버) : /orders/checkout
	//카카오페이 검증메소드 : /orders/verifyIamport
	//주문 삭제 : /orders/delete
	
	//테스트 및 테스트후 //테스트용  검색하여 주석 변경할 것
	
	//샘플 입력시 ordersService에서 멤버쉽카드 상품코드 입력해야 함 ("멤버쉽카드의 상품코드")
	//샘플 입력시 AdminController에 앨범 상품코드 입력필요
	
	///////////////////////////////////////////////////////
	/**
	 * 관리자 페이지-주문조회
	 * ->AdminController로 이관
	 * (Mapping url : admin/ordersList)
	 */
	///////////////////////////////////////////////////////
	/**
	 * 유저 마이페이지 : 주문목록+상세내역 조회 페이지
	 * (Mypage컨트롤러 만들었다가 다시 이쪽으로 돌려놓음)
	 */
	@RequestMapping("/mypage/orderList")
	public void ordersList(Model model) {
		//유저 테스트용-실제용 구분
//		Users users=Users.builder().usersId("user").build();//테스트용
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		List<Orders> ordersList=ordersService.selectByUsers(users);
		
		//DTO에 담기
		List<OrdersDTO> ordersDTOList=new ArrayList<OrdersDTO>();
		for(Orders orders:ordersList) {
			int amount=0;
			List<Orderdetails> orderdetailsList=orders.getOrderdetailsList();
			if(orderdetailsList!=null) {
				for(Orderdetails orderdetails : orderdetailsList){
					amount+=orderdetails.getOrderdetailsPrice();
				}//orderdetailsList끝
			}
			System.out.println("amount="+amount);
			OrdersDTO ordersDTO=new OrdersDTO
					(orders.getOrdersNo(), orders.getUsers(), 
					orders.getOrdersReceiverName(), orders.getOrdersReceiverPhone(), 
					orders.getOrdersAddr(), orders.getOrdersZipcode(), 
					orders.getOrdersStatus(), orders.getOrdersDate(), 
					orderdetailsList, amount);
			
			System.out.println("amount2="+amount);
			ordersDTOList.add(ordersDTO);
		}//ordersList반복문 끝
		System.out.println("---------------ordersList반복문끝----------");
		model.addAttribute("ordersList", ordersDTOList);
		
	}
	
	/**ajax용(분리) 주문리스트*/
//	@RequestMapping("/mypage/orderList")
	public List<Orders> ordersListByUsers() {
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return ordersService.selectByUsers(users);
	}
	/**ajax용(분리) 주문상세리스트->DTO사용할지?*/
//	@RequestMapping("/mypage/orderdetailsList/{ordersNo}")
	public List<Orderdetails> selectAllorderdetails(@PathVariable Long ordersNo){
		return ordersService.selectAllOrderdetails(ordersNo);
	}
	////////////////////////////////////////////////////////////
	
	/**
	 * 주문폼 연결url용 메소드(카트구매용)
	 */
	@RequestMapping("/orders/ordersForm")
	public String cartOrder(HttpSession session) {
		//////////////////////////////////
		//테스트용 - 전부 테스트 ->합쳐지는것 확인, 여러개 동시구매 확인, 그 외 변경점들(재고량 등)확인
//		String productCode="A01";
//		Product product=productService.selectByProductCode(productCode, false);
//		Cart cart = new Cart(product, (product.getProductPrice() * 3), 3);
//		List<Cart> cartList = cartService.insertCart(session, cart);
//		session.setAttribute("cartList", cartList);
//		productCode="A05";
//		product=productService.selectByProductCode(productCode, false);
//		cart = new Cart(product, (product.getProductPrice() * 3), 3);
//		cartList = cartService.insertCart(session, cart);
//		session.setAttribute("cartList", cartList);
//		productCode="A06";
//		product=productService.selectByProductCode(productCode, false);
//		cart = new Cart(product, (product.getProductPrice() * 1), 1);
//		cartList = cartService.insertCart(session, cart);
//		session.setAttribute("cartList", cartList);
//		productCode="A01";
//		product=productService.selectByProductCode(productCode, false);
//		cart = new Cart(product, (product.getProductPrice() * 1), 1);
//		cartList = cartService.insertCart(session, cart);
//		session.setAttribute("cartList", cartList);
		//테스트용 - 전부 테스트
		/////////////////////////////////////
		//장바구니 세션사용하여 경로만 사용
		return "/shop/order";
	}
	/**
	 * 바로구매(주문폼 연결)
	 */
	@RequestMapping("/orders/directOrder/{productCode}/{qty}")
	public String directOrder(/*Product product, */@PathVariable String productCode, @PathVariable int qty, Model model) {

//		product.setProductCode("A01"); //테스트용 
//		product=productService.selectByProductCode(product.getProductCode(), false); //product사용용도
		System.out.println("qty="+qty);
		
		Product product=new Product();
		product=productService.selectByProductCode(productCode, false); //실사용
		Orderdetails directOrder=Orderdetails.builder().product(product).orderdetailsQty(qty).orderdetailsPrice(product.getProductPrice()*qty).build();
		model.addAttribute("directOrder", directOrder);
		return "/shop/order";
	}
	
	/**
	 * 주문 성공 메세지 연결용
	 */
	@RequestMapping("/orders/orderSuccess")
	public String orderSuccess(Model model) {
		model.addAttribute("message", "주문해주셔서 감사합니다");
		model.addAttribute("url", "/mypage/orderList");
		model.addAttribute("urlName", "주문 내역 확인하기");
		return "/success/success";
	}
	
	/**
	 * 주문 실패 메세지 연결용
	 */
	@RequestMapping("/orders/orderFail")
	public String orderFail(Model model) {
		model.addAttribute("message", "주문에 실패하였습니다");
		return "/error/error";
	}
	
///////////////////////////////////////////////////////////////	
	/**
	 * 4. 주문
	 * 
	 * 1-1) 넘어오기 전 : 주문폼
	 * 1-2) 넘어오는 인수 : 주문폼 내용 - orders
	 *                   바로주문 - directOrder
	 *                   카트주문 - 세션에서 cartList받기
	 *                   
	 * 2-1) 보내는 곳 : 주문폼 (에서 결제창 호출에 사용할 예정)
	 * 2-2) 보내는 인수 : Long ordersNo (주문번호),
	 *                 int amount (총계)
	 * 
	 * 기능들 - ajax처리예정 return값 Model에 넣기
	 * 3-1) 주문테이블+주문상세테이블에 주문정보 저장
	 * 3-2) 주문폼으로 ajax로 보내어 결제창 호출에 사용
	 *     ->결제완료후 검증까지 필요 ->이후 세션 삭제
	 * 
	 */
	@RequestMapping("/orders/checkout")
	@ResponseBody
	public Map<String, Object>  insertOrdersOrderdetails(
			Orders orders, Orderdetails directOrder, HttpSession session){
		
		List<Orderdetails> orderdetailsDomainList=new ArrayList<Orderdetails>();
		//바로 주문이면 상품 한개만 담기
		if(directOrder.getProduct()!=null) {
			Product product=productService.selectByProductCode(directOrder.getProduct().getProductCode(), false);
			directOrder.setProduct(product);
			orderdetailsDomainList.add(directOrder);
		}
		//아니면(장바구니 상품 구매)->세션에서 값 받아서 주문
		else{
			List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
			for(Cart cart:cartList) {
				Orderdetails orderdetails=Orderdetails
						.builder().product(cart.getProduct())
						.orderdetailsPrice(cart.getCartPrice())
						.orderdetailsQty(cart.getCartQty()).build();
				orderdetailsDomainList.add(orderdetails);
			}
		}
		orders.setOrderdetailsList(orderdetailsDomainList);
		orders.getOrderdetailsList().forEach(o-> System.out.println(o));//확인용
		
		//총금액 계산
		int amount=0;
		for(Orderdetails orderdetails : orderdetailsDomainList){
			amount+=orderdetails.getOrderdetailsPrice();
		}
		System.out.println("amount="+amount);//확인용
		
		//주문상태 결제중으로 입력
		orders.setOrdersStatus(STATUS_BEFORE);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users users=(Users)auth.getPrincipal();
//		Users users=Users.builder().usersId("user").build(); //테스트용 생성
		
		//결제 창 호출위해 결과값 담기, cartList);
		Orders finishOrders=ordersService.insertOrdersOrderdetails(users, orders);
		
		//권한이 추가되었기 대문에 Authentication 의 권한도 수정
		
		List<Authority> dbAuthorityList = usersService.findByUsers(users);
		
		List<SimpleGrantedAuthority> simpleAuthList = new ArrayList<SimpleGrantedAuthority>();
		for(Authority authority: dbAuthorityList) {
			simpleAuthList.add(new SimpleGrantedAuthority(authority.getAuthorityRole()));
		}
		
		UsernamePasswordAuthenticationToken token = 
				new UsernamePasswordAuthenticationToken(users, null, simpleAuthList);
		SecurityContextHolder.getContext().setAuthentication(token);
		
		System.out.println("auth = " + SecurityContextHolder.getContext().getAuthentication());
		//ajax로 리턴값 Map으로 보냄->jason 사용, mappedby ignore설정완료
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orders", finishOrders);
		map.put("amount", amount);
		
		System.out.println("checkout끝");//확인용 출력
		return map;
	}
	
	////////////////////////////////////////////////////////////////////
	/**
	 * 5. 결제 검증 메소드 (API사용 특성상 필요한 메소드)
	 * 
	 * 1) 검증하기 : 실패하면 RuntimeException 일으킴. 성공시엔 아무 변화 없음
	 * 2-1) 검증 성공시 : 주문상태 변경+장바구니 세션 삭제(서비스에 주문상태 변경 추가,테스트할것)
	 * ->뷰에서 마이페이지-주문페이지 혹은 주문완료 페이지로 연결
	 * 2-2) 검증 실패시 : 주문 삭제(서비스에 삭제 추가, 테스트할 것)
	 */
	@ResponseBody
	@RequestMapping("/orders/verifyIamport")
	public void ordersVerifyPayment(String imp_uid, HttpSession session
			, Principal principal
			) {
		try {
		//검증메소드 호출 및 검증위한 변수 저장
		IamportResponse<Payment> resultData=ordersVerifyController.paymentByImpUid(imp_uid);
		Long ordersNo=Long.parseLong(resultData.getResponse().getMerchantUid());
		int verifyAmount=resultData.getResponse().getAmount().intValueExact();
		
		//금액을 비교하여 검증(금액 다를시 주문내역 삭제 및 재고량 원복후 runtimeException발생시킴)
		ordersService.verifyOrders(ordersNo, verifyAmount, STATUS_AFTER, imp_uid);
		
		//이상 없을시 장바구니 세션 삭제->dto삭제 메소드 호출
//		Users users=(Users)principal;
		cartService.deleteAllCart(session);
		//장바구니DTO 삭제
		}catch (Exception e) {
			//결제취소 메소드 넣기 (예외처리-try/catch)
			try {
				ordersVerifyController.cancelByImpUid(imp_uid);
			} catch (IamportResponseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
			System.out.println("오류 발생 : 결제금액 위조 (검증 실패)");
			new RuntimeException("결제중 오류가 발생하였습니다");
			}
		}
	}
	
	/**삭제 메소드*/
	@RequestMapping("/orders/delete")
	public void ordersDelete(/* Orders orders */Long ordersNo) {
		System.out.println("삭제 컨트롤러");
//		Long ordersNo=orders.getOrdersNo();
		ordersService.deleteOrders(ordersNo);
		System.out.println("삭제 컨트롤러 끝");
	}
	///////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////
//	 * 1-1. 유저 마이페이지 메인
//	 * 
//	 * 1-1) 넘어오기 전 : 아마도 유저/마이페이지
//	 * 1-2) 넘어오는 인수 : (현재 페이지: int nowPage), (날짜조회 시작일: String startDate), 
//	 *                   (날짜조회 마지막일: String finalDate)
//	 *                  ->startDate,finalDate=="20221202" 형식으로 날짜 입력 필요!
//	 * 
//	 * 2-1) 보내는 곳 : 유저(일반,멤버쉽)/마이페이지/주문페이지
//	 * 2-2) 보내는 인수 : Page<Orders> orderList(주문리스트),
//	 *                 int blockCount(페이징처리 블럭 수), 
//	 *                 int startPage(시작 페이지), int nowPage(현재 페이지)
//	 * 
//	 * 기능들
//	 * 3-1) 유저-주문 전체 조회
//	 * 3-2) 유저-주문 기간별 조회 -> 우선 안쓰는 방향 //새 메소드로 구분짓기(url매핑 구분하기)
	 
//	@RequestMapping("/유저/마이페이지/주문페이지") //기간별 조회도 뒷순위->차후 안쓰면 정리하기
//	public void selectAllOrders(Model model, 
//			@RequestParam(defaultValue="1") int nowPage, String startDate, String finalDate) {
//		
//		Pageable ordersPage=PageRequest.of(nowPage-1, PAGE_COUNT, Direction.DESC, "ordersDate");
//		Page<Orders> ordersList=null;
//		//유저정보 받아와서 users에 넣기
//		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		//유저 메인페이지 정보 호출 : (inCase==2)
//		if(startDate==null||finalDate==null) {
//			//10개만 출력시 주석 풀기
////			usersId=users.getUsersId();
////			Pageable mainPage=PageRequest.of(0, 10, Direction.DESC, "ordersDate");
////			ordersList=ordersService.selectAllOrders(2, users, null, null, mainPage);
//			
//			ordersList=ordersService.selectAllOrders(2, users, null, null, ordersPage);
//		}else {
//		//기간 조회용 페이지 정보 호출 : (inCase==3) -> 차후 삭제하거나 하기(현재로선 안쓰는 방향)
//			ordersList=ordersService.selectAllOrders(3, users, startDate, finalDate, ordersPage);
//		}
//		model.addAttribute("ordersList", ordersList);
//		///////////////////////////////////////////////////
//		//페이징 처리 메소드
//		int temp=0;
//		if (nowPage!=1) { //내가 추가함 0나누기하면 안되니까
//			temp=(nowPage-1)%BLOCK_COUNT;
//		}
//		int startPage=nowPage-temp;
//		//페이징 처리 위한 정보들 값으로 넣어 전달
//		model.addAttribute("blockCount", BLOCK_COUNT);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("nowPage", nowPage);
//	}//주문전체 끝(유저)

	/**
	 * 1-2. 유저 마이페이지 - 주문 상세내역 
	 * -> 주문 내역 클릭시 해당 주문 코드로 주문 내역 조회
	 * 
	 * 1-1) 넘어오기 전 : 유저/마이페이지/주문페이지
	 * 1-2) 넘어오는 인수 : URL(Long ordersNo(주문번호))
	 * 
	 * 2-1) 보내는 곳 : 유저(일반,멤버쉽)/마이페이지/주문상세페이지(혹은 주문페이지)
	 * 2-2) 보내는 인수 : List<Orderdetails> orderdetailsList(상세주문리스트), 
	 *                 -> 주문상세에 해당하는 상품정보 포함(join)
	 *                 ->Page에서 List로 변경
	 * 
	 * 기능들
	 * 3) 주문 번호별 주문상세 전체 조회
	 */
//	@RequestMapping("/유저/마이페이지/주문상세페이지/{ordersNo}") //페이징처리 주석처리
	public void selectAllOrderdetails(Model model, @PathVariable Long ordersNo) {
		List<Orderdetails> orderdetailsList=ordersService.selectAllOrderdetails(ordersNo);
		model.addAttribute("orderdetailsList", orderdetailsList);
	}//유저 상세조회 끝
	
	////////////////////////////////////////////////////
	
	
	
//	 * 2-1. 관리자 페이지 - 주문 조회
//	 * 
//	 * 1-1) 넘어오기 전 : 관리자페이지
//	 * 1-2) 넘어오는 인수 : (현재 페이지: int nowPage)
//	 * 
//	 * 2-1) 보내는 곳 : 관리자/주문페이지
//	 * 2-2) 보내는 인수 : Page<Orders> orderList(주문리스트),
//	 *                 int blockCount(페이징처리 블럭 수), 
//	 *                 int startPage(시작 페이지), int nowPage(현재 페이지)
//	 * 
//	 * 기능들
//	 * 3) 관리자-주문 전체 출력 페이지
	
//	@RequestMapping("/관리자/주문페이지")
//	public void selectAllOrdersAdmin(Model model,
//			@RequestParam(defaultValue="1") int nowPage) {
//		Pageable ordersPage=PageRequest.of(nowPage-1, PAGE_COUNT, Direction.DESC, "ordersDate");
//		Page<Orders> ordersList=ordersService.selectAllOrders(3, null, null, null, ordersPage);
//		model.addAttribute("ordersList", ordersList);
//		/////////////////////////////////////////////////
//		//페이징 처리 메소드
//		int temp=0;
//		if (nowPage!=1) { //내가 추가함 0나누기하면 안되니까
//			temp=(nowPage-1)%BLOCK_COUNT;
//		}
//		int startPage=nowPage-temp;
//		//페이징 처리 위한 정보들 값으로 넣어 전달
//		model.addAttribute("blockCount", BLOCK_COUNT);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("nowPage", nowPage);
//	}//관리자 주문 리스트 끝
	
	/**
	 * 2-2. 관리자 마이페이지 - 주문 상세내역 
	 * -> 주문 내역 클릭시 해당 주문 코드로 주문 내역 조회
	 * 
	 * 1-1) 넘어오기 전 : 유저/마이페이지/주문페이지
	 * 1-2) 넘어오는 인수 : URL(Long ordersNo(주문번호))
	 * 
	 * 2-1) 보내는 곳 : 관리자/주문상세페이지(혹은 주문페이지)
	 * 2-2) 보내는 인수 : List<Orderdetails> orderdetailsList(상세주문리스트), 
	 *                 -> 주문상세에 해당하는 상품정보 포함(join)
	 *                 ->Page에서 List로 변경
	 * 
	 * 기능들
	 * 3) 주문 번호별 주문상세 전체 조회
	 */
//	@RequestMapping("/관리자/주문상세페이지/{ordersNo}")
	public void selectAllOrderdetailsAdmin(Model model, @PathVariable Long ordersNo) {
		List<Orderdetails> orderdetailsList=ordersService.selectAllOrderdetails(ordersNo);
		model.addAttribute("orderdetailsList", orderdetailsList);
	}//관리자 주문 상세 끝
	
	/////////////////////////////////////////////////////////////
	/**배송정보 변경*/
//	@RequestMapping("/admin/orders/updateStatus/{ordersNo}/{status}")
	public void updateStatus(@PathVariable Long ordersNo, @PathVariable String status) {
		ordersService.updateOrdersStatus(ordersNo, status);
	}
	
	/**주문 취소 : 취소후 DB변경 -> 리턴필요?? / 환불페이지? 주문내역에서 바로? -> 팝업창 띄워서 확인후 ajax로 진행*/
//	@RequestMapping("/orders/allCancel/{ordersNo}")
//	@ResponseBody
	public void allCancelOrders(@PathVariable Long ordersNo, String imp_uid) {
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ordersService.totalCancel(ordersNo, STATUS_ALL_CANCEL, imp_uid, users, false, null);
	}
	
	/**부분 환불 : 환불후 DB변경 -> 리턴값 필요?? / 환불페이지? 주문내역에서 바로? -> 팝업창 띄워서 확인후 ajax로 진행*/
//	@RequestMapping("/orders/partCancel/{orderdetailsNo}")
//	@RequestMapping("/orders/partCancel")
//	@RequestMapping("/orders/partCancel/{ordersNo}")
//	@ResponseBody
	public void partCancelOrderdetails(@PathVariable Long ordersNo, List<Orderdetails> partCancelList, String imp_uid/* @PathVariable Long orderdetailsNo */) {
		//상태변경->부분환불, 주문금액->해당 상세내역만큼 합산, 결제-> 해당내역금액 - 로 변경 /액터 : 고객, 마이페이지에서 실행
		Users users=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ordersService.totalCancel(ordersNo, STATUS_PART_CANCEL, imp_uid, users, true, partCancelList);
	}
	
	/////////////////////////////////////////////////////////////
	//테스트용 메소드들
	/**테스트용*/
//	@RequestMapping("/orders/ordersTestAfter/beforeOrdersTest")
	public void testBefore() {}
	/**테스트용 간편*/
	@RequestMapping("/orders/test")
	public String testBe() {
		return "redirect:/orders/ordersTestAfter/ordersFinalTest";
//		return "/orders/ordersTestAfter/beforeOrdersTest";
	}
	
	/**성공 출력 페이지-테스트용도*/
//	@RequestMapping("/orders/ordersTestAfter/ordersTestResult")
	public void resultUrl() {}
	
}
