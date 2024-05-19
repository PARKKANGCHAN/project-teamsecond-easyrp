package co.second.easyrp.chart.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.chart.map.ChartMapper;
import co.second.easyrp.chart.service.ChartService;
import co.second.easyrp.chart.service.ChartVO;

@Controller
public class ChartController {
	@Autowired
	private ChartService chartService;
	
    @GetMapping("/ChartUpdate")
    @ResponseBody
    public List<ChartVO> getOrderQty(@RequestParam("productCod") String productCod, 
    								 @RequestParam("year") int year) {
    	
    	System.out.println("컨트롤러 도착");
    	
        return chartService.getOrderByProductAndYear(productCod, year);
    }

}
