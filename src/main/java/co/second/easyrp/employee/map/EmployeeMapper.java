package co.second.easyrp.employee.map;

import java.util.List;

import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 EmployeeMapper 인터페이스
//(2024년 4월 29일 오전 11시 20분 박현우)
public interface EmployeeMapper {
	
	// 사원 데이터베이스 테이블의 모든 정보를 가져오는 메서드
	// (2024년 4월 29일 오전 11시 20분 박현우)
	List<EmployeeVO> employeeAllList();
	
	// 로그인 기능 구현을 위한 추상 메서드
	// (2024년 4월 29일 오후 1시 4분 박현우)
	EmployeeVO loginResult(EmployeeVO vo);
}
