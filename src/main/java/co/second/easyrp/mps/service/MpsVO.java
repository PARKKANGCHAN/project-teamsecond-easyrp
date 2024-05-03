package co.second.easyrp.mps.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MpsVO {
	private String cod;
	private String orderCod;
	private String salesplanCod;
	private String productCod;
	private Date planDate;
	private int qty;
	private String employeeCod;
	private String procurement;
	private String account;
	private String note;
	private String closing;
	
	private Date startDate;
	private Date endDate;
}
