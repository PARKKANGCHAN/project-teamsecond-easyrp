package co.second.easyrp.inventory.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.inventory.service.InventoryVO;

public interface InventoryMapper {
	List<InventoryVO> inventoryList(
			@Param("pageSize") int pageSize,
			@Param("offset") int offset,
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee,  
		    @Param("account") String account,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
			);

	int countInventoryLists(
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee, 
		    @Param("account") String account,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
			);
	
	int insertInventory(InventoryVO vo);
	int updateInventory(InventoryVO vo);
	int deleteInventory(InventoryVO vo);
}
