package co.second.easyrp.inventorymovement.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.commontable.service.CommonTableCopyVO;
import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.commontable.service.KeyValueVO;


public interface InventoryMovementService {
	//재고이동목록, 등록, 수정, 삭제
	
	List<InventoryMovementVO> inventoryMovementList(
		    @Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("oboundWarehouse") String oboundWarehouse, 
		    @Param("oboundLocation") String oboundLocation, 
		    @Param("iboundWarehouse") String iboundWarehouse, 
		    @Param("iboundLocation") String iboundLocation, 
		    @Param("employeeCod") String employeeCod,
		    @Param("purchaseDetailCod") String purchaseDetailCod, 
		    @Param("productCod") String productCod, 
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	InventoryMovementVO selectInventoryMovementDateScope(InventoryMovementVO vo);
	int insertInventoryMovement(InventoryMovementVO vo);
	int updateInventoryMovement(InventoryMovementVO vo);
	int deleteInventoryMovement(InventoryMovementVO vo);
	
	List<KeyValueVO> getAllKeyValues();
	
	List<CommonTableCopyVO> getAllCopyDatas();
	
	CommonTableVO getCommonData(int postId);
	
	int countInventoryMovementLists(
			@Param("cod") String cod,
		    @Param("oboundWarehouse") String oboundWarehouse, 
		    @Param("oboundLocation") String oboundLocation, 
		    @Param("iboundWarehouse") String iboundWarehouse, 
		    @Param("iboundLocation") String iboundLocation, 
		    @Param("employeeCod") String employeeCod,
		    @Param("purchaseDetailCod") String purchaseDetailCod, 
		    @Param("productCod") String productCod, 
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate);
}
