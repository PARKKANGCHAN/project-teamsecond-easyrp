package co.second.easyrp.productmgmt.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.productmgmt.map.UnitMapper;
import co.second.easyrp.productmgmt.service.UnitService;
import co.second.easyrp.productmgmt.service.UnitVO;


@Service
@Primary
public class UnitServiceImpl implements UnitService {
	
	@Autowired
	UnitMapper unitMapper;

	@Override
	public List<UnitVO> unitTableAllList() {
		return unitMapper.unitTableAllList();
	}

}
