package co.second.easyrp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// 메인 페이지 이동
	// 2024년 4월 30일 오전 12시 10분 수정 박현우
	@RequestMapping("/")
	public String rootHome() {
		return "home/home";
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
	
<<<<<<< HEAD
	// 수금 관리 페이지 이동
	// 2024년 4월 30일 오전 11시 18분 추가 박현우
	@RequestMapping("/inventorymovement")
	public String inventorymovement() {
		return "easyrp/inventory/inventorymovement";
	}

=======
	// 판매 계획 관리 페이지 이동
	// 2024년 4얼 30일 오전 11시 23분 추가 류현석
	@RequestMapping("salesplanmanagement")
	public String salesPlan() {
		return "easyrp/salesplan/salesplanmanagement";
	}
	
>>>>>>> origin/feature-salesplan
}
