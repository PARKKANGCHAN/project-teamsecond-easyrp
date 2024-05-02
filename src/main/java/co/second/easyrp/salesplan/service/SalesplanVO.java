package co.second.easyrp.salesplan.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SalesplanVO {
	private String cod;
	private String clientCod;
	private String productCod;
	private Date planDate;
	private int basicplnQty;
	private int modplnQty;
	private String stateCod;
}
