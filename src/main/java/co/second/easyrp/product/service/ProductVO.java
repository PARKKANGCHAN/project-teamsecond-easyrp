package co.second.easyrp.product.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private String cod;
	private String prodname;
	private long stdprice;
	private long unitprice;
	private int basicInvQty;
	private long basicInvPrice;
	private String spec;
	private int safteyInvQty;
	private int curInvQty;
	private long curInvPrice;
	private String warehouseCod;
	private String ProductgroupCod;
	private int unitCod;
	private String account;
	private String note;
	private String employeeCod;
	private String employee;
	private String warehouse;
	private String Unit;
	
}
