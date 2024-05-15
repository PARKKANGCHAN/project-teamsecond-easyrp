package co.second.easyrp.inventorycount.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
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
								 @RequestParam(required = false) String searchLocation,
								 @RequestParam(required = false) String searchWarehouse,
								 @RequestParam(required = false) String searchProduct,
								 @RequestParam(required = false) String searchInventory,
								 @RequestParam(required = false) String searchCountClass,
								 @RequestParam(required = false) String searchEmployee,
								 @RequestParam(required = false) String searchAccount,
								 @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
						         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate) {
		
		searchVO.setSearchCod(searchCod);
		searchVO.setSearchWarehouse(searchWarehouse);
		searchVO.setSearchProduct(searchProduct);
		searchVO.setSearchLocation(searchLocation);
		searchVO.setSearchInventory(searchInventory);
		searchVO.setSearchCountClass(searchCountClass);
		searchVO.setSearchEmployee(searchEmployee);
		searchVO.setSearchAccount(searchAccount);
		searchVO.setOffset((page-1)*pageSize);
		
		List<InventoryCountVO> inventoryCountList=inventorycountservice.inventoryCountList(searchVO);
		
		int totalRecords = inventorycountservice.countInventoryCountLists(searchVO);
		
		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
		int pageGroupSize = 10;
		
		int currentPageGroup = (pageSize - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("inventoryCountList", inventoryCountList);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/inventory/inventorycount";
		
	}
	
	@RequestMapping("/inventorycountinsert")
	public String inventoryCountInsert(InventoryCountVO inventorycountvo, InventoryCountDetailVO inventorycountdetailvo, Model model) {
		
		return "easyrp/inventory/inventorycountinsert";
	}
	
	@GetMapping("/api/get-prodinv")
	@ResponseBody
	public List<ProductInventoryVO> getProdInv(){
		return inventorycountservice.getAllProductInventoryList();
	}
	
	@GetMapping("/api/get-count")
	@ResponseBody
	public List<ProductInventoryVO> getCount(ProductInventoryVO prodInvVO){
		return inventorycountservice.getAllSelectedCountList(prodInvVO);
	}
}
