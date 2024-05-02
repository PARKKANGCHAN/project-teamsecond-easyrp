package co.second.easyrp.commontable.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.commontable.map.CommonTableMapper;
import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;

//(2024년 4월 30일 오후 3시 4분 박현우)
@Service
@Primary
public class CommonTableServiceImpl implements CommonTableService {
	
	@Autowired
	private CommonTableMapper commonTableMapper;

	@Override
	public List<CommonTableVO> commonTableAllListPaged(int page, int size) {
		int offset = (page - 1) * size;
		return commonTableMapper.commonTableAllListPaged(size, offset);
	}

	@Override
	public int countCommonTables() {
		return commonTableMapper.countCommonTables();
	}

	@Override
	public int commonInsert(CommonTableVO commonTableVO) {
		return commonTableMapper.commonInsert(commonTableVO);
	}



}
