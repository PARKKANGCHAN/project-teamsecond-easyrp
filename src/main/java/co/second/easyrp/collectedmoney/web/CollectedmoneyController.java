package co.second.easyrp.collectedmoney.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.collectedmoney.service.CollectedMoneyService;
import co.second.easyrp.collectedmoney.service.CollectedMoneyVO;
import co.second.easyrp.productmgmt.service.ProductMgmtVO;
import co.second.easyrp.productmgmt.service.UnitVO;

@Controller
public class CollectedmoneyController {
	
	@Autowired
	CollectedMoneyService collectedMoneyService;
	
	// 수금 관리 페이지 이동
	// 2024년 5월 16일 오전 11시 29분 추가 박현우
	@RequestMapping("/collectedmoney")
	public String collectedMoney() {
		return "easyrp/collectedmoney/collectedmoney";
	}
	
	@RequestMapping("/collectedmoneyinsert")
	public String collectedMoneyInsert() {
		return "easyrp/collectedmoney/collectedmoneyinsert";
	}
	
	@PostMapping("/collectedmoneyinsertfn")
	public String collectedMoneyInsertFn(CollectedMoneyVO collectedMoneyVO) {
		collectedMoneyService.insertFn(collectedMoneyVO);
		return "redirect:/collectedmoney";
	}
	
	@GetMapping("/api/get-hyunwoo-orderdata")
	@ResponseBody
	public List<CollectedMoneyVO> getHyunwooOrderData() {
		return collectedMoneyService.getHyunwooOrderData();
	}
	
	@GetMapping("/setvalueorderdata")
	public String setValueOrderData() {
		return "easyrp/collectedmoney/modal/setvalueorderdata";
	}
	
	
	
	

}
