package co.second.easyrp.purchasedeadline.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class purchasedeadlineController {
	@GetMapping("/purchasedeadline")
	public String purchasedeadline() {
		return "easyrp/purchase-deadline/purchasedeadline";
	}
}
