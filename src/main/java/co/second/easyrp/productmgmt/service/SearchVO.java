package co.second.easyrp.productmgmt.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 8일 오후 2시 31분 박현우)
@Getter
@Setter
@ToString
public class SearchVO {
	private String searchCod;
	private String searchName;
	private String searchAddress;
	private String searchRepresentative;
	private String searchManagerName;
	private int pageSize = 10;
	private int offset = 0;
}
