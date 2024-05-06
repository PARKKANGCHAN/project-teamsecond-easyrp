package co.second.easyrp.orders.service;

import java.sql.Date;
import java.util.List;

public interface OrderService {
	List<OrdersVO> ordersSelectListAll(); //수주 리스트 전체 조회
	List<OrdersVO> ordersSelectList(OrdersVO ordersVo); //조건에 따른 리스트 조회
	OrdersVO ordersSelect(OrdersVO ordersVo); //건별 조회(상세보기)
	
	int ordersInsert(OrdersVO ordersVo); //등록
	int ordersUpdate(OrdersVO ordersVo); //수정
	int ordersDelete(OrdersVO ordersVo); //삭제
}
