package web.mvc.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorSuccessController implements ErrorController {

	@GetMapping("/error")
	public String errorurl(HttpServletRequest request, Model model) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());
			
			switch (statusCode) {
			case 403:
				model.addAttribute("message", "회원 권한이 부족합니다.");
				break;
			case 404:
				model.addAttribute("message", "요청하신 내용을 찾지 못 했습니다.");
				break;
			case 500:
				model.addAttribute("message", "부적절한 요청입니다.");
				break;
			default:
				model.addAttribute("message", "에러 발생하여 요청 처리 불가합니다.");
				break;
			}
		}
		return "error/error";
	}

	@RequestMapping("/success/{url}")
	public void successurl() {
	}
}
