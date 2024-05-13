package co.second.easyrp.mrp.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.mps.service.MpsVO;
import co.second.easyrp.mrp.service.MrpVO;

public interface MrpMapper {
	List<MrpVO> mrpSelectListAll(
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("searchPlan") String searchPlan,
		    @Param("searchProdCod") String searchProdCod, 
		    @Param("searchProdName") String searchProdName,   
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
		
		int countMrpTables(
			@Param("searchPlan") String searchPlan,
			@Param("searchProdCod") String searchProdCod,
			@Param("searchProdName") String searchProdName,
			@Param("preSearchDate") Date preSearchDate, 
			@Param("postSearchDate") Date postSearchDate);
		
		MrpVO mrpSelect(MrpVO mrpVo);
		int mrpInsert(List<MrpVO> mrpVo);
		int mrpUpdate(MrpVO mrpVo);
		int mrpDelete(MrpVO mrpVo);
		
		int mpsClosingUpdateToY(MrpVO mrpVo); //mps의 closing컬럼을 N에서 Y로 바꿔준다.
		int mpsClosingUpdateToN(MrpVO mrpVo); //mps의 closing컬럼을 Y에서 N으로 바꿔준다.
		int selectMaxCod(); //숫자가 제일 높은 코드의 숫자를 구한다.
		
		List<String> selectBom(String productCod); //제품번호를 통해서 자품목의 코드를 가져온다.
}
