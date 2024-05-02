package co.second.easyrp.salesplan.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.second.easyrp.salesplan.service.SalesplanService;
import co.second.easyrp.salesplan.service.SalesplanVO;

@Controller
@RestController
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
	
//	@RequestMapping(value="/salesplaninsert", method=RequestMethod.POST)
//	public String salesplaninsert(@RequestParam("cod") String cod,
//								  @RequestParam("clientCod") String clientCod,
//								  @RequestParam("productCod") String productCod,
//								  @RequestParam("basicplnQty") int basicplnQty,
//								  SalesplanVO vo) {
//		
//		vo.setCod(cod);
//		vo.setClientCod(clientCod);
//		vo.setProductCod(productCod);
//		vo.setBasicplnQty(basicplnQty);
//		
//		int result = salesplanService.SalesplanInsert(vo);
//		
//
//			return "redirect:/salesplanmanagement";
//
//	}
	
	@RequestMapping("/salesplaninsert")
	public ResponseEntity<String> insertSalesplan(@RequestBody SalesplanVO vo) {
		int result = salesplanService.SalesplanInsert(vo);
		if(result == 1) {
			return ResponseEntity.ok("insert 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("insert 실패");
		}
	}
	
	@RequestMapping(value="/salesplandelete", method=RequestMethod.POST)
	public String salesplandelete(@RequestParam("salesplanCod") String cod,
								  SalesplanVO vo) {
		
		vo.setCod(cod);
		
		int result = salesplanService.SalesplanDelete(vo);
		
			return "redirect:/salesplanmanagement";
	}
	
		
}
