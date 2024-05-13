package co.second.easyrp.purchaseorder.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseOrderVO {
	private String cod;
	private String poDate;
	private String closingDate;
	private String clientCod;
	private int taxdivisionCod;
	private String employeeCodWriter;
	private String employeeCodPo;
	private String employeeCodIbound;
	private int printcnt;
	private String closing;
	private String note;
	private String searchCod;
	private String searchFromPoDate;
	private String searchToPoDate;
	private String searchClientCod;
	private String searchClientName;
	private String searchEmpCodPo;
	private String searchEmpNamePo;	
	private String searchEmpCodIbound;
	private String searchEmpNameIbound;
	private String searchClosing;
	private String searchFromClosingDate;
	private String searchToClosingDate;
	private int page;
	private int size;
	private int offset;
	
	public PurchaseOrderVO() {
		this.page = 1;
		this.size = 10;
	}
	
}
