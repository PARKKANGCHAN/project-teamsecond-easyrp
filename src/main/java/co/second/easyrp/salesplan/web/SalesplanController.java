package co.second.easyrp.salesplan.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.second.easyrp.salesplan.service.SalesplanService;
import co.second.easyrp.salesplan.service.SalesplanVO;

@Controller
public class SalesplanController {
	@Autowired
	private SalesplanService salesplanService;
	
	@RequestMapping(value="/salesplanmanagement", method = RequestMethod.GET)
	public String salesplanlist(Model model) {
		
		List<SalesplanVO> Salesplan = new ArrayList<SalesplanVO>();
		Salesplan = salesplanService.SalesplanSelectList();
		model.addAttribute("Salesplan", Salesplan);
		
		return "easyrp/salesplan/salesplanmanagement";
	}
	
	@RequestMapping(value="/salesplaninsert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> salesplaninsert(@RequestBody SalesplanVO vo) {
		
		System.out.println("request : " + vo);
	    int result = salesplanService.SalesplanInsert(vo);
	    
	    
	    Map<String, Object> data = new HashMap<>();
	    data.put("cod", vo.getCod());
	    data.put("clientCod", vo.getClientCod());
	    data.put("productCod", vo.getProductCod());
	    data.put("planDate", vo.getPlanDate());
	    data.put("basicplnQty", vo.getBasicplnQty());
	    data.put("modplnQty", vo.getModplnQty());
	    data.put("stateCod", vo.getStateCod()); 
	    
	    return data;
	}
	

	
	@RequestMapping(value="/salesplandelete", method=RequestMethod.POST)
	public String salesplandelete(@RequestParam("salesplanCod") String cod,
								  SalesplanVO vo) {
		
		vo.setCod(cod);
		
		int result = salesplanService.SalesplanDelete(vo);
		
			return "redirect:/salesplanmanagement";
	}
	
		
}
