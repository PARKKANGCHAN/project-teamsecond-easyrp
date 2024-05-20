package co.second.easyrp.inventorycount.mapper;

import java.util.List;

import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
import co.second.easyrp.inventorycount.service.SearchVO;
import co.second.easyrp.warehouse.service.WareHouseVO;

public interface InventoryCountMapper {
	List<InventoryCountVO> inventoryCountList(SearchVO searchvo);
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo);
	InventoryCountVO selectInventoryCountList(InventoryCountVO vo);
	InventoryCountDetailVO selectedInventoryCountDetailList(InventoryCountDetailVO inventorycountdetailvo);
	int countInventoryCountLists(SearchVO searchVo);
	List<ProductInventoryVO> getAllProductInventoryList();
	List<ProductInventoryVO> getAllSelectedCountList(String prodInvCod);
	int insertCountDetailList(InventoryCountDetailVO inventorycountdetailvo);
	List<WareHouseVO> warehouseList();
	List<ProductInventoryVO> getAllProdInvWarehouse(WareHouseVO warehousevo);
	List<WareHouseVO> selectedWarehouseList(WareHouseVO warehousevo);
	List<ProductInventoryVO> getProdInvAccount(ProductInventoryVO productinventoryvo);
	int selectMaxCod();
	String wareHouseCod(String warehouse);
}
