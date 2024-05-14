package co.second.easyrp.bom.map;

import co.second.easyrp.bom.service.BomVO;

//(2024년 5월 14일 오전 9시 23분 박현우)
public interface BomMapper {
	
	// 단일 항목 데이터 가져오기
	BomVO getData(BomVO bomVo);
	
}
