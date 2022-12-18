package web.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

		@RequestMapping("/")
		public String Index() {
			return "/main/main";
		}
		
		@RequestMapping("/upLoadFormTest")
		public String Index1() {
			return "upLoadFormTest";
		}
}
