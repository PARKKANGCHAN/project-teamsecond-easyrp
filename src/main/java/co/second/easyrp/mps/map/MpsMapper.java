package co.second.easyrp.mps.map;

import java.sql.Date;
import java.util.List;

import co.second.easyrp.mps.service.MpsVO;

public interface MpsMapper {
	//모든 조회는 소요량전개(다음단계)가 이행되지 않은 주계획만 조회한다.
	
	List<MpsVO> mpsSelectListAll(); //리스트 전체 조회
	List<MpsVO> mpsSelectList(MpsVO mpsVo); //조건에 따른 리스트 조회
	MpsVO mpsSelect(MpsVO mpsVo); //건별 조회(상세보기)
	
	int mpsInsert(MpsVO mpsVo); //등록
	int mpsUpdate(MpsVO mpsVo); //수정
	int mpsDelete(MpsVO mpsVo); //삭제
	
	int orderdetailMpsStateUpdate(MpsVO mpsVo); //orderdetail의 mps_state 컬럼을 N에서 Y로 바꿔준다.
	
	int selectMaxCod(); //숫자가 제일 높은 코드의 숫자를 구한다.
}
