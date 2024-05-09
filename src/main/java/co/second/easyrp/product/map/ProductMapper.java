package co.second.easyrp.product.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.product.service.ProductVO;

public interface ProductMapper {
	List<ProductVO>productList(
			@Param("pageSize") int pageSize,
			@Param("offset") int offset,
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee,  
		    @Param("account") String account,
			 @Param("preSearchDate") Date preSearchDate, 
			    @Param("postSearchDate") Date postSearchDate
	);
	
	int countProductLists(
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee, 
		    @Param("account") String account,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
			);
}
