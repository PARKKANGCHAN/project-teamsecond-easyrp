package co.second.easyrp.productmgmt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductMgmtController {
	
	@GetMapping("/productmgmt")
	public String productMgmt() {
		return "easyrp/productmgmt/productmgmt";
	}
}
