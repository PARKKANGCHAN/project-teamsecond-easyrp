package co.second.easyrp.specification.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.second.easyrp.specification.service.SpecificationService;
import co.second.easyrp.specification.service.SpecificationVO;

@Controller
public class SpecificationController {
	
	@Autowired
	SpecificationService specificationService;
	
	// 거래명세서 페이지 이동
	// 2024년 5월 22일 오전 11시 01분 추가 박현우
	@GetMapping("/orderspecification")
	public String orderSpecification(SpecificationVO specificationVO, Model model) {
		
		List<SpecificationVO> getOrderDatas =  specificationService.getOrderDatas(specificationVO);
		
		model.addAttribute("getOrderDatas", getOrderDatas);
		return "easyrp/orders/orderspecification/orderspecification";
	}
	

}
