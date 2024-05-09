package co.second.easyrp.inventorycount.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.second.easyrp.inventorycount.mapper.InventoryCountMapper;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;

public class InventoryCountSerivceImpl implements InventoryCountService {

	@Autowired
	InventoryCountMapper inventorycountmapper;
	
	@Override
	public List<InventoryCountVO> inventoryCountList(int page, int size, String cod, String employeeCod, String productCod, String invCod, String countDate, String countclass, int qty, String procClass, String account, String deleteyn, String note, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		int offset = (page-1)*size;
		return inventorycountmapper.inventoryCountList(size, offset, cod, employeeCod, productCod, invCod, countDate, countclass, qty, procClass, account, deleteyn, note, preSearchDate, postSearchDate);
	}

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
	public int countInventoryCountLists(String cod, String employeeCod, String productCod, String invCod, String countDate, String countclass, int qty, String procClass, String account, String deleteyn, String note, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return inventorycountmapper.countInventoryCountLists(cod, employeeCod, productCod, invCod, countDate, countclass, qty, procClass, account, deleteyn, note, preSearchDate, postSearchDate);
	}

}
