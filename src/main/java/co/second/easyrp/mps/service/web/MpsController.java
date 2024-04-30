package co.second.easyrp.mps.service.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.second.easyrp.mps.service.MpsService;

@Controller
public class MpsController {
	@Autowired MpsService mpsService;
	
	@RequestMapping("mps-management")
	public String mpsManagement() {
		return "easyrp/basic-information/employyeList";
	}
}
