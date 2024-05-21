package co.second.easyrp.inventorycount.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
import co.second.easyrp.inventorycount.service.SearchVO;
import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Controller
public class InventoryCountController {

	@Autowired
	InventoryCountService inventorycountservice;
	
	@Autowired
	InventoryService inventoryservice;
	
	@Autowired
	ProductService productservice;
	
	@GetMapping("/inventorycount")
	public String inventoryCount(SearchVO searchVO, Model model, 
								 @RequestParam(defaultValue="1") int page,
								 @RequestParam(defaultValue="10") int pageSize,
								 @RequestParam(required = false) String searchCod,
								 @RequestParam(required = false) String searchLocation,
								 @RequestParam(required = false) String searchWarehouse,
								 @RequestParam(required = false) String searchProduct,
								 @RequestParam(required = false) String searchInventory,
								 @RequestParam(required = false) String searchCountClass,
								 @RequestParam(required = false) String searchEmployee,
								 @RequestParam(required = false) String searchAccount,
								 @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
						         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate) {
		
		searchVO.setSearchCod(searchCod);
		searchVO.setSearchWarehouse(searchWarehouse);
		searchVO.setSearchProduct(searchProduct);
		searchVO.setSearchLocation(searchLocation);
		searchVO.setSearchInventory(searchInventory);
		searchVO.setSearchCountClass(searchCountClass);
		searchVO.setSearchEmployee(searchEmployee);
		searchVO.setSearchAccount(searchAccount);
		searchVO.setOffset((page-1)*pageSize);
		
		List<InventoryCountVO> inventoryCountList=inventorycountservice.inventoryCountList(searchVO);
		
		int totalRecords = inventorycountservice.countInventoryCountLists(searchVO);
		
		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
		int pageGroupSize = 10;
		
		int currentPageGroup = (pageSize - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("inventoryCountList", inventoryCountList);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/inventory/inventorycount";
		
	}
	
	@RequestMapping("inventorycountinsert")
	public String inventoryCountInsert(Model model) {
		List<WareHouseVO> warehouseinv = warehouseList();
		model.addAttribute("warehouseinv", warehouseinv);
		return "easyrp/inventory/inventorycountinsert";
	}
	
	@RequestMapping("/api/get-prodinvinsert")
	@ResponseBody
	public String inventoryCountInsertFn( HttpServletRequest httpservletrequest, HttpSession httpsession) {
		String rs = "N";
//		InventoryCountVO inventorycountvo = new InventoryCountVO();	
		String[] prodinvcod;
		String[] countqty;
		String[] note;
		String warehouse;
		
		prodinvcod= httpservletrequest.getParameterValues("prodinvcod");
		countqty = httpservletrequest.getParameterValues("countqty");
		note = httpservletrequest.getParameterValues("note");
		warehouse= httpservletrequest.getParameter("warehouse");
		System.out.println(warehouse);
		
				System.out.println(Arrays.toString(countqty));
				System.out.println(Arrays.toString(note));
				System.out.println(Arrays.toString(prodinvcod));
		
		InventoryCountDetailVO inventorycountdetailvo = new InventoryCountDetailVO();
		InventoryCountVO inventorycountvo = new InventoryCountVO();		
		
		int maxNumber = inventorycountservice.selectMaxCod() + 1;
    	String newCode = String.format("%03d", maxNumber);
    	
    	
    	if(warehouse != null) {
    		inventorycountvo.setWarehouse(warehouse);
    	}
    	
    	inventorycountvo.setCod("invcnt"+newCode);
    	inventorycountvo.setEmployeeCod((String) httpsession.getAttribute("empCode"));
    	inventorycountvo.setWarehouseCod(inventorycountservice.wareHouseCod(warehouse));
    	inventorycountvo.setCountclass("정기");
    	
		
		if(prodinvcod != null) {
			for(int i=0; i<prodinvcod.length; i++) {
				
				boolean prodinvcods = prodinvcod[i].contains("prd");
				if(prodinvcods) {
					System.out.println("prodinvcod:"+prodinvcod[i]);
					inventorycountdetailvo.setProductCod(prodinvcod[i]);
					inventorycountdetailvo.setComputingQty(inventorycountservice.getcomputingqty(prodinvcod[i]));
				}else {
					inventorycountdetailvo.setInventoryCod(prodinvcod[i]);
					inventorycountdetailvo.setComputingQty(inventorycountservice.getcomputingqty(prodinvcod[i]));
				}
				inventorycountdetailvo.setInventorycountCod(inventorycountvo.getCod());
				inventorycountdetailvo.setQty(Integer.parseInt(countqty[i]));	
				inventorycountdetailvo.setNote(note[i]);
				inventorycountdetailvo.setUnitCod(1);
				inventorycountdetailvo.setDiffQty(inventorycountdetailvo.getDiffQty());
				
				
		List<ProductInventoryVO> result = new ArrayList<>();
		List<ProductInventoryVO> prodinvs = inventorycountservice.getAllSelectedCountList(prodinvcod[i]);
		result.addAll(prodinvs);
		System.out.println(result.toString());
		
		
		}
			inventorycountservice.insertInventoryCount(inventorycountvo);
			inventorycountservice.insertCountDetailList(inventorycountdetailvo);
			}
		rs = "Y";
		
		return rs;
	}
	
	
	@GetMapping("/api/get-prodinv")
	@ResponseBody
	public List<ProductInventoryVO> getAllProdInv(HttpServletRequest httpservletrequest){
		
		String warehouse = httpservletrequest.getParameter("warehouse");
		
		
		WareHouseVO warehousevo = new WareHouseVO();
		
		
		warehousevo.setName(warehouse);
		
		
		System.out.println(inventorycountservice.selectedWarehouseList(warehousevo));
		

		return inventorycountservice.getAllProdInvWarehouse(warehousevo);
	}

	public List<WareHouseVO> warehouseList() {
	        return inventorycountservice.warehouseList();
	    }
	
	@GetMapping("/api/get-prodinvlist")
	@ResponseBody
	public List<ProductInventoryVO> getAccount(HttpServletRequest httpservletrequest){
		
		String prodinv = httpservletrequest.getParameter("prodinv");
		String warehouse = httpservletrequest.getParameter("warehouse");
		
		
		ProductInventoryVO prodinvvo= new ProductInventoryVO();
		
		
		prodinvvo.setAccount(prodinv);
		
		prodinvvo.setWarehouse(warehouse);
		System.out.println(prodinv);
	//System.out.println(inventorycountservice.getProdInvAccount(prodinvvo));
		
		
			
		
		return inventorycountservice.getProdInvAccount(prodinvvo);
	}
	
	@PostMapping("inventorycountdelivr")
	public String inventorycountdelivery(Model model, HttpServletRequest httpservletrequest) {
		String countdetail = httpservletrequest.getParameter("detailkey");
		
		List<InventoryCountDetailVO> inventoryCountDetailList =new ArrayList<>();
		inventoryCountDetailList = inventorycountservice.selectedInventoryCountDetailList(countdetail);
		
		model.addAttribute("inventoryCountDetailList", inventoryCountDetailList);
		
		return "easyrp/inventory/inventorycountdetail";
	}
	
}
