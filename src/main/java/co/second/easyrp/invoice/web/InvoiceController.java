package co.second.easyrp.invoice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.invoice.service.InvoiceVO;
import co.second.easyrp.invoice.service.SearchVO;
import co.second.easyrp.mrp.service.MrpService;
import co.second.easyrp.mrp.service.MrpVO;

@Controller
public class InvoiceController {
	@Autowired InvoiceService invoiceService;
	@Autowired MrpService mrpService;
	
	@GetMapping("invoicemanagement")
	public String invoiceManagement(SearchVO searchVo, Model model) {
		List<InvoiceVO> invoiceTable = invoiceService.selectInvoiceAll(searchVo);
        int totalRecords = invoiceService.countInvoiceTables(searchVo);
        int size = searchVo.getPageSize();
        int page = searchVo.getOffset();
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

        model.addAttribute("search", searchVo);
        model.addAttribute("invoiceTable", invoiceTable);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
		return "easyrp/invoice/invoicemanagement";
	}
	
	@RequestMapping("invoiceinsert")
	public String invoiceInsert() {
		return "easyrp/invoice/invoiceinsert";
	}
	
	@RequestMapping("invoiceinsertfn")
	public String invoiceInsertfn() {
		return "redirect:/invoicemanagement";
	}
	
	@GetMapping("invoicedeletefn")
	public String invoiceDeleteFn(InvoiceVO invoiceVo, @RequestParam("cod") String cod) {
		invoiceVo.setCod(cod);
		invoiceVo = invoiceService.selectInvoice(invoiceVo);
		invoiceService.mrpClosingUpdateToY(cod);
		invoiceService.deleteInvoice(invoiceVo);
		return "redirect:/invoicemanagement";
	}
	
	// 소요량 전개 리스트를 가져온다.
	@GetMapping("/api/get-mrpval")
	@ResponseBody
	public List<MrpVO> getMrpValues(){
		return mrpService.mrpSelectListAllModal();
	}
	
	
}
