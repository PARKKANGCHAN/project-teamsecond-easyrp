package co.second.easyrp.orderdetail.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderdetailVO {
	private String cod;
	private int num;
	private String productCod;
	private int qty;
	private int vax;
	private int total;
	@DateFormat(pattern="yyyy-MM-dd")
	private Date deliveryDate;
	private int deleverState;
	private String note;
	private String mpsState;
	
	private Date startDate;
	private Date endDate;
	
	@DateFormat(pattern="yyyy-MM-dd")
	private Date orderDate;
	private String clientName;
	private String prodname;
	private String unitName;
	private Date planDate;
}
