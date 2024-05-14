package co.second.easyrp.inventory.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.inventory.map.InventoryMapper;
import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventory.service.InventoryVO;

@Service
@Primary
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryMapper inventorymapper;

	@Override
	public List<InventoryVO> inventoryList(int page, int size, String cod, String warehouse,
			 String employee, String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		int offset = (page-1)*size;
		return inventorymapper.inventoryList(size, offset, cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	@Override
	public int countInventoryLists(String cod, String warehouse, String employee,
			String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return inventorymapper.countInventoryLists(cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	@Override
	public int insertInventory(InventoryVO vo) {
		// TODO Auto-generated method stub
		return inventorymapper.insertInventory(vo);
	}

	@Override
	public int updateInventory(InventoryVO vo) {
		// TODO Auto-generated method stub
		return inventorymapper.updateInventory(vo);
	}

	@Override
	public int deleteInventory(InventoryVO vo) {
		// TODO Auto-generated method stub
		return inventorymapper.deleteInventory(vo);
	}
	


}