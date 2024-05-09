package co.second.easyrp.inventory.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.second.easyrp.inventory.map.InventoryMapper;
import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventory.service.InventoryVO;

public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryMapper inventorymapper;
	
	@Override
	public List<InventoryVO> inventoryList(int page, int size, String cod, String warehouseCod,
			String locationCod, String employeeCod, String invDate, String account, Date preSearchDate,
			Date postSearchDate) {
		// TODO Auto-generated method stub
		int offset = (page-1)*size;
		return inventorymapper.inventoryList(size, offset, cod, warehouseCod, locationCod, employeeCod, invDate, account, preSearchDate, postSearchDate);
	}

	@Override
	public int countInventoryLists(String cod, String warehouseCod, String locationCod, String employeeCod,
			String invDate, String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return inventorymapper.countInventoryLists(cod, warehouseCod, locationCod, employeeCod, invDate, account, preSearchDate, postSearchDate);
	}

}
