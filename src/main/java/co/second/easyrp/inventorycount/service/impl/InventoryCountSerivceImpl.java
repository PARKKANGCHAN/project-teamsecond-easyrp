package co.second.easyrp.inventorycount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.inventorycount.mapper.InventoryCountMapper;
import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
import co.second.easyrp.inventorycount.service.SearchVO;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Service
@Primary
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

	@Override
	public InventoryCountVO selectInventoryCountList(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectInventoryCountList(vo);
	}

	@Override
	public InventoryCountDetailVO selectedInventoryCountDetailList(InventoryCountDetailVO inventorycountdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectedInventoryCountDetailList(inventorycountdetailvo);
	}

	@Override
	public List<ProductInventoryVO> getAllProductInventoryList() {
		// TODO Auto-generated method stub
		return inventorycountmapper.getAllProductInventoryList();
	}

	@Override
	public List<ProductInventoryVO> getAllSelectedCountList(String itemList) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getAllSelectedCountList(itemList);
	}

	@Override
	public int insertCountDetailList(InventoryCountDetailVO inventorycountdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.insertCountDetailList(inventorycountdetailvo);
	}

	@Override
	public List<WareHouseVO> warehouseList() {
		// TODO Auto-generated method stub
		return inventorycountmapper.warehouseList();
	}

	@Override
	public List<ProductInventoryVO> getAllProdInvWarehouse(WareHouseVO warehousevo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getAllProdInvWarehouse(warehousevo);
	}

	@Override
	public List<WareHouseVO> selectedWarehouseList(WareHouseVO warehousevo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectedWarehouseList(warehousevo);
	}

	@Override
	public List<ProductInventoryVO> getProdInvAccount(ProductInventoryVO productinventoryvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getProdInvAccount(productinventoryvo);
	}

	@Override
	public int selectMaxCod() {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectMaxCod();
	}



}
