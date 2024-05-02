package co.second.easyrp.inventorymovement.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.second.easyrp.inventorymovement.mapper.InventoryMovementMapper;
import co.second.easyrp.inventorymovement.service.InventoryMovementService;
import co.second.easyrp.inventorymovement.service.InventoryMovementVO;

public class InventoryMovementServiceImpl implements InventoryMovementService {

	@Autowired
	InventoryMovementMapper inventorymovementmapper;
	
	@Override
	public List<InventoryMovementVO> InventoryMovementList() {
		// TODO Auto-generated method stub
		return inventorymovementmapper.InventoryMovementList();
	}
	
	@Override
	public InventoryMovementVO selectInventoryMovementDateScope(InventoryMovementVO vo) {
		return inventorymovementmapper.selectInventoryMovementDateScope(vo);
	}
	
	@Override
	public int insertInventoryMovement(InventoryMovementVO vo) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.insertInventoryMovement(vo);
	}

	@Override
	public int updateInventoryMovement(InventoryMovementVO vo) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.updateInventoryMovement(vo);
	}

	@Override
	public int deleteInventoryMovement(InventoryMovementVO vo) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.deleteInventoryMovement(vo);
	}

}
