package co.second.easyrp.orders.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrdersVO {
	private String cod;
	private String prodname;
	private int stdprice;
	private int unitprice;
	private int basicInvQty;
	private int baseInvPrice;
	private String spec;
	private int safetyInvQty;
	private int curInvQty;
	private int curInvPrice;
	private String warehouseCod;
	private String productgroupCod;
	private int unitCod;
	private String account;
	private String note;
	private String employeeCod;
	
	private Date startDate;
	private Date endDate;
}
