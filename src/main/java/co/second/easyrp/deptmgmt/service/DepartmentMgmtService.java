package co.second.easyrp.deptmgmt.service;

import java.util.List;

//(2024년 5월 3일 오후 3시 13분 박현우)
public interface DepartmentMgmtService {
	
	List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo);
	
	DepartmentMgmtVO getDeptData(String cod);
	
	List<WorkplaceVO> getAllWorkplaceValues();
	
	String getMaxCode();
	
	int deptmgmtInsertFn(DepartmentMgmtVO deptMgmtVo);
	
	int deptmgmtUpdateFn(DepartmentMgmtVO deptMgmtVo); // 아직 미완성
	
	int deptmgmtDeleteFn(String cod); // 아직 미완성

	int countDepartmentTable(SearchVO searchVo);
}
