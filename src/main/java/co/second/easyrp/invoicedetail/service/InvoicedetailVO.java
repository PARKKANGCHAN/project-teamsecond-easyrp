package co.second.easyrp.invoicedetail.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvoicedetailVO {
	private int num;
	private String invoiceCod;
	private String mrpCod;
	private String productCod;
	private int invQty;
	private int inqQty;
	private int inqRemainQty;
	private int unitprice;
	private int supprice;
	private int vax;
	private int total;
	private String closing;
	private String deleteyn;
}
