package co.second.easyrp.client.service;

import java.util.List;

//(2024년 5월 7일 오전 11시 36분 박현우)

public interface ClientService {
	
	List<ClientVO> clientTableAllList(SearchVO searchVO);
	
	ClientVO getClientData(String cod);
	
	List<discountVO> getDiscountData();
	
	String getMaxCode();
	
	int clientInsertFn(ClientVO clientVO);
	
	int clientUpdateFn(ClientVO clientVO);
	
	int clientDeleteFn(String cod);
	
	int countClientTable(SearchVO searchVO);
	
}
