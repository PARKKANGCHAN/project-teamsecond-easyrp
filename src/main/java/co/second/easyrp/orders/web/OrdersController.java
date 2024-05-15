package co.second.easyrp.orders.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.estimate.service.EstimateVO;
import co.second.easyrp.orders.service.OrderService;


@Controller
public class OrdersController {
	@Autowired
	private OrderService orderService;
	
    @RequestMapping(value = "/estimatemanagement", method = RequestMethod.GET)
    public String salesplanmangement(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "10") int size,
                              @RequestParam(required = false) String cod,
                              @RequestParam(required = false) String clientCod,
                              @RequestParam(required = false) String employeeCod,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
                              Model model) { 
        
//    	List<EstimateVO> estimate = estimateService.EstimateSelectList(page, size, cod, clientCod, employeeCod, preSearchDate, postSearchDate);
//        int totalRecords = estimateService.countSalesTables(page, size, cod, clientCod, employeeCod, preSearchDate, postSearchDate);
//        int totalPages = (int) Math.ceil((double) totalRecords / size);
//
//        int pageGroupSize = 10;
//        int currentPageGroup = (page - 1) / pageGroupSize;
//        int startPage = currentPageGroup * pageGroupSize + 1;
//        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
//        
//        model.addAttribute("estimate", estimate);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", totalPages);
//        model.addAttribute("pageSize", size);
//        model.addAttribute("endPage", endPage);
//        model.addAttribute("startPage", startPage);
        
        return "easyrp/estimate/estimatemanagement";
    }

	
	
	
}
