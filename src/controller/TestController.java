package controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tools.RedisUtil;
@Controller
public class TestController {
	@Resource(name="redisUtil")
	private RedisUtil redisUtil;
	//@RequestMapping("/index.html")
	public String showIndex(){		
		return "index";
	}
	//@RequestMapping("/cart.html")
	public String cart(){
		return "cart";
	}
	@RequestMapping("/checkout.html")
	public String checkout(){
		return "checkout";
	}
	/*@RequestMapping("/login.html")
	public String login(){
		return "login";
	}*/
	@RequestMapping("/shop.html")
	public String shop(){
		return "shop";
	}
	@RequestMapping("/single_product.html")
	public String single_product(){
		return "single-product";
	}
}
