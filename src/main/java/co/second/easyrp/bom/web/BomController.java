package co.second.easyrp.bom.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.bom.service.BomService;
import co.second.easyrp.bom.service.BomVO;

@Controller
public class BomController {
	
	@Autowired
	BomService bomService;
	
	
	@GetMapping("/bominsertmodal")
	public String bomInsertModal() {	
		return "easyrp/productmgmt/modal/bominsertmodal";
	}
	
	@GetMapping("/api/get-productdata")
	@ResponseBody
	public BomVO getProductData(BomVO bomVo) {
		return bomService.getData(bomVo);
	}
	
	

}
