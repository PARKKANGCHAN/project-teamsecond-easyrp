package co.second.easyrp.chart.service;

import java.util.List;

public interface ChartService {

	List<ChartVO> ProductSelectList();
	List<ChartVO> getOrderByProductAndYear(String productCod, int year);
}
