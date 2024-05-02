package co.second.easyrp.inventorymovement.mapper;

import java.util.List;

import co.second.easyrp.inventorymovement.service.InventoryMovementVO;

public interface InventoryMovementMapper {
	//재고이동목록, 등록, 수정, 삭제
	List<InventoryMovementVO> InventoryMovementList();
	InventoryMovementVO selectInventoryMovementDateScope(InventoryMovementVO vo);
	int insertInventoryMovement(InventoryMovementVO vo);
	int updateInventoryMovement(InventoryMovementVO vo);
	int deleteInventoryMovement(InventoryMovementVO vo);
}
