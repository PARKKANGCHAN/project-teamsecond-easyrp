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
	private String productCod;
	private Date countDate;
	private String countclass;
	private int qty;
	private String procClass;
	private String account;
	private String note;
	private String deleteyn;
}
