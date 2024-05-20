package co.second.easyrp.bom.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.bom.service.BomService;
import co.second.easyrp.bom.service.BomVO;
import co.second.easyrp.collectedmoney.service.CollectedMoneyVO;

@Controller
public class BomController {
	
	@Autowired
	BomService bomService;
	
	
	@GetMapping("/bominsert")
	public String bomInsert() {	
		return "easyrp/bom/bominsert";
	}
	
	@PostMapping("/bominsertfn")
	public String bomInsertFn(BomVO bomVO) {
		bomService.insertFn(bomVO);
		return "redirect:/productmgmt";
	}
	
	@PostMapping("/api/get-hyunwoo-productdata")
	@ResponseBody
	public List<BomVO> getHyunwooProductData() {
		return bomService.getHyunwooProductData();
	}
	
	@GetMapping("/setvalueproductdata")
	public String setValueProductData() {
		return "easyrp/bom/modal/setvalueproductdata";
	}
	

}
