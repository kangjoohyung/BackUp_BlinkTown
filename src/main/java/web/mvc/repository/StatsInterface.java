package web.mvc.repository;

public interface StatsInterface {
	String getMonth();
	Long getTotalprice();
	
	Long getAlbumTotalPrice();
	Long getAlbumTotalQty();

	Long getAllusers();//count
	Long getNormalusers(); //count
	Long getMemberusers(); //count
}
