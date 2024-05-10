package co.second.easyrp.inventorycount.service;

import java.util.List;


//import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface InventoryCountService {
	List<InventoryCountVO> inventoryCountList(SearchVO searchvo);
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo);
	
//	List<KeyValueVO> getAllKeyValues();
	
//	List<PurchaseOrderDetailVO> getAllPurchaseOrderDatas();
	
//	CommonTableVO getCommonData(int postId);
	
	int countInventoryCountLists(SearchVO searchVo);
}
