package web.mvc.security;

import java.io.IOException;
/**
 * ������ �������� �� ȣ��Ǿ�����  �޼ҵ�� ������ ������ �� �ؾ��� ���� �ۼ��Ѵ�.
 * */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service   //id = "memeberAuthenticationFailureHandler" 
public class UserAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
	request.setAttribute("errorMessage", exception.getMessage());
	request.getRequestDispatcher("/WEB-INF/views/system/loginForm.jsp").forward(request, response);
		

	}

}
