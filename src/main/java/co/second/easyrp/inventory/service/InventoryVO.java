package co.second.easyrp.inventory.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InventoryVO {
	private String productCod;
	private String warehouseCod;
	private String locationCod;
	private String employeeCod;
	private Date invDate;
	private int qty;
	private int unitprice;
	private int price;
	private int curInvQty;
	private int curInvPrice;
	private String spec;
	private int unitcod;
	private int safetyInvQty;
	private String account;
	private String note;
}
