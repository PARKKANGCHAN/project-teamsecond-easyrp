package co.second.easyrp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home/home";
	}
	
	// 로그인으로 이동
	@RequestMapping("/loginpage")
	public String loginPage() {
		return "authentication/login";
	}
	
	// 로그인으로 이동
	@RequestMapping("/employeelist")
	public String employeeListPage() {
		return "easyrp/basic-information/employeeList";
	}
	
}
