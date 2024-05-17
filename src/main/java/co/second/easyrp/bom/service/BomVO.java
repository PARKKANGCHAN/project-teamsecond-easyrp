package co.second.easyrp.bom.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 14일 오전 9시 23분 박현우)
@Getter
@Setter
@ToString
public class BomVO {
	private String prodCod;
	private String productName;
	private String productGroupName;
	private String invCod;
	private int quantity;
}
