package co.second.easyrp.purchaseorderdetail.map;

import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface PurchaseOrderDetailMapper {
	//발주상세테이블에 발주등록을하는 메소드
	//하서현
	int insertPoDetail(PurchaseOrderDetailVO vo);
}
