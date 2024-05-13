package co.second.easyrp.inventorycount.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryCountVO {
	private String cod;
	private String employeeCod;
	private Date countDate;
	private String invDate;
	private String warehouseCod;
	private String locationCod;
	private String countclass;
	private String account;
	private String deleteyn;
	private String note;
	private String warehouse;
	private String employee;
	private String location;
}
