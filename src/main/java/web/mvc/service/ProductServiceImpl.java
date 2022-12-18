package web.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.PathBuilder;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import web.mvc.domain.Album;
import web.mvc.domain.Goods;
import web.mvc.domain.Product;
import web.mvc.domain.QProduct;
import web.mvc.repository.ProductRepository;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	// private static final int PAGE_COUNT = 10;
	// private static final int BLOCK_COUNT = 5;
	private QProduct product = QProduct.product;

	@Autowired
	private ProductRepository repository;

	@Autowired
	private JPAQueryFactory queryFactory;

	@Override
	public void insertProduct(Product product) {
		repository.save(product);
	}

	@Override
	public Product updateProduct(Product product) {
		Product dbProduct = repository.findById(product.getProductCode()).orElse(null);

		if (dbProduct == null)
			throw new RuntimeException("상품 코드 오류로 수정 불가합니다.");

		dbProduct.setProductPrice(product.getProductPrice());
		dbProduct.setProductStock(product.getProductStock());

		if (product instanceof Goods) {
			updateGoods(product, dbProduct);
			return dbProduct;
		}

		if (product instanceof Album)
			updateAlbum(product, dbProduct);
		
		return dbProduct;
	}

	private void updateGoods(Product product, Product dbProduct) {
		Goods goods = (Goods) product;
		Goods dbGoods = (Goods) dbProduct;

		String country = goods.getGoodsCountry();
		String material = goods.getGoodsMaterial();

		if (country != null)
			dbGoods.setGoodsCountry(country);

		if (material != null)
			dbGoods.setGoodsMaterial(material);

	}

	private void updateAlbum(Product product, Product dbProduct) {
		Album album = (Album) product;
		Album dbAlbum = (Album) dbProduct;

		String albumComponent = album.getAlbumComponent();
		String albumReleaseDate = album.getAlbumReleaseDate();

		if (albumComponent != null)
			dbAlbum.setAlbumComponent(albumComponent);

		if (albumReleaseDate != null)
			dbAlbum.setAlbumReleaseDate(albumReleaseDate);
	}

	@Override
	public void deleteByProductCode(String productCode) {
		Product dbProduct = repository.findById(productCode).orElse(null);
		if (dbProduct == null)
			throw new RuntimeException("상품 코드 오류로 삭제 불가합니다.");
		
		repository.delete(dbProduct);
	}

	@Override
	public Page<Product> selectAllProduct(Pageable pageable, String categoryCode, Integer productMembershipOnly,
			String orderCondition) {
			
		Sort sort = orderCondition != null ? sortByOrderCondition(orderCondition) : Sort.unsorted();

		List<Product> content = queryFactory.selectFrom(product)
				.where(eqCategoryCode(categoryCode), eqProductMembershipOnly(productMembershipOnly))
				.orderBy(this.getOrderSpecifier(sort).stream().toArray(OrderSpecifier[]::new))
				.offset(pageable.getOffset()).limit(pageable.getPageSize()).fetch();
		
		JPAQuery<Long> countQuery = queryFactory.select(product.count()).from(product)
                .where(eqCategoryCode(categoryCode), eqProductMembershipOnly(productMembershipOnly));
		
		System.out.println("productMembershipOnly = " + productMembershipOnly);
		System.out.println("orderCondition = " + orderCondition);
		System.out.println("offset = " + pageable.getOffset());
		System.out.println("getPageSize = " + pageable.getPageSize());
		
		return PageableExecutionUtils.getPage(content, pageable, countQuery::fetchOne);
	}

	private BooleanExpression eqCategoryCode(String categoryCode) {
		return StringUtils.hasText(categoryCode) ? product.category.categoryCode.eq(categoryCode) : null;
	}

	private BooleanExpression eqProductMembershipOnly(Integer productMembershipOnly) {
		return productMembershipOnly == null ? null : product.productMembershipOnly.eq(productMembershipOnly);
	}

	private Sort sortByOrderCondition(String orderCondition) {
		Sort sort = null;
		switch (orderCondition) {
		case "productReadNo":
			sort = Sort.by(Direction.DESC, "productReadNo");
			break;

		case "productPriceHigh":
			sort = Sort.by(Direction.DESC, "productPrice");
			break;

		case "productPriceLow":
			sort = Sort.by(Direction.ASC, "productPrice");
			break;

		default:
			sort = Sort.by(Direction.DESC, "productRegDate");
		}

		return sort;
	}

	// orderSepcifier: order by의 요소들
	private List<OrderSpecifier> getOrderSpecifier(Sort sort) {
		List<OrderSpecifier> orders = new ArrayList<OrderSpecifier>();
		// Sort의 List<Order>를 반복해서 돌며서 order 정렬 조건을 찾음
		sort.stream().forEach(order -> {

			// 앞에서 받은 Sort가 가지고 있는 order가 DESC인지, ASC인지에 따라 enum클래스 Order에서 값을 찾음
			Order direction = order.isAscending() ? Order.ASC : Order.DESC;
			System.out.println("order = " + order);
			System.out.println("direction = " + direction);

			// 정렬 기준 컬럼
			String prop = order.getProperty();

			// 경로 설정 -> product 엔티티
			PathBuilder<Product> pathBuilder = new PathBuilder<Product>(Product.class, "product");
			// orderByExpression.get(prop) = product.정렬컬럼
			PathBuilder<Product> orderByExpression = pathBuilder;
			System.out.println("orderByExpression = " + orderByExpression);

			orders.add(new OrderSpecifier(direction, orderByExpression.get(prop)));
		});

		return orders;
	}

	@Override
	public Product selectByProductCode(String productCode, Boolean flag) {
		Product dbProduct = repository.findById(productCode).orElse(null);
		if (dbProduct == null)
			throw new RuntimeException("상품 코드 오류로 상세 조회 불가합니다.");
		
		if (flag!= null && flag==true)
			increaseReadNo(dbProduct);
		
		return dbProduct;
	}

	// 조회 수 증가
	private void increaseReadNo(Product dbProduct) {
		dbProduct.setProductReadNo(dbProduct.getProductReadNo() + 1);
	}

	@Override
	public void decreaseProductStock(String productCode, int qty) {
		Product dbProduct = repository.findById(productCode).orElse(null);
		if (dbProduct == null)
			throw new RuntimeException("상품 코드 오류로 해당 상품을 구매할 수 없습니다.");
		dbProduct.setProductStock((dbProduct.getProductStock() - qty));
	}

}
