package web.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/info")
public class InfoController {
	@RequestMapping("/{url}")
	public void url() {}
}
