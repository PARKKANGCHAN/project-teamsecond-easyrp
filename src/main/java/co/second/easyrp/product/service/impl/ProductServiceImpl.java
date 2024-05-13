package co.second.easyrp.product.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.product.map.ProductMapper;
import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.product.service.ProductVO;

@Service
@Primary
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productmapper;
	
	@Override
	public List<ProductVO> productList(int page, int size, String cod, String warehouse, String employee,
			String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		int offset = (page-1)*size;
		return productmapper.productList(size, offset, cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	@Override
	public int countProductLists(String cod, String warehouse, String employee, String account, Date preSearchDate,
			Date postSearchDate) {
		// TODO Auto-generated method stub
		return productmapper.countProductLists(cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

}
