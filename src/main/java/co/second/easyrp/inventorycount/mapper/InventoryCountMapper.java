package co.second.easyrp.inventorycount.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.inventorycount.service.InventoryCountVO;

public interface InventoryCountMapper {
	List<InventoryCountVO> inventoryCountList(
		    @Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("employeeCod") String employeeCod, 
		    @Param("productCod") String productCod, 
		    @Param("invCod") String invCod,
		    @Param("countDate") String countDate, 
		    @Param("countclass") String countclass, 
		    @Param("qty") int qty,
		    @Param("procClass") String procClass, 
		    @Param("account") String account, 
		    @Param("deleteyn") String deleteyn, 
		    @Param("note") String note, 
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
		    @Param("employeeCod") String employeeCod, 
		    @Param("productCod") String productCod, 
		    @Param("invCod") String invCod,
		    @Param("countDate") String countDate, 
		    @Param("countclass") String countclass, 
		    @Param("qty") int qty,
		    @Param("procClass") String procClass, 
		    @Param("account") String account, 
		    @Param("deleteyn") String deleteyn, 
		    @Param("note") String note, 
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		    );
}

