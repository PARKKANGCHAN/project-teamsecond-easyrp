package co.second.easyrp.commontable.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;

// (2024년 4월 30일 오후 3시 6분 박현우)
// 공통테이블을 구현하기 위한 컨트롤러
@Controller
public class CommonTableController {
	
	@Autowired
	CommonTableService commonTableService;
	
	// 공통 테이블 이동 메서드
	@RequestMapping("/commontable")
	public String commonTable(Model model) {
		
		List<CommonTableVO> commonTableList = commonTableService.commonTableAllList();
		
		model.addAttribute("commonTableValue", commonTableList);
		
		return "easyrp/common/commontable";
	}

}
