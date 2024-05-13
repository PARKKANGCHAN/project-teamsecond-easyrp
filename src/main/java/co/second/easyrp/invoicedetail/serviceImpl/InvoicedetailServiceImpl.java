package co.second.easyrp.invoicedetail.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.invoicedetail.mapper.InvoicedetailMapper;
import co.second.easyrp.invoicedetail.service.InvoicedetailService;

@Service
@Primary
public class InvoicedetailServiceImpl implements InvoicedetailService {
	@Autowired
	InvoicedetailMapper invoicedetailMapper;
	
	//발주등록페이지에 있는 청구적용 저장값불러오기에서 modal에 뿌려줄 청구리스트를 가져오기위한 메소드(승인된 청구리스트만 가져옵니다)
	@Override
	public List<Map<String, Object>> applyInvoice() {
		// TODO Auto-generated method stub
		return invoicedetailMapper.applyInvoice();
	}

}
