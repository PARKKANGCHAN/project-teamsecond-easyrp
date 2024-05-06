package co.second.easyrp.orderdetail.map;

import java.sql.Date;
import java.util.List;

import co.second.easyrp.orderdetail.service.OrderdetailVO;

public interface OrderdetailMapper {
	List<OrderdetailVO> orderdetailSelectListAll(); //리스트 전체 조회
	List<OrderdetailVO> orderdetailSelectList(OrderdetailVO orderdetailVo); //조건으로 리스트 조회
	
	int orderdetailInsert(OrderdetailVO orderdetailVo); //등록
	int orderdetailUpdate(OrderdetailVO orderdetailVo); //수정
	int orderdetailDelete(OrderdetailVO orderdetailVo); //삭제
}
