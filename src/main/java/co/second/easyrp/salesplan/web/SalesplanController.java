package co.second.easyrp.salesplan.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.second.easyrp.commontable.service.CommonTableCopyVO;
import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.commontable.service.KeyValueVO;
import co.second.easyrp.salesplan.service.SalesplanService;
import co.second.easyrp.salesplan.service.SalesplanVO;

@Controller
public class SalesplanController {
	@Autowired
	private SalesplanService salesplanService;

	
    @RequestMapping(value = "/salesplanmanagement", method = RequestMethod.GET)
    public String salesplanmangement(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "10") int size,
                              @RequestParam(required = false) String cod,
                              @RequestParam(required = false) String clientCod,
                              @RequestParam(required = false) String productCod,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
                              Model model) { 
        
    	List<SalesplanVO> salesplan = salesplanService.SalesplanSelectList(page, size, cod, clientCod, productCod, preSearchDate, postSearchDate);
        int totalRecords = salesplanService.countSalesTables(page, size, cod, clientCod, productCod, preSearchDate, postSearchDate);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

        model.addAttribute("salesplan", salesplan);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
        return "easyrp/salesplan/salesplanmanagement";
    }
    
    @RequestMapping(value = "/salesplaninsert", method = RequestMethod.GET)
    public String commonInsert(SalesplanVO vo, Model model) {
    	
    	List<SalesplanVO> ProductNames = new ArrayList<SalesplanVO>();
    	ProductNames = salesplanService.ProductNameSelectList();
    	System.out.println(ProductNames);
    	model.addAttribute("ProductNames", ProductNames);
    	
    	List<SalesplanVO> ClientNames = new ArrayList<SalesplanVO>();
    	ClientNames = salesplanService.ClientNameSelectList();
    	model.addAttribute("ClientNames", ClientNames);
    	
    	
    	
    	return "easyrp/salesplan/salesplaninsert";
    }
   
//    @PostMapping("/commoninsertfn")
//   public String commonInsertFn(CommonTableVO commonTableVO, Model model) {
//    	commonTableService.commonInsert(commonTableVO);
//    	return "redirect:/commontable";
//    }
    
	/*
	 * @RequestMapping(value = "/salesplanupdate", method = RequestMethod.GET)
	 * public String commonUpdate(Model model, @RequestParam("postId") int postId) {
	 * CommonTableVO updateData = commonTableService.getCommonData(postId);
	 * 
	 * model.addAttribute("updateData", updateData);
	 * 
	 * return "easyrp/salesplan/salesplanupdate"; }
	 */
   
//   @PostMapping("/commonupdatefn")
//    public String commonUpdateFn(CommonTableVO commonTableVO) {
//    	commonTableService.commonUpdate(commonTableVO);
//    	
//    	return "redirect:/salesplanupdate";
//    }
    
//    @GetMapping("/commondeletefn")
//    public String commonDeleteFn(CommonTableVO commonTableVO, @RequestParam("postId") int postId, Model model) {
//    	CommonTableVO deleteData = commonTableService.getCommonData(postId);
//    	
//    	model.addAttribute("deleteData", deleteData);
//    	commonTableService.commonDelete(commonTableVO);
//    	return "redirect:/commontable";
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
