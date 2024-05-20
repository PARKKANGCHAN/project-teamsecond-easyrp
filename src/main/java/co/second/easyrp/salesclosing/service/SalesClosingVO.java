package co.second.easyrp.salesclosing.service;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 20일 오후 2시 23분 박현우)
@Getter
@Setter
@ToString
public class SalesClosingVO {
	private String orderCod;
	private long total;
	private String salesClosingState;
	private Date salesClosingDate;
}
