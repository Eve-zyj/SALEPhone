package pojo;

import java.io.Serializable;

public class Cart implements Serializable {
    /**
     * 购物车的id和商品的id相同
     */
    private String cartid;
    private int num;
    private  ProductPage productPage;
    public Cart(){}

    public Cart( int num, ProductPage productPage) {
        this.num = num;
        this.productPage = productPage;
    }

    public Cart(String cartid, int num, ProductPage productPage) {
        this.cartid = cartid;
        this.num = num;
        this.productPage = productPage;
    }

    public String getCartid() {
        return cartid;
    }

    public void setCartid(String cartid) {
        this.cartid = cartid;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public ProductPage getProductPage() {
        return productPage;
    }

    public void setProductPage(ProductPage productPage) {
        this.productPage = productPage;
    }
}
