package co.second.easyrp.invoicedetail.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.invoicedetail.service.InvoicedetailService;
import co.second.easyrp.invoicedetail.service.InvoicedetailVO;

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
	
	@GetMapping("/api/get-invoicedetail")
	@ResponseBody
	public Map<String, Object> getInvoicedetailValue(@RequestParam(value="invoiceCod") String invoiceCod){
		InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
		invoicedetailVo.setInvoiceCod(invoiceCod);
		
		Map<String, Object> response = new HashMap<>();
		response.put("invoicedetailList", invoicedetailService.selectInvoicedetailByInvoiceCod(invoicedetailVo));
		return response;
	}
	
	// 청구를 수정한다.
	@RequestMapping("update-invoicedetail")
	@ResponseBody
	public String updateInvoicedetail(@RequestParam("cod") String cod,
			 					@RequestParam("num") int num,
			 					@RequestParam("qty") int qty) {
		InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
		invoicedetailVo.setInvoiceCod(cod);
		invoicedetailVo.setNum(num);
		invoicedetailVo.setInvMgmtQty(qty);
		System.out.println(invoicedetailVo);
		invoicedetailService.updateInvoicedetail(invoicedetailVo);
		
		return "ok";
	}
}

