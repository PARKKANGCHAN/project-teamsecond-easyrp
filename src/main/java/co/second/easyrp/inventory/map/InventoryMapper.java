package co.second.easyrp.inventory.map;

import java.util.List;

import co.second.easyrp.inventory.service.InventoryVO;

public interface InventoryMapper {
	//재고 모든 목록
	List<InventoryVO> inventoryList();

}
