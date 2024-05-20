package co.second.easyrp.inventorycount.service;

import java.text.SimpleDateFormat;
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
	private SimpleDateFormat countDate;
	private SimpleDateFormat invDate;
	private String warehouseCod;
	private String locationCod;
	private String countclass;
	private String deleteyn;
	private String warehouse;
	private String employee;
	private String location;
}
