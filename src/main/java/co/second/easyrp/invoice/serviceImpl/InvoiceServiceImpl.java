package co.second.easyrp.invoice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.invoice.mapper.InvoiceMapper;
import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.invoice.service.InvoiceVO;
import co.second.easyrp.invoice.service.SearchVO;

@Service
@Primary
public class InvoiceServiceImpl implements InvoiceService {
	@Autowired InvoiceMapper invoiceMapper;

	@Override
	public List<InvoiceVO> selectInvoiceAll(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.selectInvoiceAll(searchVo);
	}

	@Override
	public InvoiceVO selectInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.selectInvoice(invoiceVo);
	}

	@Override
	public int insertInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.insertInvoice(invoiceVo);
	}

	@Override
	public int updateInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.updateInvoice(invoiceVo);
	}

	@Override
	public int deleteInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.deleteInvoice(invoiceVo);
	}

	@Override
	public int mrpClosingUpdateToY(String mrpCod) {
		// TODO Auto-generated method stub
		return invoiceMapper.mrpClosingUpdateToY(mrpCod);
	}

	@Override
	public int mrpClosingUpdateToN(String mrpCod) {
		// TODO Auto-generated method stub
		return invoiceMapper.mrpClosingUpdateToN(mrpCod);
	}

	@Override
	public int countInvoiceTables(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.countInvoiceTables(searchVo);
	}

}
