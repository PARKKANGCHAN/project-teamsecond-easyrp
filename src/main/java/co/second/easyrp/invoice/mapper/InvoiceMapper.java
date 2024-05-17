package co.second.easyrp.invoice.mapper;

import java.util.List;

import co.second.easyrp.invoice.service.InvoiceVO;
import co.second.easyrp.invoice.service.SearchVO;

public interface InvoiceMapper {
	//2024.05.16 14:54 손지은 추가
	List<InvoiceVO> selectInvoiceAll(SearchVO searchVo); //청구 전체 불러오기
	int countInvoiceTables(SearchVO searchVo); //청구 페이지 구하기
	InvoiceVO selectInvoice(InvoiceVO invoiceVo); //청구 불러오기
	int insertInvoice(InvoiceVO invoiceVo); //청구 등록
	int updateInvoice(InvoiceVO invoiceVo); //청구 수정
	int deleteInvoice(InvoiceVO invoiceVo); //청구 삭제
	int mrpClosingUpdateToY(String mrpCod); //청구등록을 하면 mrp의 마감여부를 Y로 변경시킨다.
	int mrpClosingUpdateToN(String mrpCod); //청구삭제를 하면 mrp의 마감여부를 N으로 변경시킨다.
}
