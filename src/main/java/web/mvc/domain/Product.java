package web.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Inheritance(strategy = InheritanceType.JOINED)
//@ToString
public class Product {

	@Id
	private String productCode;

	@Column(nullable = false)
	private String productName;

	@Column(nullable = false)
	private String productEngName;

	private int productPrice;

	@Column(nullable = true)
	private int productStock;
	private String productSize;

	@CreationTimestamp
	private LocalDateTime productRegDate;

	@Column(nullable = false)
	private String productMainImg;
	@Column(nullable = false)
	private String productDetailImg;
	
	@Column(nullable = false, columnDefinition = "number default 0")
	private int productReadNo;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoryCode")
	private Category category;

	@Column(nullable = false, columnDefinition = "number(1) default 0")
	private Integer productMembershipOnly;

}
