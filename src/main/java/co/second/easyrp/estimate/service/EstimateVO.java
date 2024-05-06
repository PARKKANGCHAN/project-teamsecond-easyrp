package co.second.easyrp.estimate.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EstimateVO {
	private String cod;
	private Date estDate;
	private String clientCod;
	private String employeeCod;
	private int price;
	private String deleteyn;
	private int total;
	private String orderyn;
	private Date preSearchDate;
	private Date postSearchDate;
	
	private String name;
}
