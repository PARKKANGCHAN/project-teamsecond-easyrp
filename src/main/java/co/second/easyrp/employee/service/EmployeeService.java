package co.second.easyrp.employee.service;

import java.util.List;

//사원 관리를 구현하기 위한 EmployeeService 인터페이스
//(2024년 4월 29일 오전 11시 17분 박현우)
public interface EmployeeService {
	
	// 사원 데이터베이스 테이블의 모든 정보를 가져오는 메서드
	List<EmployeeVO> employeeAllList();
	
}
