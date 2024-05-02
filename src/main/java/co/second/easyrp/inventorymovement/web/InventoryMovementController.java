package co.second.easyrp.inventorymovement.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.second.easyrp.inventorymovement.service.InventoryMovementService;
import co.second.easyrp.inventorymovement.service.InventoryMovementVO;

@Controller
public class InventoryMovementController {
	
	@Autowired
	InventoryMovementService inventorymovementService;
	
	@RequestMapping(value="inventorymovement", method=RequestMethod.GET)
	public String inventoryMovementList(Model model, InventoryMovementVO inventorymovementvo) {
		List<InventoryMovementVO> inventoryMovementList=inventorymovementService.InventoryMovementList();
		model.addAttribute("inventorymovementList", inventoryMovementList);
		
		return "easyrp/inventory/inventorymovement";
		
	}
}
