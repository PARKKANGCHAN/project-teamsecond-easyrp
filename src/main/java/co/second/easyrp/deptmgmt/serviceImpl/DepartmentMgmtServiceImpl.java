package co.second.easyrp.deptmgmt.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.deptmgmt.map.DepartmentMgmtMapper;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtService;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;

@Service
@Primary
public class DepartmentMgmtServiceImpl implements DepartmentMgmtService {
	
	@Autowired
	private DepartmentMgmtMapper departmentMgmtMapper;

	@Override
	public List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo) {
		return departmentMgmtMapper.departmentTableAllList(searchVo);
	}

	@Override
	public int countDepartmentTable(SearchVO searchVo) {
		return departmentMgmtMapper.countDepartmentTable(searchVo);
	}

}
