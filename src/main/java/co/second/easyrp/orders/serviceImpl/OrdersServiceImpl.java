package co.second.easyrp.orders.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.orders.map.OrdersMapper;
import co.second.easyrp.orders.service.OrderService;
import co.second.easyrp.orders.service.OrdersVO;

@Service
@Primary
public class OrdersServiceImpl implements OrderService {
	@Autowired OrdersMapper ordersMapper;
	
	@Override
	public List<OrdersVO> ordersSelectListAll() {
		// TODO Auto-generated method stub
		return ordersMapper.ordersSelectListAll();
	}

	@Override
	public List<OrdersVO> ordersSelectList(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersSelectList(ordersVo);
	}

	@Override
	public OrdersVO ordersSelect(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersSelect(ordersVo);
	}

	@Override
	public int ordersInsert(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersInsert(ordersVo);
	}

	@Override
	public int ordersUpdate(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersUpdate(ordersVo);
	}

	@Override
	public int ordersDelete(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersDelete(ordersVo);
	}

}