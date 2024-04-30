package co.second.easyrp.mps.service;

import java.sql.Date;
import java.util.List;

public interface MpsService {
	//모든 조회는 소요량전개(다음단계)가 이행되지 않은 주계획만 조회한다.
	
	List<MpsVO> mpsSelectListAll(); //리스트 전체 조회
	List<MpsVO> mpsSelectList(MpsVO mpsVo, Date startDate, Date endDate); //조건에 따른 리스트 조회
	MpsVO mpsSelect(MpsVO mpsVo); //건별 조회(상세보기)
	
	int mpsInsert(MpsVO mpsVo); //등록
	int mpsUpdate(MpsVO mpsVo); //수정
	int mpsDelete(MpsVO mpsVo); //삭제
}
