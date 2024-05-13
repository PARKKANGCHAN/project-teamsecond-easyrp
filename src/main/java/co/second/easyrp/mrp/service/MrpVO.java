package co.second.easyrp.mrp.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MrpVO {
	private String cod;
	private int num;
	private String mpsCod;
	private String productCod;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date takeDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date poDate;
	private int qty;
	private String employeeCod;
	private String closing;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date dday;
	private String account;
	private String prodname;
	private String spec;
	private String unitName;
	private String invCod;
	private int invQty;
}
