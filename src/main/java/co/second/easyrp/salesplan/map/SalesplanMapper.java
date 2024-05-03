package co.second.easyrp.salesplan.map;

import java.util.List;

import co.second.easyrp.salesplan.service.SalesplanVO;

public interface SalesplanMapper {
	List<SalesplanVO> SalesplanSelectList();
	SalesplanVO SalesplanSelect(SalesplanVO vo);
	int SalesplanInsert(SalesplanVO vo);
	int SalesplanUpdate(SalesplanVO vo);
	int SalesplanDelete(SalesplanVO vo);
}
