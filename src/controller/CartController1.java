package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.*;
import service.ProductService;
import service.ProductcategoryService;
import tools.CartHelp;
import tools.Constants;
import tools.RedisUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController1 {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductcategoryService productcategoryService;// 分类

    @RequestMapping("cart.html")
    public String showCart(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response){
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



        //显示购物车内容
        User user=(User) session.getAttribute(Constants.USER_SESSION);
        //从缓存中取出该用户的购物车列表
        List<Orderdetail> carts=null;
        if(user==null){
            model.addAttribute("error","请登陆");
            return "cart";
        }
        if(redisUtil.getList(user.getUsername())!=null){
            carts=JSON.parseArray(redisUtil.getList(user.getUsername()).toString(),Orderdetail.class);
        }
        List<ProductPage> pros=CartHelp.getProductsOfCarts(carts,productService);
        model.addAttribute("totalMoney",CartHelp.getTotalMoney(carts));
        model.addAttribute("carts",carts);//保存了商品的数目和小计
        model.addAttribute("products",pros);
        return "cart";
    }


    @RequestMapping("/addCart.do")
    @ResponseBody
    public Object addCart(Orderdetail orderdetail, HttpSession session){
        User user=(User) session.getAttribute(Constants.USER_SESSION);
        int logResult=1;
        int addResult=0;
        //如果未登录，则return
        if(user==null){
            logResult=0;
            return  "{\"logResult\":\""+logResult+"\",\"addResult\":\""+addResult+"\"}";
        }
        //从缓存中取出该用户的购物车列表
        List<Orderdetail> carts=null;
        if(redisUtil.getList(user.getUsername())!=null){
            carts=JSON.parseArray(redisUtil.getList(user.getUsername()).toString(),Orderdetail.class);
        }
        //如果购物车不存在，则新建一个该用户的购物车
        if(carts==null || carts.size()==0){
            System.out.println("~~~~~~~~~~~~~~~~~~~新建购物车~~~~~~~~~~~~~~~~~~~~~");
            carts=new ArrayList<Orderdetail>();
        }
        //遍历该购物车如果存在相同的商品则增加数目 如果不存在相同的商品则插入一条数据
        int sameFlag=0;//如果不存在相同的，sameFlag=0
        for (int i=0;i<carts.size();i++){
            //判断是否有相同的商品
            if(orderdetail.getProductId()==carts.get(i).getProductId()){
                System.out.println("~~~~~~~~~~~~~~~~~~~存在相同商品~~~~~~~~~~~~~~~~~~~~~");
                //原来的数目与新增的数目相加
                carts.get(i).setQuantity(orderdetail.getQuantity()+carts.get(i).getQuantity());
               //原来的cost和新增的cost相加
                carts.get(i).setCost(orderdetail.getCost()+carts.get(i).getCost());
                //将更改后的对象存入list
                sameFlag=1;//存在相同的，sameFlag=1
                addResult=1;//添加成功
                break;
            }
        }
        if(sameFlag==0){//不存在相同的商品,向购物车添加一条数据
            System.out.println("~~~~~~~~~~~~~~~~~~~不存在相同商品~~~~~~~~~~~~~~~~~~~~~");
            carts.add(orderdetail);
            addResult=1;//添加成功
        }
        //更新缓存内购物车信息
        redisUtil.del(user.getUsername());
        redisUtil.addList(user.getUsername(),carts);
        return  "{\"logResult\":\""+logResult+"\",\"addResult\":\""+addResult+"\"}";
    }
}
