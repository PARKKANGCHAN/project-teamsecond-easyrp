package co.second.easyrp.orderdetail.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date deliveryDate;
	private int deleverState;
	private String note;
	private String mpsState;
	
	private Date startDate;
	private Date endDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date orderDate;
	private String clientName;
	private String prodname;
	private String unitName;
	private Date planDate;
}
