package co.second.easyrp.inventorycount.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchVO {
	private String searchCod;
	private Date searchCountDate;
	private Date searchPreSearchDate;
	private Date searchPostSearchDate;
	private String searchWarehouseName;
	private String searchLocationName;
	private String searchProductName;
	private String searchInventoryName;
	private String searchCountClass;
	private String searchEmployeeName;
	private String searchAccount;
	private int pageSize = 10;
	private int offset = 0;
}
