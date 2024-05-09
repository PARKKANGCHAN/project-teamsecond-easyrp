package co.second.easyrp.inventory.web;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventory.service.InventoryVO;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService inventoryservice;
	
	@GetMapping("/inventory")
	public String inventory(@RequestParam(defaultValue="1")int page,
							@RequestParam(defaultValue="10")int size,
							@RequestParam(required=false)String cod,
							@RequestParam(required=false)String warehouseCod,
							@RequestParam(required=false)String locationCod,
							@RequestParam(required=false)String employeeCod,
							@RequestParam(required=false)Date invDate,
							@RequestParam(required=false)int qty,
							@RequestParam(required=false)int unitprice,
							@RequestParam(required=false)int price,
							@RequestParam(required=false)int curInvQty,
							@RequestParam(required=false)int curInvPrice,
							@RequestParam(required=false)int spec,
							@RequestParam(required=false)int unitCod,
							@RequestParam(required=false)int safetyInvQty,
							@RequestParam(required=false)int account,
							@RequestParam(required=false)int note,
							@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
				            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
				            Model model
							) {
		List<InventoryVO> inventoryList=inventoryservice.inventoryList(page, size, cod, warehouseCod, locationCod, employeeCod, invDate, qty, unitprice, price, curInvQty, curInvPrice, spec, unitCod, safetyInvQty, account, preSearchDate, postSearchDate)
			int totalRecords = inventoryservice.countInventoryLists(cod, oboundWarehouse, oboundLocation, iboundWarehouse, iboundLocation, employeeCod, purchaseDetailCod, productCod, preSearchDate, postSearchDate);
		int totalPages = (int) Math.ceil((double) totalRecords / size);

		int pageGroupSize = 10;
		int currentPageGroup = (page - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("oboundWarehouse", oboundWarehouse);
		model.addAttribute("oboundLocation", oboundLocation);
		model.addAttribute("iboundWarehouse", iboundWarehouse);
		model.addAttribute("iboundLocation", iboundLocation);
		model.addAttribute("employeeCod", employeeCod);
		model.addAttribute("purchaseDetailCod", purchaseDetailCod);
		model.addAttribute("productCod", productCod);
		model.addAttribute("preSearchDate", preSearchDate);
		model.addAttribute("postSearchDate", postSearchDate);
		model.addAttribute("inventoryMovementList", inventoryMovementList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/inventory/inventorymovement";
		}
	}
}
