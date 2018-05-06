package controller;

import java.io.UnsupportedEncodingException;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Product;
import pojo.ProductPage;
import pojo.Productcategory;

import service.ProductService;
import service.ProductcategoryService;
import tools.Constants;
import tools.RedisUtil;

@Controller
@RequestMapping("/product")
public class ProductController {

	Logger log = Logger.getLogger(ProductController.class);
	@Autowired
	private ProductcategoryService productcategoryService;// 分类
	@Autowired
	private ProductService productService;
	@Autowired
	private RedisUtil redisUtil;
	// 显示各个分类的产品列表
	@RequestMapping("/product.html")
	public String getProducts(@RequestParam(required = false) String id,
			@RequestParam(required = false) String categoryName,
			ProductPage productPage, Model model) {
		// 显示分类
		List<Productcategory> productcategorys = productcategoryService
				.getCategory();
		model.addAttribute("productcategorys", productcategorys);
		log.info("产品分类为:" + productcategorys);
		// 显示产品列表
		try {
			productPage.setId(null);
			productPage.setCategory(Integer.parseInt(id));
			productPage.setPagesize(Constants.pageSize);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		System.out.println("页面大小是："+productPage.getPagesize()+",当前页码为："+productPage.getPageIndex());
		int totalCount = productService.getProductCount(productPage);
		productPage.setTotalCount(totalCount);
		List<ProductPage> pros = productService.getProduct(productPage);
		System.out.println("总记录数是："+productPage.getTotalCount()+"第几条记录："+productPage.getFirstData()+"总页数："+productPage.getPageCount());
		model.addAttribute("pros", pros);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("pageCount",productPage.getPageCount());
		return "shop";
	}
	//显示产品详细信息——保存到cookie中，浏览记录
	@RequestMapping("/detail.html")
	public String showDetail(@RequestParam(required = false) String id,
			Model model,HttpServletResponse response,HttpServletRequest request) {
		// 显示分类
		List<Productcategory> productcategorys = productcategoryService
				.getCategory();
		model.addAttribute("productcategorys", productcategorys);
		log.info("产品分类为:" + productcategorys);
		// 查询产品信息
		ProductPage productPage = new ProductPage();
		try {
			productPage.setId(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		List<ProductPage> pros = productService.getProduct(productPage);
		ProductPage pro = pros.get(0);//该产品的详细信息
		model.addAttribute("pro",pro);
		//使用redis实现浏览记录
		List Jprolist = redisUtil.getList("Jprolist");
		if(Jprolist!=null ){
			for (int i = 0; i <Jprolist.size() ; i++) {
				Integer Jid = (Integer) Jprolist.get(i);//[Jid]:缓存中产品的id
				/*System.out.println("``````````````````Jprolist.get(i)```````````````````"+Jprolist.get(i));
				System.out.println("`````````````````接收到的id``````````````````````"+id);*/
				try {
					if(Jid==Integer.parseInt(id)){//判断该页面的id是否在缓存中存在
						Jprolist.remove(i);//如果缓存中存在该产品，则删除
						/*System.out.println("············删除成功······················");*/
					}
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		}
		try {
			Jprolist.add(Integer.parseInt(id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		redisUtil.addList("Jprolist",Jprolist);//保存到缓存中

		// 产品模块
		Map map1 = new HashMap();
		map1.put("opr", "pro_4");
		map1.put("category", pro.getCategory());
		List<Product> pros1 = productService.getProductByCategory(map1);
		model.addAttribute("pros1", pros1);
		// 最近上架模块
		Map map2 = new HashMap();
		map2.put("opr", "new_5");
		map2.put("category", pro.getCategory());
		List<Product> pros2 = productService.getProductByCategory(map2);
		model.addAttribute("pros2", pros2);
		// 相似模块
		Map map3 = new HashMap();
		map3.put("opr", "same_7");
		map3.put("category", pro.getCategory());
		List<Product> pros3 = productService.getProductByCategory(map3);
		model.addAttribute("pros3", pros3);
		return "single-product";
	}
	// 搜索产品
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam String productName,ProductPage productPage, Model model) {
		try {
			productName = new String(productName.getBytes("ISO-8859-1"),"utf-8");
			productPage.setProductName(productName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 显示分类
		List<Productcategory> productcategorys = productcategoryService
				.getCategory();
		model.addAttribute("productcategorys", productcategorys);
		log.info("产品分类为:" + productcategorys);
		List<ProductPage> pros = productService.getProduct(productPage);
		model.addAttribute("pros", pros);
		model.addAttribute("search", "searching.....");
		return "shop";
	}
}
