package co.second.easyrp.productmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.productmgmt.service.ProductGroupService;
import co.second.easyrp.productmgmt.service.ProductGroupVO;
import co.second.easyrp.productmgmt.service.UnitVO;

@Controller
public class ProductGroupController {
	
	@Autowired
	ProductGroupService productGroupService;
	
	@GetMapping("/productgroup")
	public String productGroup() {
		return "easyrp/productgroup/modal/productgroup";
	}

	@GetMapping("/api/get-productgroup")
	@ResponseBody
	public List<ProductGroupVO> getProdGroupData() {
		return productGroupService.tableAllList();
	}
	
}
