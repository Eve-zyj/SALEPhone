package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;

import pojo.Product;
import pojo.ProductPage;
import pojo.Productcategory;

import service.ProductService;
import service.ProductcategoryService;
import tools.RedisUtil;

@Controller
public class IndexController {
	private Logger logger = Logger.getLogger(IndexController.class);

	@Autowired
	private RedisUtil redisUtil;
	@Autowired
	private ProductcategoryService productcategoryService;// 分类
	@Autowired
	private ProductService productService;// 产品

	//显示首页
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String showIndex(Model model,HttpServletRequest request,HttpServletResponse response) {
		// 显示分类
		List<Productcategory> productcategorys = productcategoryService
				.getCategory();
		model.addAttribute("productcategorys", productcategorys);
		logger.info("产品分类为:" + productcategorys);
		// 火爆热售模块
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("opr", "hot_5");
		List<Product> productsHot5 = productService
				.getProductsOBstockOrCTime(map1);
		model.addAttribute("productsHot5", productsHot5);
		// 最热模块
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("opr", "hot_3");
		List<Product> productsHot3 = productService
				.getProductsOBstockOrCTime(map2);
		model.addAttribute("productsHot3", productsHot3);
		// 最新模块
		Map<String, String> map3 = new HashMap<String, String>();
		map3.put("opr", "new_3");
		List<Product> productsNew3 = productService
				.getProductsOBstockOrCTime(map3);
		model.addAttribute("productsNew3", productsNew3);
		//浏览记录模块
		List Jprolists = redisUtil.getList("Jprolist");
		List proidlist =  new ArrayList();
		if(Jprolists==null){//第一次启动时没有Jprolist，则新增加一个
			redisUtil.addList("Jprolist",proidlist);
		}
		if(redisUtil.getList("Jprolist")!=null){
			if(redisUtil.getList("Jprolist").size()<1){//如果Jprolist中没有数据，则把id为1，2，3的加入Jprolist中
				proidlist.add(1);
				proidlist.add(2);
				proidlist.add(3);
				redisUtil.addList("Jprolist",proidlist);
			}
			if(redisUtil.getList("Jprolist").size()<2){
				proidlist.add(1);
				proidlist.add(2);
				redisUtil.addList("Jprolist",proidlist);
			}else if(redisUtil.getList("Jprolist").size()<3){
				proidlist.add(1);
				redisUtil.addList("Jprolist",proidlist);
			}
		}
		//System.out.println("========================="+Jprolists);
		List prolist =  new ArrayList();
		Jprolists = redisUtil.getList("Jprolist");
		//System.out.println("========================="+Jprolists.size());
		for (int i = Jprolists.size()-1; i >=Jprolists.size()-3 ; i--) {//循环输出3组数据
			Map map = new HashMap();
			map.put("id",Jprolists.get(i));
			Product product = productService.getProductByIdLatelyView(map);//根据id查询
			prolist.add(product);
		}
		model.addAttribute("prolists",prolist);
		return "index";
	}

}
