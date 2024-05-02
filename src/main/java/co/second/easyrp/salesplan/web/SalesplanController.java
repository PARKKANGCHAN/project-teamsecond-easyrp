package co.second.easyrp.salesplan.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}
