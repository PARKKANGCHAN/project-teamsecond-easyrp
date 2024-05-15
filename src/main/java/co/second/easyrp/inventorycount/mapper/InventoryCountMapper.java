package co.second.easyrp.inventorycount.mapper;

import java.util.List;

import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
import co.second.easyrp.inventorycount.service.SearchVO;

public interface InventoryCountMapper {
	List<InventoryCountVO> inventoryCountList(SearchVO searchvo);
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo);
	List<InventoryCountVO> selectInventoryCountList(InventoryCountVO vo);
	List<InventoryCountDetailVO> selectedInventoryCountDetailList(InventoryCountVO vo);
//	List<KeyValueVO> getAllKeyValues();
	
//	List<PurchaseOrderDetailVO> getAllPurchaseOrderDatas();
	
//	CommonTableVO getCommonData(int postId);
	
	int countInventoryCountLists(SearchVO searchVo);
	List<ProductInventoryVO> getAllProductInventoryList();
	List<ProductInventoryVO> getAllSelectedCountList();
}
