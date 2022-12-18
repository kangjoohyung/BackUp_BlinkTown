package web.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import web.mvc.domain.Album;

public interface AlbumRepository extends JpaRepository<Album, String>, QuerydslPredicateExecutor<Album>{

}
