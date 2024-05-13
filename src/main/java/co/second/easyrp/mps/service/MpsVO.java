package co.second.easyrp.mps.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MpsVO {
	private String cod;
	private String orderCod;
	private int orderdetailNum;
	private String salesplanCod;
	private String productCod;
	private Date planDate;
	private int qty;
	private String employeeCod;
	private String procurement;
	private String account;
	private String plan;
	private String note;
	private String closing;
	private String deleteyn;
	
	private String prodname;
	private String spec;
	private String unitName;
	private Date deliveryDate;
	private Date dday;
	private String clientName;
	
//	private String searchProdCod;
//	private String searchProdName;
//	private String searchClient;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	private Date preSearchDate;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	private Date postSearchDate;
}
