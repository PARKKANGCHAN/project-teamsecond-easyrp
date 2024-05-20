package co.second.easyrp.purchaseorderdetail.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.purchaseorderdetail.map.PurchaseOrderDetailMapper;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailService;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

@Service
@Primary
public class PurchaseOrderDetailServiceImpl implements PurchaseOrderDetailService {
	@Autowired
	private PurchaseOrderDetailMapper purchaseOrderDetailMapper;
	
	//발주상세테이블에 발주등록을하는 메소드
	//하서현
	@Override
	public int insertPoDetail(PurchaseOrderDetailVO vo) {
		// TODO Auto-generated method stub
		return purchaseOrderDetailMapper.insertPoDetail(vo);
	}

}
