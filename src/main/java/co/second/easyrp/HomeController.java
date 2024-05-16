package co.second.easyrp;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// 메인 페이지 이동
	// 2024년 4월 30일 오전 12시 10분 수정 박현우
	@RequestMapping("/")
	public String rootHome(HttpSession session) {
	    return (session.getAttribute("empCode") != null) ? "home/home" : "redirect:/login";
	}
	
	// 메인 페이지 이동 home을 이용한 이동
	// 2024년 4월 30일 오전 12시 10분 추가 박현우
	@RequestMapping("/home")
	public String home() {
		return "home/home";
	}
	
	// 로그인 페이지 이동
	// 2024년 4월 29일 오후 9시 3분 수정 박현우
	@RequestMapping("/login")
	public String login() {
		return "authentication/login";
	}
	
	// 수금 관리 페이지 이동
	// 2024년 4월 29일 오후 11시 9분 추가 박현우
	@RequestMapping("/collectionmanagement")
	public String collectionManagement() {
		return "easyrp/collection/collectionmanagement";
	}


	// 판매 계획 관리 페이지 이동
	// 2024년 4얼 30일 오전 11시 23분 추가 류현석
	@RequestMapping("salesplanmanagement")
	public String salesPlan() {
		return "easyrp/salesplan/salesplanmanagement";
	}
	
	
}