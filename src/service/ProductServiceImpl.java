package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ProductMapper;

import pojo.Product;
import pojo.ProductPage;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	@Override
	public List<ProductPage> getProduct(ProductPage productPage) {
		
		return productMapper.getProduct(productPage);
	}
	@Override
	public List<Product> getProductsOBstockOrCTime(
			Map map) {
		// TODO Auto-generated method stub
		return productMapper.getProductsOBstockOrCTime(map);
	}
	@Override
	public List<Product> getProductByCategory(Map<String, String> map) {
		// TODO Auto-generated method stub
		return productMapper.getProductByCategory(map);
	}

	@Override
	public Product getProductByIdLatelyView(Map map) {
		return productMapper.getProductByIdLatelyView(map);
	}

	@Override
	public int getProductCount(ProductPage productPage) {
		// TODO Auto-generated method stub
		return productMapper.getProductCount(productPage);
	}

}
