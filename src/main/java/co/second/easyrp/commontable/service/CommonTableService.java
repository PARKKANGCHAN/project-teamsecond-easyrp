package co.second.easyrp.commontable.service;

import java.util.List;

//(2024년 4월 30일 오후 3시 1분 박현우)
// 공통 테이블을 구현하기 위한 인터페이스
public interface CommonTableService {
	
	// (2024년 4월 30일 오후 3시 2분 박현우)
	// 공통 테이블 모든 값을 가져오기 위한 추상 메서드
	List<CommonTableVO> commonTableAllList();
}
