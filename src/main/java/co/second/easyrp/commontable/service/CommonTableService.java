package co.second.easyrp.commontable.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

//(2024년 4월 30일 오후 3시 1분 박현우)
public interface CommonTableService {
	
	List<CommonTableVO> commonTableAllListPaged(
		    @Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("searchNumber") String searchNumber, 
		    @Param("searchTitle") String searchTitle, 
		    @Param("searchContent") String searchContent, 
		    @Param("searchAuthor") String searchAuthor, 
		    @Param("preSearchDate") java.util.Date preSearchDate, 
		    @Param("postSearchDate") java.util.Date postSearchDate
		);

	
	CommonTableVO getCommonData(int postId);
	
	int commonInsert(CommonTableVO commonTableVO);
	
	int commonUpdate(CommonTableVO commonTableVO);
	
	int commonDelete(CommonTableVO commonTableVO);
	
	int countCommonTables(
			@Param("searchNumber") String searchNumber,
			@Param("searchTitle") String searchTitle,
			@Param("searchContent") String searchContent,
			@Param("searchAuthor") String searchAuthor,
			@Param("preSearchDate") java.util.Date preSearchDate, 
			@Param("postSearchDate") java.util.Date postSearchDate);
}
