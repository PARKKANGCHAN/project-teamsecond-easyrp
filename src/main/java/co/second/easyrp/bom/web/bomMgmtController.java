package co.second.easyrp.bom.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class bomMgmtController {
	
	
	@GetMapping("/bommgmtinsertmodal")
	public String bomMgmtModal() {
		return "easyrp/productmgmt/modal/bominsertmodal";
	}

}
