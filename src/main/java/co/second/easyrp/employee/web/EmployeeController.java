package co.second.easyrp.employee.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.second.easyrp.employee.service.EmployeeService;
import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 Employee 컨트롤러
//(2024년 4월 29일 오전 11시 23분 박현우)
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	// 기초 사원 관리 페이지 이동 + 정보 출력
	// (2024년 4월 29일 오후 11시 17분 수정 박현우)
	// 수정내용 : setViewName쪽 easyrp/ 추가
	@RequestMapping("/employeelist")
	public ModelAndView employeeList(ModelAndView modelAndView) {
		
		List<EmployeeVO> employeeList = employeeService.employeeAllList();
		
		modelAndView.addObject("employeeList", employeeList);
		modelAndView.setViewName("easyrp/basic-information/employeeList");
		
		return modelAndView;
	}
	
	// 로그인 기능 구현
	// (2024년 4월 29일 오후 11시 45분 수정 박현우)
	// 수정내용 : ModelAndView는 좋지 않다는 이야기에 기능 분리를 하기 위한 수정
	@RequestMapping("/loginresult")
	@ResponseBody
	public String loginResult(EmployeeVO employeeVo, HttpSession session, RedirectAttributes redirectAttributes) {
	    EmployeeVO employeeLoginResult = employeeService.loginResult(employeeVo);

	    if(employeeLoginResult != null) {
	        // 로그인 성공
	        System.out.println("로그인에 성공했습니다.");
	        session.setAttribute("empCode", employeeLoginResult.getCod());
	        session.setAttribute("empName", employeeLoginResult.getName());
	        session.setAttribute("empDeptCode", employeeLoginResult.getDepartmentCod());
	        session.setAttribute("empPosition", employeeLoginResult.getEmpPosition());
	        return "success"; // 성공 시 success 문자열 반환 (Ajax로 값을 보내서 Ajax 내용을 실행하기 위한 리턴값)
	    } else {
	        // 로그인 실패
	        System.out.println("로그인에 실패했습니다.");
	        return "fail"; // 실패 시 fail 문자열 반환 (Ajax로 값을 보내서 Ajax 내용을 실행하기 위한 리턴값)
	    }
	}



	
}
