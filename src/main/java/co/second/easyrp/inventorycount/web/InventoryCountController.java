package co.second.easyrp.inventorycount.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.SearchVO;

@Controller
public class InventoryCountController {

	@Autowired
	InventoryCountService inventorycountservice;
	
	@GetMapping("/inventorycount")
	public String inventoryCount(SearchVO searchVO, Model model, 
								 @RequestParam(defaultValue="1") int page,
								 @RequestParam(defaultValue="10") int pageSize,
								 @RequestParam(required = false) String searchCod,
								 @RequestParam(required = false) String searchLocationName,
								 @RequestParam(required = false) String searchWarehouseName,
								 @RequestParam(required = false) String searchProductName,
								 @RequestParam(required = false) String searchInventoryName,
								 @RequestParam(required = false) String searchCountClass,
								 @RequestParam(required = false) String searchEmployeeName,
								 @RequestParam(required = false) String searchAccount,
								 @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
						         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate) {
		
		searchVO.setSearchCod(searchCod);
		searchVO.setSearchLocationName(searchLocationName);
		searchVO.setSearchWarehouseName(searchWarehouseName);
		searchVO.setSearchProductName(searchProductName);
		searchVO.setSearchInventoryName(searchInventoryName);
		searchVO.setSearchCountClass(searchCountClass);
		searchVO.setSearchEmployeeName(searchEmployeeName);
		searchVO.setSearchAccount(searchAccount);
		searchVO.setOffset((page-1)*pageSize);
		
		List<InventoryCountVO> inventoryCountVO=inventorycountservice.inventoryCountList(searchVO);
		
		int totalRecords = inventorycountservice.countInventoryCountLists(searchVO);
		
		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
		int pageGroupSize = 10;
		
		int currentPageGroup = (pageSize - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("inventorycount", inventorycount);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/inventory/inventorycount";
		
	}
}
