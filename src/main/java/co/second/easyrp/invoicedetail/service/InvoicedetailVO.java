package co.second.easyrp.invoicedetail.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InvoicedetailVO {
	private int num;
	private String invoiceCod;
	private String mrpCod;
	private String productCod;
	private String inventoryCod;
	private int invQty;
	private int invMgmtQty;
	private int inqQty;
	private int inqRemainQty;
	private int unitprice;
	private int supprice;
	private int vax;
	private int total;
	private String closing;
	private String deleteyn;
}
