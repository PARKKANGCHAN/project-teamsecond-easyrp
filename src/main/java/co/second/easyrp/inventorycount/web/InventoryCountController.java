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

@Controller
public class InventoryCountController {

	@Autowired
	InventoryCountService inventorycountservice;
	
	@GetMapping("/inventorycount")
	public String inventoryCount(
//	public String inventoryCount(@RequestParam(defaultValue="1") int page,
//								 @RequestParam(defaultValue="10") int size,
//								 @RequestParam(required = false) String cod,
//								 @RequestParam(required = false) String employeeCod,
//								 @RequestParam(required = false) String productCod,
//								 @RequestParam(required = false) String invCod,
//								 @RequestParam(required = false) String countDate,
//								 @RequestParam(required = false) String countclass,
//								 @RequestParam(required = false) String procClass,
//								 @RequestParam(required = false) String account,
//								 @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
//						         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
						         Model model) {
		String viewpage = "easyrp/inventory/inventorycount";
//		List<InventoryCountVO> inventoryCountList = inventorycountservice.inventoryCountList(page, size, cod, employeeCod, productCod, invCod, countDate, countclass, procClass, account, preSearchDate, postSearchDate);
//		int totalRecords = inventorycountservice.countInventoryCountLists(cod, employeeCod, productCod, invCod, countDate, countclass, size, procClass, account, preSearchDate, postSearchDate);
//		int totalPages = (int) Math.ceil((double) totalRecords / size);
		return viewpage;
	}
}
