package co.second.easyrp.inventory.service.impl;

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
	private InventoryMapper inventoryMapper;
	
	@Override
	public List<InventoryVO> inventoryList() {
		// TODO Auto-generated method stub
		return inventoryMapper.inventoryList();
	}

}
