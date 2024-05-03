package co.second.easyrp.orderdetail.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderdetailVO {
	private String cod;
	private int num;
	private String productCod;
	private int qty;
	private int vax;
	private int total;
	private Date deliveryDate;
	private int deleverState;
	private String note;
	private String mpsState;
	
	private Date startDate;
	private Date endDate;
	
	private Date orderDate;
	private String clientName;
	private String prodname;
	private String unitName;
	private Date planDate;
}
