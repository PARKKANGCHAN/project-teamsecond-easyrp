package co.second.easyrp.inventorycount.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

//import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface InventoryCountService {
	List<InventoryCountVO> inventoryCountList(
		    @Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("employeeCod") String oboundWarehouse, 
		    @Param("productCod") String oboundLocation, 
		    @Param("countDate") String iboundWarehouse, 
		    @Param("countclass") String iboundLocation, 
		    @Param("qty") String employeeCod,
		    @Param("procClass") String purchaseDetailCod, 
		    @Param("account") String productCod, 
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo);
	
//	List<KeyValueVO> getAllKeyValues();
	
//	List<PurchaseOrderDetailVO> getAllPurchaseOrderDatas();
	
//	CommonTableVO getCommonData(int postId);
	
	int countInventoryCountLists(
		    @Param("cod") String cod,
		    @Param("employeeCod") String oboundWarehouse, 
		    @Param("productCod") String oboundLocation, 
		    @Param("countDate") String iboundWarehouse, 
		    @Param("countclass") String iboundLocation, 
		    @Param("qty") String employeeCod,
		    @Param("procClass") String purchaseDetailCod, 
		    @Param("account") String productCod, 
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate);
}
