package web.mvc.service;

import java.time.LocalDateTime;
import java.util.List;

import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;
import web.mvc.dto.Stats;
import web.mvc.repository.StatsInterface;

public interface StatsService {
	
	
	/**
	 * 전체 매출 조회 & 월별 매출조회
	 * 결제일-인수, 리턴 - OrderdetailsPrice (null이면 전체조회)
	 */
	Long findByGetMonth(String Month) throws Exception;
	
	/**
	 * 전체 매출 조회
	 */
	Stats findByAllStats();
	
	/**
	 * 월별 매출 조회
	 */
	List<Stats> findByMonthStats();
	
	
	/**
	 * 앨범별
	 * productCode -인수 리턴
	 * */
	Stats findAlbumStats(String productCode);
	

}
