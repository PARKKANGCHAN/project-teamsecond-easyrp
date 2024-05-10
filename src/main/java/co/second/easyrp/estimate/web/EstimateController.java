package co.second.easyrp.estimate.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.estimate.service.EstimateService;
import co.second.easyrp.estimate.service.EstimateVO;


@Controller
public class EstimateController {
	@Autowired
	private EstimateService estimateService;
	
    @RequestMapping(value = "/estimatemanagement", method = RequestMethod.GET)
    public String salesplanmangement(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "10") int size,
                              @RequestParam(required = false) String cod,
                              @RequestParam(required = false) String clientCod,
                              @RequestParam(required = false) String employeeCod,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
                              Model model) { 
        
    	List<EstimateVO> estimate = estimateService.EstimateSelectList(page, size, cod, clientCod, employeeCod, preSearchDate, postSearchDate);
        int totalRecords = estimateService.countSalesTables(page, size, cod, clientCod, employeeCod, preSearchDate, postSearchDate);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
        
        model.addAttribute("estimate", estimate);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
        return "easyrp/estimate/estimatemanagement";
    }
    
    @RequestMapping(value = "/estimateinsert", method = RequestMethod.GET)
    public String commonInsert(EstimateVO vo, Model model) {
    	
    	
    	List<EstimateVO> ClientNames = new ArrayList<EstimateVO>();
    	ClientNames = estimateService.ClientNameSelectList();
    	model.addAttribute("ClientNames", ClientNames);
    	
    	
    	
    	return "easyrp/estimate/estimateinsert";
    }
    
    @GetMapping(value = "/estimatedetail")
    @ResponseBody
    public List<EstimateVO> estimateDetail(@RequestParam("cod") String estimateCod,
    							 Model model) {
    	
        List<EstimateVO> estimateDetailList = estimateService.EstimateDetailSelectList(estimateCod);
//        System.out.println(estimateDetailList);
        model.addAttribute("estimateDetail", estimateDetailList);
        
        return estimateDetailList;
    	
    }

	@RequestMapping(value = "/estimateupdate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> estimateUpdate(@RequestParam("cod") String cod,
								 @RequestParam("qty") int qty,
								 @RequestParam("num") int num) {
		
//		System.out.println(qty);
		int result = estimateService.EstimateUpdate(cod, qty, num);
		
		return ResponseEntity.ok().body("{\"message\": \"success\"}");
	}
	
	@RequestMapping(value = "/estimatedetaildelete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> estimatedetailDelete(@RequestParam("productCod") String productCod,
													   @RequestParam("") String cod) {
		
//		System.out.println(productCod);
		int result = estimateService.EstimateDetailDelete(productCod, cod);
		
		return ResponseEntity.ok().body("{\"message\": \"success\"}");
	}
	
	
	@RequestMapping(value = "/productnamelist", method = RequestMethod.GET)
    @ResponseBody
    public List<EstimateVO> productnameList() {
    	
    	List<EstimateVO> productNameList = new ArrayList<EstimateVO>();
    	productNameList = estimateService.ProductNameSelectList();
//    	System.out.println(productNameList);
    

    	return productNameList;
    }
	
	@RequestMapping(value = "/estimatedetailinsert", method = RequestMethod.GET)
	@ResponseBody
	public List<EstimateVO> estimatedetailInsert(@RequestParam("prodname") String prodname,
												 @RequestParam("qty") int qty,
												 @RequestParam("cod") String cod) {
		
		int result = estimateService.EstimateDetailInsert(cod, prodname, qty);
		
		return new ArrayList<>();
	}

	
   
//    @RequestMapping(value = "/estimateinsertFn", method = RequestMethod.POST)
//    public String salesplanInsert(@RequestParam("ClientName") String ClientName) {
//    	
//
//    	
//    	
//    	return "redirect:/salesplanmanagement";
//    }
	
	
//	@PostMapping("/salesplanupdateFn")
//	public String salesplanupdateFn(@RequestParam("cod") String cod,
//    								@RequestParam("modplnQty") int modplnQty,
//    								SalesplanVO vo) {
//	   
//	   vo.setCod(cod);
//	   vo.setModplnQty(modplnQty);
//	   
//	   int result = salesplanService.SalesplanUpdate(vo);
//    	
//    	return "redirect:/salesplanmanagement";
//    }
//    
//	@GetMapping("/salesplandeleteFn")
//    public String salesplandeleteFn(@RequestParam("cod") String cod, 
//    								SalesplanVO vo,
//    								Model model) {
//		
//		vo.setCod(cod);
//		
//    	int result = salesplanService.SalesplanDelete(vo);
//    	
//    	return "redirect:/salesplanmanagement";
//    }
    
    
//    @GetMapping("/api/get-data")
//   @ResponseBody
//    public List<CommonTableCopyVO> getDatas() {
//        return commonTableService.getAllCopyDatas();
//    }
	
}
