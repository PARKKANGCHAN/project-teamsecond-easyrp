package co.second.easyrp.inventorymgmt.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 12일 오후 7시 3분 박현우)
@Getter
@Setter
@ToString
public class InventoryMgmtVO {
	private String cod;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date invDate;
	private int unitprice;
	private int qty;
	private int price;
	private String spec;
	private int safetyInvQty;
	private int curInvQty;
	private int curInvPrice;
	private String warehouseCod;
	private String productGroupCod;
	private int unitCod;
	private int mgmtUnitCod;
	private String account;
	private String note;
	private String employeeCod;
	private String deleteyn;
	private String prodGroupName;
	private String warehouseName;
	private String unitName;
	private String mgmtUnitName;
}
