package co.second.easyrp.estimate.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.estimate.service.EstimateVO;

public interface EstimateMapper {

	List<EstimateVO> EstimateSelectList(		    
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	EstimateVO EstimateSelect(EstimateVO vo);
	int EstimateInsert(EstimateVO vo);
	int EstimateUpdate(EstimateVO vo);
	int EstimateDelete(EstimateVO vo);
	
	int countSalesTables(
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	List<EstimateVO> ClientNameSelectList();
	
}
