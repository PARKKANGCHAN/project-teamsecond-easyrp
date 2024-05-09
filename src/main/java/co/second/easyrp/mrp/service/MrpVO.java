package co.second.easyrp.mrp.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MrpVO {
	private String cod;
	private int num;
	private String mps_cod;
	private String product_cod;
	private Date take_date;
	private Date po_date;
	private int qty;
	private String employee_cod;
	private String closing;
	
	private Date dday;
	private String account;
}
