package co.second.easyrp.mps.service.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.mps.service.MpsService;
import co.second.easyrp.mps.service.MpsVO;
import co.second.easyrp.orderdetail.service.OrderdetailService;
import co.second.easyrp.orderdetail.service.OrderdetailVO;

@Controller
public class MpsController {
	@Autowired MpsService mpsService;
	@Autowired OrderdetailService orderdetailService;
	
	//주계획 관리 페이지
	@RequestMapping("mpsmanagement")
	public String mpsManagement(@RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String searchNumber,
            @RequestParam(required = false) String searchTitle,
            @RequestParam(required = false) String searchContent,
            @RequestParam(required = false) String searchAuthor,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
            Model model, MpsVO mpsVo) {
		//model.addAttribute("mps", mpsService.mpsSelectListAll());
		return "easyrp/mps/mpsmanagement";
	}
	
	//사용자가 설정한 조건에 맞는 주계획 리스트를 보여준다. (검색)
	//ajax로 구현 예정
	
	//주문적용 페이지
	//사용자가 선택한 수주 정보 리스트를 보여주고, 수주에 대한 계획일을 설정하는 페이지
	@RequestMapping("mpsinsert")
	public String mpsOrderList(Model model) {
		return "easyrp/mps/mpsinsert";
	}
	
	//사용자가 설정한 조건에 맞는 수주 리스트를 보여준다. (검색)
	//ajax로 구현 예정
	
	//작성 완료 페이지
	//사용자가 작성한 주계획 리스트를 보여준다.
	@RequestMapping("mpscompleted")
	public String mpsCompleted(Model model, MpsVO mpsVo) {
		int maxNumber = mpsService.selectMaxCod() + 1;
		String newCode = String.format("%03d", maxNumber);
		mpsVo.setCod("mps" + newCode);
		mpsService.mpsInsert(mpsVo);
		mpsService.orderdetailMpsStateUpdate(mpsVo);
		return "easyrp/mps/mpscompleted";
	}
	
    @GetMapping("/api/get-ov")
    @ResponseBody
    public List<OrderdetailVO> getOrderdetailValues() {
    	System.out.println(orderdetailService.orderdetailSelectListAll());
        return orderdetailService.orderdetailSelectListAll();
    }
}
