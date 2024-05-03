package co.second.easyrp.deptmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.deptmgmt.service.DepartmentMgmtService;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;

@Controller
public class DepartmentMgmtController {

	@Autowired
	DepartmentMgmtService departmentMgmtService;

	@GetMapping("/departmentmgmt")
	public String departmentMgmt(SearchVO searchVo, Model model,
			@RequestParam(required = false) String searchCod, @RequestParam(required = false) String searchName,
			@RequestParam(required = false) String searchWrkName,
			@RequestParam(required = false) String searchLocation) {
		
		searchVo.setSearchCod(searchCod);
		searchVo.setSearchLocation(searchLocation);
		searchVo.setSearchName(searchName);
		searchVo.setSearchWrkName(searchWrkName);
		
		System.out.println(searchVo);

		List<DepartmentMgmtVO> departmentmgmt = departmentMgmtService.departmentTableAllList(searchVo);
		
		System.out.println(departmentmgmt);
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = departmentMgmtService.countDepartmentTable(searchVo); 

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVo.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVo.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		
		model.addAttribute("searchVO", searchVo);
		model.addAttribute("departmentmgmt", departmentmgmt);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/deptmgmt/deptmgmttable";
	}

}
