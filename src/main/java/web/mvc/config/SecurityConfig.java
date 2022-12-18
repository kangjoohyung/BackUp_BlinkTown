package web.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.AllArgsConstructor;
import web.mvc.security.UserAuthenticationFailureHandler;
import web.mvc.security.UserAuthenticationProvider;
import web.mvc.service.UsersService;


@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	@Autowired
	private AuthenticationProvider userAuthenticationProvider;
	
	@Autowired
	private UserAuthenticationFailureHandler failurehander;
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
	    return super.authenticationManagerBean();
	}
	
	@Bean
    public static BCryptPasswordEncoder encodePassword() {  // 회원가입 시 비밀번호 암호화에 사용할 Encoder 빈 등록
        return new BCryptPasswordEncoder();
	}
   
   @Override
   protected void configure(HttpSecurity http) throws Exception {

      http.authorizeRequests()  //  security-context  <security:intercept-url
     //로그인 없이 접근 가능한url
      .antMatchers( "/error/**",
    		  		"/info/**",
    		  		"/main/**",
    		  		"/system/**", 
    		  		"/success/**",
    		  		"/shop/**",
    		  		"/index"
    		  		).permitAll() 
      //
      .antMatchers("/mypage/**")
      .access("hasRole('MEMBER') or hasRole('USER') or hasRole('ADMIN')")
				/* .antMatchers("/shop/**")
				 * .access("hasRole('MEMBER') or hasRole('USER')or hasRole('ADMIN')")
				 */
      .antMatchers("/board/**") 
      .access("hasRole('MEMBER') or hasRole('ADMIN')")  

      //주문에서 사용할 3가지에 권한 필요
      .antMatchers("/orders/ordersForm") 
      .access("hasRole('MEMBER') or hasRole('USER')")
      .antMatchers("/orders/directOrder/**") 
      .access("hasRole('MEMBER') or hasRole('USER')")
      .antMatchers("/orders/checkout") 
      .access("hasRole('MEMBER') or hasRole('USER')")
             
      ///admin'의 경우 ADMIN 권한이 있는 사용자만 접근이 가능
      .antMatchers("/admin/**")
      .hasRole("ADMIN")
      .and()
      //.csrf().disable() // <security:csrf disabled="true"/>
      .formLogin()
      .loginPage("/users/loginForm")
      .loginProcessingUrl("/loginCheck")
      .usernameParameter("usersId")
      .passwordParameter("usersPwd")
      .defaultSuccessUrl("/")
      .failureHandler(failurehander)
      .and()
      .logout()
      .logoutUrl("/logout")
      .logoutSuccessUrl("/")
      .invalidateHttpSession(true)
      .deleteCookies("JSESSIONID")
      .and();
   }


   
   
   @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(userAuthenticationProvider);
	}
	
    
  
}