package co.second.easyrp.purchasedeadline.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.second.easyrp.purchaseorder.service.PurchaseOrderService;
import co.second.easyrp.purchaseorder.service.PurchaseOrderVO;

@Controller
public class purchasedeadlineController {
	@Autowired PurchaseOrderService purchaseOrderService;
	
	@GetMapping("/purchasedeadline")
	public String purchasedeadline(Model model, PurchaseOrderVO vo) {
		List<Map<String, Object>> returnList = purchaseOrderService.poMgmtListPaged(vo); 
		int totalRecords = purchaseOrderService.countPoMgmtList(vo);
		int totalPages = (int) Math.ceil((double) totalRecords / vo.getSize());
		int pageGroupSize = 10;
		int currentPageGroup = (vo.getPage() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		model.addAttribute("poMgmtList", returnList); //발주목록에 뿌려줄 리스트 반환
		model.addAttribute("vo", vo); //검색조건 및 현재페이지 반환
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/purchase-deadline/purchasedeadline";
	}
}
