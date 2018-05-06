package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Cart;
import pojo.Product;
import pojo.ProductPage;
import pojo.Productcategory;
import service.ProductService;
import service.ProductcategoryService;
import tools.Constants;
import tools.RedisUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 有关购物车的控制器
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private ProductcategoryService productcategoryService;// 分类
    @Autowired
    private ProductService productService;// 产品
    //显示购物车
    @RequestMapping("/cart.html")
    public String cart(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
        // 显示分类
        List<Productcategory> productcategorys = productcategoryService
                .getCategory();
        model.addAttribute("productcategorys", productcategorys);
        // 最近上架模块
        Map<String, String> map3 = new HashMap<String, String>();
        map3.put("opr", "new_5");
        List<Product> productsNew3 = productService
                .getProductsOBstockOrCTime(map3);
        model.addAttribute("productsNew5", productsNew3.subList(0,4));
        //产品模块
        ProductPage productPage = null;
        List<ProductPage> pros1 = productService.getProduct(productPage);
        model.addAttribute("pros1", pros1.subList(0,5));
        //权限控制
        /*if(session.getAttribute(Constants.USER_SESSION)==null){
            return  "redirect:/user/login.html";
        } else{
            return "cart";
        }*/
        return "cart";
    }

    //从cookie中获取购物车列表
    public List<Cart> getCartListFromCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        boolean flag = false;
        String cartStr = null;
        for (Cookie ck : cookies) {
            if(ck.getName().equals("cart1")){//存在该购物车
                flag = true;
                cartStr = ck.getValue();
            }
        }
        List<Cart> list = new ArrayList<Cart>();
        if(flag){
            list = JSON.parseArray(cartStr,Cart.class);
        }
        return  list;
    }

    //未登陆状态下添加购物车商品
    @RequestMapping("/addCart.do")
    @ResponseBody
    public Object addCartNoLogin(HttpServletResponse response,@RequestParam String id,@RequestParam String num, Model model,HttpServletRequest request){
        //获取购物车列表中的信息
        List<Cart> cartList = getCartListFromCookie(request);
        //判断购物车中是否有该商品
        boolean flag = false;
        for(Cart cart:cartList){
            if(cart.getCartid().equals(id)){
                flag = true;//购物车列表中存在该商品
                cart.setNum(cart.getNum()+Integer.parseInt(num));//如果存在该商品，则数量加上当前购买的数量
                break;//跳出循环
            }
        }
        //如果购物车中不存在该商品，则根据id查询该商品的信息
        if(!flag){
            ProductPage pro = new ProductPage();
            pro.setId(Integer.parseInt(id));
            ProductPage product = productService.getProduct(pro).get(0);//得到该商品的所有信息
            //得到购物车中的信息
            Cart cart = new Cart();//购物车
            cart.setCartid(id);
            cart.setProductPage(product);
            cart.setNum(Integer.parseInt(num));
            //商品添加到购物车列表中
            cartList.add(cart);
        }
        //购物车信息写入到cookie中
        Cookie ck = new Cookie("cart1", JSON.toJSONString(cartList));
        response.addCookie(ck);
        //返回json对象
        return  JSON.toJSONString(cartList);
    }
}
