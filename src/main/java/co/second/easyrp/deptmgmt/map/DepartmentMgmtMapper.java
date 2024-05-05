package co.second.easyrp.deptmgmt.map;

import java.util.List;

import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;
import co.second.easyrp.deptmgmt.service.WorkplaceVO;

//(2024년 5월 3일 오후 3시 19분 박현우)
public interface DepartmentMgmtMapper {
	
	List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo);
	
	DepartmentMgmtVO getDeptData(String cod);
	
	List<WorkplaceVO> getAllWorkplaceValues();
	
	String getMaxCode();
	
	int deptmgmtInsertFn(DepartmentMgmtVO deptMgmtVo);
	
	int deptmgmtUpdateFn(DepartmentMgmtVO deptMgmtVo);
	
	int deptmgmtDeleteFn(String cod);
	
	int countDepartmentTable(SearchVO searchVo);

}
