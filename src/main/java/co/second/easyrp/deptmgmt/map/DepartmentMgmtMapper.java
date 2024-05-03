package co.second.easyrp.deptmgmt.map;

import java.util.List;


import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;

//(2024년 5월 3일 오후 3시 19분 박현우)
public interface DepartmentMgmtMapper {
	
	List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo);
	
	int countDepartmentTable(SearchVO searchVo);

}
