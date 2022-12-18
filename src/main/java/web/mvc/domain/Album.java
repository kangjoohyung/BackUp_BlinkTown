package web.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Album extends Product {

	public Album(String productCode, String productName, String productEngName, int productPrice, int productStock,
			String productSize, LocalDateTime productRegDate, String productMainImg, String productDetailImg,
			int productReadNo, Category category, Integer productMembershipOnly, String albumComponent,
			String albumReleaseDate) {
		super(productCode, productName, productEngName, productPrice, productStock, productSize, productRegDate,
				productMainImg, productDetailImg, productReadNo, category, productMembershipOnly);
		this.albumComponent = albumComponent;
		this.albumReleaseDate = albumReleaseDate;
	}
	private String albumComponent;
	private String albumReleaseDate;

}
