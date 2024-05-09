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
							@RequestParam(required=false)String account,
							@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
				            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
				            Model model
							) {
		List<InventoryVO> inventoryList=inventoryservice.inventoryList(page, size, cod, warehouseCod, locationCod, employeeCod, employeeCod, account, preSearchDate, postSearchDate);
			int totalRecords = inventoryservice.countInventoryLists(cod, warehouseCod, locationCod, employeeCod, employeeCod, account, preSearchDate, postSearchDate);
			int totalPages = (int) Math.ceil((double) totalRecords / size);

		int pageGroupSize = 10;
		int currentPageGroup = (page - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("cod", cod);
		model.addAttribute("warehouseCod", warehouseCod);
		model.addAttribute("locationCod", locationCod);
		model.addAttribute("employeeCod", employeeCod);
		model.addAttribute("invDate", invDate);
		model.addAttribute("employeeCod", employeeCod);
		model.addAttribute("account", account);
		model.addAttribute("preSearchDate", preSearchDate);
		model.addAttribute("postSearchDate", postSearchDate);
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/inventory/inventory";
		}
	}
