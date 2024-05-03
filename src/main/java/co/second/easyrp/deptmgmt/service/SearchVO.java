package co.second.easyrp.deptmgmt.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 3일 오후 3시 15분 박현우)
@Getter
@Setter
@ToString
public class SearchVO {
	private int offset=1;
	private int pageSize=10;
	private String searchCod;
	private String searchName;
	private String searchWrkName;
	private String searchLocation;
}
