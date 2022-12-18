package web.mvc.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import web.mvc.domain.Orderdetails;
import web.mvc.domain.Orders;
import web.mvc.dto.Stats;
import web.mvc.repository.StatsInterface;
import web.mvc.repository.StatsOrdersRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class StatsServiceImpl implements StatsService {
	
	
	private final StatsOrdersRepository statsOrderRep;
	
	/**
	 * 전체 매출 조회 & 월별 매출조회
	 * 결제일-인수, 리턴 - OrderdetailsPrice (null이면 전체조회)
	 */
	@Override
	public Long findByGetMonth(String month) throws Exception{
		StatsInterface impl = null;
		if(month==null) impl = statsOrderRep.findTotalPrice();
		else impl = statsOrderRep.findByGetMonth(month);
		return impl.getTotalprice();
	}
	
	@Override
	public Stats findByAllStats() {
		//Long totalPrice 만 담김
		StatsInterface result=statsOrderRep.findTotalPrice();
		Stats allStats=Stats.builder().totalPrice(result.getTotalprice()).build();
		return allStats;
	}

	@Override
	public List<Stats> findByMonthStats() {
		//String month, Long totalPrice 두 종류 담김
		List<StatsInterface> results=statsOrderRep.findAllStats();
		List<Stats> statsList=new ArrayList<Stats>();
		
		//12개까지만 담기
		if(results.size()<=12) {
			for(StatsInterface result:results) {
				Stats stats=Stats.builder().month(result.getMonth())
				.totalPrice(result.getTotalprice()).build();
				statsList.add(stats);
			}
		}else {
			for(int i=0; i<12; i++) {
				Stats stats=Stats.builder().month(results.get(i).getMonth())
				.totalPrice(results.get(i).getTotalprice()).build();
				statsList.add(stats);
			}	
		}
//		System.out.println("하나만출력"+statsList.get(0).getMonth());
		return statsList; //작은 숫자(1월)가 처음 담김
	}
	
	
	/**
	 * 앨범별
	 * productCode -인수
	 * */
	@Override
	public Stats findAlbumStats(String productCode){
		StatsInterface result = statsOrderRep.findAlbumStats(productCode);
		return Stats.builder().albumTotalPrice(result.getAlbumTotalPrice())
				.albumTotalQty(result.getAlbumTotalQty()).build();
	}

}
