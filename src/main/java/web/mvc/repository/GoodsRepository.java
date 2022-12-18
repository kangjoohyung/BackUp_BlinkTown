package web.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Goods;

public interface GoodsRepository extends JpaRepository<Goods, String>, QuerydslPredicateExecutor<Goods>{

}
