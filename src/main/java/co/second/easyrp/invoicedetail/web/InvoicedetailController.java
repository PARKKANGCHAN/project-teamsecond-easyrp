package co.second.easyrp.invoicedetail.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.invoicedetail.service.InvoicedetailService;

@Controller
public class InvoicedetailController {
	@Autowired
	private InvoicedetailService invoicedetailService;
	
	//청구적용 Modal에 뿌려줄 승인된 청구리스트를 보내주는 메소드
	@GetMapping("/applyInvoice")
	@ResponseBody
	public List<Map<String, Object>> applyInvoice() {
		List<Map<String, Object>> returnList = invoicedetailService.applyInvoice();
		
		return returnList;
	}
}

