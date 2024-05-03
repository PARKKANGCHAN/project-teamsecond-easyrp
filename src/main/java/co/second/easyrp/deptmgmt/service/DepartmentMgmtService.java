package co.second.easyrp.deptmgmt.service;

import java.util.List;

//(2024년 5월 3일 오후 3시 13분 박현우)
public interface DepartmentMgmtService {
	
	List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo);

	int countDepartmentTable(SearchVO searchVo);
}
