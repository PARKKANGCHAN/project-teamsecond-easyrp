package co.second.easyrp.invoicedetail.service;

import java.util.List;
import java.util.Map;

public interface InvoicedetailService {
	//발주등록페이지에 있는 청구적용 저장값불러오기에서 modal에 뿌려줄 청구리스트를 가져오기위한 메소드(승인된 청구리스트만 가져옵니다)
	List<Map<String, Object>> applyInvoice();
}
