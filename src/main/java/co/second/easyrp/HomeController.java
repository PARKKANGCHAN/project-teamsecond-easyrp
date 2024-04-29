package co.second.easyrp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home/home";
	}
	
	// 로그인 페이지 이동
	// 2024년 4월 29일 오후 9시 3분 수정 박현우
	@RequestMapping("/login")
	public String login() {
		return "authentication/login";
	}
	
}
