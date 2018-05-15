package tools;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pojo.Orderdetail;
import pojo.Product;
import pojo.ProductPage;
import service.ProductService;

import java.util.ArrayList;
import java.util.List;
public class CartHelp {
    /**
     * 获取购物车内商品列表
     * @param carts
     * @return
     */
    public static List<ProductPage> getProductsOfCarts(List<Orderdetail> carts,ProductService productService){
        List<ProductPage> products=null;
        if(carts==null || carts.size()==0){
            return products;
        }
        products=new ArrayList<ProductPage>();
        for (Orderdetail orderdetail:carts){
            ProductPage productPage=new ProductPage();
            productPage.setId(orderdetail.getProductId());
            products.add(productService.getProduct(productPage).get(0));
        }
        return products;
    }

    /**
     * 计算购物车总价
     */
    public static double getTotalMoney(List<Orderdetail> carts){
        double totalMoney=0;
        if(carts==null || carts.size()==0){
            return totalMoney;
        }
        for (Orderdetail orderdetail:carts){
            totalMoney+=orderdetail.getCost();
        }
        return  totalMoney;
    }

}
