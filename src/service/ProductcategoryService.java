package service;

import java.util.List;

import pojo.Productcategory;

public interface ProductcategoryService {

	/**
	 * 查询所有目录
	 * @return
	 */
	List<Productcategory> getCategory();
}
