package co.second.easyrp.employee.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import co.second.easyrp.employee.service.EmployeeService;
import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 Employee 컨트롤러
//(2024년 4월 29일 오전 11시 23분 박현우)
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	// 기초 사원 관리 페이지 이동 + 정보 출력
	//(2024년 4월 29일 오전 11시 34분 박현우)
	@RequestMapping("/employeelist")
	public ModelAndView employeeList(ModelAndView modelAndView) {
		
		List<EmployeeVO> employeeList = employeeService.employeeAllList();
		
		modelAndView.addObject("employeeList", employeeList);
		modelAndView.setViewName("basic-information/employeeList");
		
		return modelAndView;
	}
	
	// 로그인 기능 구현
	//(2024년 4월 29일 오후 9시 2분 수정 박현우)
	@RequestMapping("/loginresult")
	public ModelAndView loginResult(ModelAndView modelAndView, EmployeeVO employeeVo, HttpSession session) {
	    
	    EmployeeVO employeeLoginResult = employeeService.loginResult(employeeVo);

	    // 세션에 담아 놓은 객체 어느곳에서든 사용 가능
	    if(employeeLoginResult != null) {
	        // 로그인 성공
	        System.out.println("로그인에 성공했습니다.");
	        session.setAttribute("empCode", employeeLoginResult.getCod());
	        session.setAttribute("empName", employeeLoginResult.getName());
	        session.setAttribute("empDeptCode", employeeLoginResult.getDepartmentCod());
	        session.setAttribute("empPosition", employeeLoginResult.getEmpPosition());
	        modelAndView.setViewName("redirect:/");
	    } else {
	        // 로그인 실패
	        System.out.println("로그인에 실패했습니다.");
	        modelAndView.addObject("failMessage", "아이디 또는 비밀번호를 잘못 입력했습니다.");
	    }
        return modelAndView;
	}

	
}
