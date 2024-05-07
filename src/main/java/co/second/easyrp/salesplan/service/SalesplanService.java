package co.second.easyrp.salesplan.service;

import java.util.List;

public interface SalesplanService {
	List<SalesplanVO> SalesplanSelectList();
	SalesplanVO SalesplanSelect(SalesplanVO vo);
	int SalesplanInsert(SalesplanVO vo);
	int SalesplanUpdate(SalesplanVO vo);
	int SalesplanDelete(SalesplanVO vo);
}
