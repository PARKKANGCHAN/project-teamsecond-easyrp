package co.second.easyrp.mps.serviceImpl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.mps.map.MpsMapper;
import co.second.easyrp.mps.service.MpsService;
import co.second.easyrp.mps.service.MpsVO;

@Service
@Primary
public class MpsServiceImpl implements MpsService {
	@Autowired
	private MpsMapper mpsMapper;
	
	@Override
	public List<MpsVO> mpsSelectListAll() {
		// TODO Auto-generated method stub
		return mpsMapper.mpsSelectListAll();
	}

	@Override
	public List<MpsVO> mpsSelectList(MpsVO mpsVo, Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsSelectList(mpsVo, startDate, endDate);
	}

	@Override
	public MpsVO mpsSelect(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsSelect(mpsVo);
	}

	@Override
	public int mpsInsert(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsInsert(mpsVo);
	}

	@Override
	public int mpsUpdate(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsUpdate(mpsVo);
	}

	@Override
	public int mpsDelete(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsDelete(mpsVo);
	}

}
