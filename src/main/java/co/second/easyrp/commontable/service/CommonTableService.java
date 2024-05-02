package co.second.easyrp.commontable.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//(2024년 4월 30일 오후 3시 1분 박현우)
public interface CommonTableService {
	
	List<CommonTableVO> commonTableAllListPaged(@Param("pageSize") int pageSize, @Param("offset") int offset);
	
	int commonInsert(CommonTableVO commonTableVO);
	
	int countCommonTables();
}
