package web.mvc.util;

public interface OrdersStatusConstants {
	public final static String STATUS_BEFORE="결제중"; //상태int1
	public final static String STATUS_AFTER="주문완료"; //상태int2
	public final static String STATUS_DELIEVERING="배송중"; //상태int3
	public final static String STATUS_ARRIVE="배송완료"; //상태int4
	public final static String STATUS_ALL_CANCEL="주문취소"; //상태int5
	public final static String STATUS_PART_CANCEL="부분환불"; //상태int6
}
