package co.second.easyrp.employee.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

}
