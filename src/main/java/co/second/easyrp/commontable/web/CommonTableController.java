package co.second.easyrp.commontable.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;

// (2024년 5월 1일 오후 6시 18분 박현우)
@Controller
public class CommonTableController {
	
	@Autowired
	CommonTableService commonTableService;
	
    @GetMapping("/commontable")
    public String commonTable(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "10") int size, Model model) {
        List<CommonTableVO> commonTable = commonTableService.commonTableAllListPaged(page, size);
        int totalRecords = commonTableService.countCommonTables();
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

        model.addAttribute("commonTable", commonTable);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        return "easyrp/common/commontable";
    }
    
    @GetMapping("/commoninsert")
    public String commonInsert(CommonTableVO commonTableVO, Model model) {
    	
    	return "easyrp/common/commoninsert";
    }
    
    @PostMapping("/commoninsertfn")
    public String commonInsertFn(CommonTableVO commonTableVO, Model model) {
    	commonTableService.commonInsert(commonTableVO);
    	return "redirect:/commontable";
    }


}
