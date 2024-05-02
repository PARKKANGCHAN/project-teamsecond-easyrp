package co.second.easyrp.inventorymovement.service;

import java.util.List;


public interface InventoryMovementService {
	//재고이동목록, 등록, 수정, 삭제
	List<InventoryMovementVO> InventoryMovementList();
	InventoryMovementVO selectInventoryMovementDateScope(InventoryMovementVO vo);
	int insertInventoryMovement(InventoryMovementVO vo);
	int updateInventoryMovement(InventoryMovementVO vo);
	int deleteInventoryMovement(InventoryMovementVO vo);
}
