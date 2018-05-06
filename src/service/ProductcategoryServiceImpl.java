package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductcategoryMapper;

import pojo.Productcategory;
@Service
public class ProductcategoryServiceImpl implements ProductcategoryService {

	@Autowired
	private ProductcategoryMapper productcategoryMapper;
	@Override
	public List<Productcategory> getCategory() {
		return productcategoryMapper.getCategory();
	}

}
