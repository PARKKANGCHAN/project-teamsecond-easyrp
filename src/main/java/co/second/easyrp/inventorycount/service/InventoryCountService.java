package co.second.easyrp.inventorycount.service;

import java.util.List;

import co.second.easyrp.warehouse.service.WareHouseVO;


//import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface InventoryCountService {
	List<InventoryCountVO> inventoryCountList(SearchVO searchvo);
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo);
	List<InventoryCountVO> selectInventoryCountList(InventoryCountVO vo);
	List<InventoryCountDetailVO> selectedInventoryCountDetailList(InventoryCountVO vo);

	List<ProductInventoryVO> getAllProductInventoryList();
	List<ProductInventoryVO> getAllSelectedCountList(String itemList);
	int countInventoryCountLists(SearchVO searchVo);
	int insertCountDetailList(InventoryCountDetailVO inventorycountdetailvo);
	List<WareHouseVO> warehouseList();
	List<ProductInventoryVO> getAllProdInvWarehouse(WareHouseVO warehousevo);
	List<WareHouseVO> selectedWarehouseList(WareHouseVO warehousevo);
}
