package co.second.easyrp.mrp.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.mps.service.MpsVO;
import co.second.easyrp.mrp.map.MrpMapper;
import co.second.easyrp.mrp.service.MrpService;
import co.second.easyrp.mrp.service.MrpVO;

@Service
@Primary
public class MrpServiceImpl implements MrpService {
	@Autowired MrpMapper mrpMapper;

	@Override
	public List<MrpVO> mrpSelectListAll(int pageSize, int offset, String searchPlan, String searchProdCod,
			String searchProdName, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpSelectListAll(pageSize, offset, searchPlan, searchProdCod, searchProdName, preSearchDate, postSearchDate);
	}

	@Override
	public int countMrpTables(String searchPlan, String searchProdCod, String searchProdName, Date preSearchDate,
			Date postSearchDate) {
		// TODO Auto-generated method stub
		return mrpMapper.countMrpTables(searchPlan, searchProdCod, searchProdName, preSearchDate, postSearchDate);
	}

	@Override
	public MrpVO mrpSelect(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpSelect(mrpVo);
	}

	@Override
	public int mrpInsert(List<MrpVO> mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpInsert(mrpVo);
	}

	@Override
	public int mrpUpdate(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpUpdate(mrpVo);
	}

	@Override
	public int mrpDelete(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpDelete(mrpVo);
	}

	@Override
	public int selectMaxCod() {
		// TODO Auto-generated method stub
		return mrpMapper.selectMaxCod();
	}

	@Override
	public int mpsClosingUpdateToY(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mpsClosingUpdateToY(mrpVo);
	}

	@Override
	public int mpsClosingUpdateToN(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mpsClosingUpdateToN(mrpVo);
	}

	@Override
	public List<String> selectBom(String productCod) {
		// TODO Auto-generated method stub
		return mrpMapper.selectBom(productCod);
	}

}
