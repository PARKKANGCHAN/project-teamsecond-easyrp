package co.second.easyrp.salesplan.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.salesplan.map.SalesplanMapper;
import co.second.easyrp.salesplan.service.SalesplanService;
import co.second.easyrp.salesplan.service.SalesplanVO;


@Service
@Primary
public class SalesplanServiceImpl implements SalesplanService {
	@Autowired
	private SalesplanMapper salesplanMapper;
	
	@Override
	public List<SalesplanVO> SalesplanSelectList() {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanSelectList();
	}

	@Override
	public SalesplanVO SalesplanSelect(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanSelect(vo);
	}

	@Override
	public int SalesplanInsert(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanInsert(vo);
	}

	@Override
	public int SalesplanUpdate(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanUpdate(vo);
	}

	@Override
	public int SalesplanDelete(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanDelete(vo);
	}

}
