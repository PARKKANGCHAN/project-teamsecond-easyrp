package co.second.easyrp.orderdetail.service;

import java.sql.Date;
import java.util.List;

public interface OrderdetailService {
	List<OrderdetailVO> orderdetailSelectListAll(); //리스트 전체 조회
	List<OrderdetailVO> orderdetailSelectList(OrderdetailVO orderdetailVo); //리스트 전체 조회
	
	int orderdetailInsert(OrderdetailVO orderdetailVo); //등록
	int orderdetailUpdate(OrderdetailVO orderdetailVo); //수정
	int orderdetailDelete(OrderdetailVO orderdetailVo); //삭제
}
