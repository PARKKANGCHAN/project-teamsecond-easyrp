package co.second.easyrp.inventorycount.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import co.second.easyrp.inventorycount.service.InventoryCountService;

@Controller
public class InventoryCountController {

	@Autowired
	InventoryCountService inventorycountservice;
	
	@GetMapping("/inventorycount")
	public String inventoryCount
}
