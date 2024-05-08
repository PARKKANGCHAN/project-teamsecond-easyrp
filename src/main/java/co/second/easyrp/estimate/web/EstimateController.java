package co.second.easyrp.estimate.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
        System.out.println(estimateDetailList);
        model.addAttribute("estimateDetail", estimateDetailList);
        
        return estimateDetailList;
    	
    }

//    @RequestMapping(value = "/salesplaninsertFn", method = RequestMethod.POST)
//    public String salesplanInsert(@RequestParam("ClientName") String ClientName,
//    							  @RequestParam("ProductName") String ProductName,
//    							  @RequestParam("basicplnQty") int basicplnQty,
//    							  SalesplanVO vo) {
//    	
//    	String ClientCod = salesplanService.ClientCodSelect(ClientName);
//    	String ProductCod = salesplanService.ProductCodSelect(ProductName);
//    	
//    	vo.setClientCod(ClientCod);
//    	vo.setProductCod(ProductCod);
//    	vo.setBasicplnQty(basicplnQty);
//    	
//    	
//    	int result = salesplanService.SalesplanInsert(vo);
//    	
//    	
//    	return "redirect:/salesplanmanagement";
//    }
    
	
//	@RequestMapping(value = "/estimateupdate", method = RequestMethod.GET)
//	public String salesplanupdate(@RequestParam("cod") String cod,
//								  Model model) {
//		
//		
//		SalesplanVO vo = salesplanService.SalesplanNameSelect(cod);
//		vo.setCod(cod);
//		String salesplanCod = vo.getCod();
//		
//		String clientName = vo.getName();
//		String productName = vo.getProdName();
//		model.addAttribute("clientName", clientName);
//		model.addAttribute("productName", productName);
//		model.addAttribute("salesplanCod", salesplanCod);
//	  
//		return "easyrp/estimate/estimateupdate"; 
//	}
   
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
    
//    @GetMapping("/api/get-kv")
//    @ResponseBody
//    public List<KeyValueVO> getKeyValues() {
//        return commonTableService.getAllKeyValues();
//   }
    
//    @GetMapping("/api/get-data")
//   @ResponseBody
//    public List<CommonTableCopyVO> getDatas() {
//        return commonTableService.getAllCopyDatas();
//    }
	
}
