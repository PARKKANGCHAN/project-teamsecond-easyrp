package co.second.easyrp.productmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.second.easyrp.productmgmt.service.UnitService;
import co.second.easyrp.productmgmt.service.UnitVO;

@Controller
public class UnitController {
	
	@Autowired
	UnitService unitService;


	@GetMapping("/unit")
	public String unit(Model model) {
		List<UnitVO> unit = unitService.unitTableAllList();
		
		model.addAttribute("unit", unit);
		return "easyrp/unit/modal/unit";
	}
}
