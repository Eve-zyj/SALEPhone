package dao;

import java.util.List;

import pojo.Productcategory;

public interface ProductcategoryMapper {

	/**
	 * 查询所有目录
	 * @return
	 */
	List<Productcategory> getCategory();
}
