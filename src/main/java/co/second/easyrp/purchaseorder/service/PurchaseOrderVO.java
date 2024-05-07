package co.second.easyrp.purchaseorder.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class PurchaseOrderVO {
	private String cod;
	private Date poDate;
	private Date iboundDate;
	private Date closingDate;
	private String clientCod;
	private String taxdivisionCod;
	private String employeeCodWriter;
	private String employeeCodPo;
	private String employeeCodIbound;
	private String warehouseCod;
	private int printcnt;
	private String closing;
	private String note;
	private int stateCod;
}
