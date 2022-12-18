package web.mvc.config;

import java.util.Properties;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.querydsl.jpa.impl.JPAQueryFactory;

@SpringBootConfiguration
public class ApplicationConfig {

	@PersistenceContext
	private EntityManager em;

	@Bean
	public JPAQueryFactory queryFactory() {
		return new JPAQueryFactory(em);
	}

	@Bean
	public SimpleMappingExceptionResolver getSimpleMappingExceptionResolver() {
		SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();
		Properties pro = new Properties();
		pro.put("Exception", "error/errorView");

		exceptionResolver.setExceptionMappings(pro);
		return exceptionResolver;
	}

}
