package web.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Product;

public interface ProductRepository extends JpaRepository<Product, String>, QuerydslPredicateExecutor<Product> {
	
}
