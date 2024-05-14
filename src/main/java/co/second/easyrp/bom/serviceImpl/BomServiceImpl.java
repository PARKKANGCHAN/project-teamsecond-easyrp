package co.second.easyrp.bom.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.bom.map.BomMapper;
import co.second.easyrp.bom.service.BomService;
import co.second.easyrp.bom.service.BomVO;


@Service
@Primary
public class BomServiceImpl implements BomService {
	
	@Autowired
	BomMapper bomMapper;

	@Override
	public BomVO getData(BomVO bomVo) {
		return bomMapper.getData(bomVo);
	}
}
