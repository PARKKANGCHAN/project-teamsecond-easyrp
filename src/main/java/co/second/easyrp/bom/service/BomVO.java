package co.second.easyrp.bom.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 14일 오전 9시 23분 박현우)
@Getter
@Setter
@ToString
public class BomVO {
	private String productCod;
	private String productName;
	private String deptName;
	private String empCod;
	private String empName;
	private String warehouseName;
	// BOM DB 테이블 부분 VO
	private String prodCod;
	private String invCod;
	private int quantity;
	
}
