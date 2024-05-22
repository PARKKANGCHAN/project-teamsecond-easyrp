package co.second.easyrp.chart.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, List<ChartVO>> getOrderQty(@RequestParam("productCod") String productCod, 
    								 @RequestParam("year") int year) {
    	
    	Map<String, List<ChartVO>> dataMap = new HashMap<>();
    	
        // 주문량 데이터 가져오기
        List<ChartVO> orderData = chartService.getOrderByProductAndYear(productCod, year);
        dataMap.put("orderData", orderData);
        
        // 판매 계획량 데이터 가져오기
        List<ChartVO> planData = chartService.getSalesPlanByProductAndYear(productCod, year);
        dataMap.put("planData", planData);
        
        return dataMap;
    }

}
