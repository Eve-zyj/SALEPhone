package service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import pojo.Product;
import pojo.ProductPage;
/**
 * 产品业务逻辑层接口
 * @author Eve-赵雅娟
 *
 */
public interface ProductService {
	/**
	 * 模糊查询所有产品
	 * @return
	 */
	List<ProductPage> getProduct(ProductPage productPage);
	/**
	 * 模糊查询所有产品——总记录数
	 * @return
	 */
	int getProductCount(ProductPage productPage);
	/**
	 * 按照库存排序，上架时间动态显示产品列表
	 * @return
	 */
	List<Product> getProductsOBstockOrCTime(Map map);
	/**
	 * 根据产品分类查询产品
	 * @param map
	 * @return
	 */
	List<Product> getProductByCategory(Map<String, String> map);
	/**
	 * 最近浏览记录
	 * @return
	 */
	Product getProductByIdLatelyView(Map map);
}
