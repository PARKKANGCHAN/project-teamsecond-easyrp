package co.second.easyrp.employee.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.second.easyrp.employee.service.EmployeeService;
import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 Employee컨트롤러
//(2024년 4월 29일 오전 11시 23분 박현우)
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	// employee리스트 사이트 이동 + 정보 출력
	//(2024년 4월 29일 오전 11시 34분 박현우)
	@RequestMapping("/employeelist")
	public ModelAndView employeeList(ModelAndView modelAndView) {
		
		List<EmployeeVO> employeeList = employeeService.employeeAllList();
		
		modelAndView.addObject("employeeList", employeeList);
		modelAndView.setViewName("easyrp/basic-information/employeeList");
		
		return modelAndView;
	}
	
	// 사원등록 페이지로 이동
	//(2024년 4월 29일 오전 12시 44분 하서현)
	@RequestMapping("/employeeregis")
	public String employeeRegis() {
		return "easyrp/basic-information/employeeRegis";
	}
	
	
	// 사원등록
	//(2024년 4월 29일 오후 2시 38분 하서현)	
	@ResponseBody
	@PostMapping("/employeeregissubmit")
	public String employeeRegisSubmit(EmployeeVO vo) {
		int employeeRegis = employeeService.employeeRegis(vo);
		String message = "";
		if(employeeRegis > 0) {
			message = "success";
		}
		return message;
	}
}
