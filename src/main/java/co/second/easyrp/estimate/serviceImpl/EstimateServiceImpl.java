package co.second.easyrp.estimate.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.estimate.map.EstimateMapper;
import co.second.easyrp.estimate.service.EstimateService;
import co.second.easyrp.estimate.service.EstimateVO;

@Service
@Primary
public class EstimateServiceImpl implements EstimateService {

	@Autowired
	private EstimateMapper estimateMapper;
	
	@Override
	public List<EstimateVO> EstimateSelectList(int page, int size, String cod, String clientCod,
			String employeeCod, Date preSearchDate, Date postSearchDate) {
		int offset = (page - 1) * size;
		// TODO Auto-generated method stub
		return estimateMapper.EstimateSelectList(size, offset, cod, clientCod, employeeCod, preSearchDate, postSearchDate);
	}

	@Override
	public EstimateVO EstimateSelect(EstimateVO vo) {
		// TODO Auto-generated method stub
		return estimateMapper.EstimateSelect(vo);
	}

	@Override
	public int EstimateInsert(EstimateVO vo) {
		// TODO Auto-generated method stub
		return estimateMapper.EstimateInsert(vo);
	}

	@Override
	public int EstimateUpdate(String cod, int qty, int num) {
		// TODO Auto-generated method stub
		return estimateMapper.EstimateUpdate(cod, qty, num);
	}

	@Override
	public int EstimateDelete(EstimateVO vo) {
		// TODO Auto-generated method stub
		return estimateMapper.EstimateDelete(vo);
	}

	@Override
	public int countSalesTables(int pageSize, int offset, String cod, String clientCod, String employeeCod,
			Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return estimateMapper.countSalesTables(pageSize, offset, cod, clientCod, employeeCod, preSearchDate, postSearchDate);
	}

	@Override
	public List<EstimateVO> ClientNameSelectList() {
		// TODO Auto-generated method stub
		return estimateMapper.ClientNameSelectList();
	}

	@Override
	public List<EstimateVO> EstimateDetailSelectList(String cod) {
		// TODO Auto-generated method stub
		return estimateMapper.EstimateDetailSelectList(cod);
	}

}
