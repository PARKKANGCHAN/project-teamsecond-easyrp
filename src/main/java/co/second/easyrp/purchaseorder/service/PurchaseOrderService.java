package co.second.easyrp.purchaseorder.service;

import java.util.List;
import java.util.Map;


public interface PurchaseOrderService {
	// 순수 발주리스트를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	List<Map<String, Object>> poMgmtList();

	// 페이징 및 검색결과가 적용된 발주리트스를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	List<Map<String, Object>> poMgmtListPaged(PurchaseOrderVO vo);

	// 검색결과가 적용된 발주리트스의 갯수를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	int countPoMgmtList(PurchaseOrderVO vo);

	//과세구분리스트를 가져오는 메소드
	List<Map<String, Object>> taxDivList();
}

