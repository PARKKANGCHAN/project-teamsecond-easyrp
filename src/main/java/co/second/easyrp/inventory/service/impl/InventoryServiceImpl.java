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
	public List<InventoryVO> inventoryList(int page, int size, String cod, String warehouseCod,
			String locationCod, String employeeCod, String invDate, String qty, String unitprice, String price,
			String curInvQty, String curInvPrice, String spec, String unitCod, String safetyInvQty, String account,
			Date preSearchDate, Date postSearchDate) {
		int offset = (page-1)*size;
		// TODO Auto-generated method stub
		
		return inventorymapper.inventoryList(size, offset, cod, warehouseCod, locationCod, employeeCod, invDate, qty, unitprice, price, curInvQty, curInvPrice, spec, unitCod, safetyInvQty, account, preSearchDate, postSearchDate);
	}

	@Override
	public int countInventoryLists(String cod, String warehouseCod, String locationCod, String employeeCod,
			String invDate, String qty, String unitprice, String price, String curInvQty, String curInvPrice,
			String spec, String unitCod, String safetyInvQty, String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return inventorymapper.countInventoryLists(cod, warehouseCod, locationCod, employeeCod, invDate, qty, unitprice, price, curInvQty, curInvPrice, spec, unitCod, safetyInvQty, account, preSearchDate, postSearchDate);
	}

}
