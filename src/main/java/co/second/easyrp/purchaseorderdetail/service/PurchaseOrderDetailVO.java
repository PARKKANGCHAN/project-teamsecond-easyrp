package co.second.easyrp.purchaseorderdetail.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseOrderDetailVO {
	private int num;
	private String purchaseorderCod;
	private String invoiceCod;
	private int invoicedetailNum;
	private String ProductCod;
	private Date dday;
	private Date schedDate;
	private int unitMgmt;
	private int mgmtQty;
	private int unitInv;
	private int invQty;
	private int remailQty;
	private int unitprice;
	private int supprice;
	private int vax;
	private int total;
	private String inspec;
	private int passQty;
	private int notpassQty;
	private int iboundQty;
	private int stateCod;
}
