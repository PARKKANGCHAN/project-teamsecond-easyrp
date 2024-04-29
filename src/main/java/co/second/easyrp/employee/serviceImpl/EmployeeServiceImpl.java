package co.second.easyrp.employee.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.employee.map.EmployeeMapper;
import co.second.easyrp.employee.service.EmployeeService;
import co.second.easyrp.employee.service.EmployeeVO;


//사원 관리를 구현하기 위한 Employee서비스 구현체 클래스
//(2024년 4월 29일 오전 11시 23분 박현우)
@Service
@Primary
public class EmployeeServiceImpl implements EmployeeService {
	
	// employeeMapper 인터페이스 연결
	@Autowired
	private EmployeeMapper employeeMapper;

	// employee정보(목록)을 구현하기 위한 메서드
	@Override
	public List<EmployeeVO> employeeAllList() {
		return employeeMapper.employeeAllList();
	}

}
