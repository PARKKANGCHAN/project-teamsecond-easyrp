package co.second.easyrp.inventory.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryVO {
	private String cod;
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
	private String deleteyn;
	private String note;
	private String name;
	private String warehouse;
	private String employee;
	private String location;
}
