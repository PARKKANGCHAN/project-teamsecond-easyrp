package co.second.easyrp.inventorymgmt.map;

import java.util.List;

import co.second.easyrp.inventorymgmt.service.InventoryMgmtVO;
import co.second.easyrp.inventorymgmt.service.SearchVO;

//(2024년 5월 9일 오후 11시 11분 박현우)
public interface InventoryMgmtMapper {
	
	// 데이터베이스에서 삭제되지 않은 모든 값을 가져오기 위한 인터페이스
	List<InventoryMgmtVO> tableAllList(SearchVO searchVO);

	// 검색 후 페이지네이션을 위한 인터페이스
	int countTable(SearchVO searchVO);
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int insertFn(InventoryMgmtVO inventoryMgmtVO);
	
	// 코드의 최대값을 가져와서 값을 자동 삽입 해주기 위한 인터페이스
	String getMaxCode();
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int updateFn(InventoryMgmtVO inventoryMgmtVO);
	
}
