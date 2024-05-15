package co.second.easyrp.orders.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.orders.service.OrdersVO;

public interface OrdersMapper {
	
	List<OrdersVO> OrdersSelectList(		    
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	List<OrdersVO> ordersSelectListAll(); //수주 리스트 전체 조회
	List<OrdersVO> ordersSelectList(OrdersVO ordersVo); //조건에 따른 리스트 조회
	OrdersVO ordersSelect(OrdersVO ordersVo); //건별 조회(상세보기)
	
	int ordersInsert(OrdersVO ordersVo); //등록
	int ordersUpdate(OrdersVO ordersVo); //수정
	int ordersDelete(OrdersVO ordersVo); //삭제
}
