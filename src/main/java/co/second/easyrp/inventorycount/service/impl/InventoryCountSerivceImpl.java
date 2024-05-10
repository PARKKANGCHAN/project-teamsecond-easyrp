package co.second.easyrp.inventorycount.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.second.easyrp.inventorycount.mapper.InventoryCountMapper;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.SearchVO;

public class InventoryCountSerivceImpl implements InventoryCountService {

	@Autowired
	InventoryCountMapper inventorycountmapper;
	

	@Override
	public int insertInventoryCount(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.insertInventoryCount(vo);
	}

	@Override
	public int updateInventoryCount(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.updateInventoryCount(vo);
	}

	@Override
	public int deleteInventoryCount(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.deleteInventoryCount(vo);
	}


	@Override
	public List<InventoryCountVO> inventoryCountList(SearchVO searchVo) {
		return inventorycountmapper.inventoryCountList(searchVo);
	}

	@Override
	public int countInventoryCountLists(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.countInventoryCountLists(searchVo);
	}

}
