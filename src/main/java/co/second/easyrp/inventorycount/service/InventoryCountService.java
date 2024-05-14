package co.second.easyrp.inventorycount.service;

import java.util.List;


//import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface InventoryCountService {
	List<InventoryCountVO> inventoryCountList(SearchVO searchvo);
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo);
	List<InventoryCountVO> selectInventoryCountList(InventoryCountVO vo);
	List<InventoryCountDetailVO> selectedInventoryCountDetailList(InventoryCountVO vo);

	List<ProductInventoryVO> getAllProductInventoryList();
	
	int countInventoryCountLists(SearchVO searchVo);
}
