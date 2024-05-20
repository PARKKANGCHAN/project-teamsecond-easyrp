package co.second.easyrp.purchaseorder.web;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.purchaseorder.service.PurchaseOrderService;
import co.second.easyrp.purchaseorder.service.PurchaseOrderVO;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailService;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

@Controller
public class PurchaseOrderController {
	@Autowired
	PurchaseOrderService purchaseOrderService;
	@Autowired
	PurchaseOrderDetailService purchaseOrderDetailService;
	
	//발주관리 페이지로 이동 + 발주목록
	@RequestMapping("/purchaseordermgmttable")
	public String purchaseOrderList(Model model, PurchaseOrderVO vo) {
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
		
		return "easyrp/purchaseorder/purchaseordermgmttable";
	}
	
	//발주등록 페이지로 이동
	@RequestMapping("/purchaseordermgmtinsert")
	public String purchaseordermgmtinsert(Model model) {
		model.addAttribute("taxDivList", purchaseOrderService.taxDivList());
		return "easyrp/purchaseorder/purchaseordermgmtinsert";
	}
	
	//발주등록
	@PostMapping("/purchaseorderinsertfn")
	public String purchaseorderinsertfn(Model model, PurchaseOrderVO poVO) {
		String poCod = purchaseOrderService.newPoCod();
		int poDetailNum = 1;
		poVO.setCod(poCod);
		purchaseOrderService.insertPo(poVO);
		for (PurchaseOrderDetailVO poDetailVO : poVO.getPoDetailList()) {
			poDetailVO.setPurchaseorderCod(poCod);
			poDetailVO.setNum(poDetailNum);
			purchaseOrderDetailService.insertPoDetail(poDetailVO);
			poDetailNum++;
		}
		return "redirect:/purchaseordermgmttable";
	}
	
	//특정 발주데이터를 보내주는 메소드
	@PostMapping("/ajaxSelectPo")
	@ResponseBody
	public Map<String, Object> ajaxSelectPo(String key) {
		Map<String, Object> returnVO = purchaseOrderService.selectPo(key);
		return returnVO;
	}
	
	//과세구분 리스트를 보내주는 메소드
	@PostMapping("/taxDivList")
	@ResponseBody
	public List<Map<String, Object>> taxDivList() {
		List<Map<String, Object>> taxDivList = purchaseOrderService.taxDivList();
		return taxDivList;
	}
	
}
