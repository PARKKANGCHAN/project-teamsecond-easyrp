package co.second.easyrp.common.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.common.map.UnitMapper;
import co.second.easyrp.common.service.UnitService;
import co.second.easyrp.common.service.UnitVO;

@Service
@Primary
public class UnitServiceImpl implements UnitService {
	@Autowired UnitMapper unitMapper;

	@Override
	public List<UnitVO> unitSelectListAll() {
		// TODO Auto-generated method stub
		return unitMapper.unitSelectListAll();
	}
}
