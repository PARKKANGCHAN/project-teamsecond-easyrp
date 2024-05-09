package co.second.easyrp.estimate.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface EstimateService {
	
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
	int EstimateUpdate(String cod, int qty, int num);
	int EstimateDelete(EstimateVO vo);
	int EstimateDetailDelete(String productCod);
	
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
	List<EstimateVO> ProductNameSelectList();
	
	List<EstimateVO> EstimateDetailSelectList(String cod);
	
	
}
