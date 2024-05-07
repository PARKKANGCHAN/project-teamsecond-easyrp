package co.second.easyrp.client.map;

import java.util.List;

import co.second.easyrp.client.service.ClientVO;
import co.second.easyrp.client.service.SearchVO;
import co.second.easyrp.client.service.discountVO;

//(2024년 5월 7일 오전 11시 36분 박현우)
public interface ClientMapper {
	
	List<ClientVO> clientTableAllList(SearchVO searchVO);
	
	ClientVO getClientData(String cod);
	
	List<discountVO> getDiscountData();
	
	String getMaxCode();
	
	int clientInsertFn(ClientVO clientVO);
	
	int clientUpdateFn(ClientVO clientVO);
	
	int clientDeleteFn(String cod);
	
	int countClientTable(SearchVO searchVO);
	
}
