package co.second.easyrp.purchaseorder.serviveImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.purchaseorder.map.PurchaseOrderMapper;
import co.second.easyrp.purchaseorder.service.PurchaseOrderService;
import co.second.easyrp.purchaseorder.service.PurchaseOrderVO;

@Service
@Primary
public class PurchaseOrderServiceImpl implements PurchaseOrderService {
	@Autowired
	PurchaseOrderMapper purchaseOrderMapper;

	// 순수 발주리스트를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	@Override
	public List<Map<String, Object>> poMgmtList() {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.poMgmtList();
	}

	// 페이징 및 검색결과가 적용된 발주리스트를 가져오기위한 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	@Override
	public List<Map<String, Object>> poMgmtListPaged(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		vo.setOffset((vo.getPage() - 1) * vo.getSize());
		return purchaseOrderMapper.poMgmtListPaged(vo);
	}

	// 검색결과가 적용된 발주리트스의 갯수를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	@Override
	public int countPoMgmtList(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.countPoMgmtList(vo);
	}

	@Override
	public List<Map<String, Object>> taxDivList() {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.taxDivList();
	}

}