<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>

  </head>
  <body>
   
    <%@ include file="publicPage/top.jsp" %>
   <%@ include file="publicPage/mainmenu.jsp" %>
    <input type="hidden" id="path" value="${pageContext.request.contextPath }"/>
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>购物车</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">搜 索</h2>
                        <form action="${pageContext.request.contextPath }/product/search.html">
                            <input type="text" placeholder="寻找宝贝..." name="productName">
                            <input type="submit" value="搜索">
                        </form>
                    </div>

                    <div class="single-sidebar">
                        <h2 class="sidebar-title">产 品</h2>
                        <c:forEach items="${pros1 }" var="pro">
                            <div class="thubmnail-recent">
                                <img src="${pageContext.request.contextPath }/statics/img/${pro.filename}" class="recent-thumb" alt="">
                                <h2><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}">${pro.productName } </a></h2>
                                <div class="product-sidebar-price">
                                    <ins>${pro.nowPrice }</ins> <del>${pro.price }</del>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                    <div class="single-sidebar">
                        <h2 class="sidebar-title">最近上架</h2>
                        <ul>
                            <c:forEach items="${productsNew5 }" var="pro">
                                <li><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}"> ${pro.productName } </a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <form method="post" action="#">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-remove">&nbsp;</th>
                                            <th class="product-thumbnail">&nbsp;</th>
                                            <th class="product-name">产 品</th>
                                            <th class="product-price">价 格</th>
                                            <th class="product-quantity">数 量</th>
                                            <th class="product-subtotal">总 计</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <input type="checkbox" class="remove" name="cart-checkbox">
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.html"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${pageContext.request.contextPath }/statics/img/ph2.png"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="single-product.html"> Oppo </a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">￥2500.00</span> 
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="button" class="minus" value="-">
                                                    <input type="text" size="4" class="input-text qty text" title="Qty" value="1">
                                                    <input type="button" class="plus" value="+">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">￥2500.00</span> 
                                            </td>
                                        </tr>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <%--<a title="Remove this item" class="remove" href="#">×</a>--%>
                                                <input type="checkbox" class="remove" name="cart-checkbox">
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.html"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${pageContext.request.contextPath }/statics/img/ph2.png"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="single-product.html"> Oppo </a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">￥2500.00</span> 
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="button" class="minus" value="-">
                                                    <input type="text" size="4" class="input-text qty text" title="Qty" value="1">
                                                    <input type="button" class="plus" value="+">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">￥2500.00</span> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="actions" colspan="6">
                                                <p><strong>购物车总计：</strong><span id="totalcount">3000.00 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="submit" value="结算" name="proceed" class=" checkout-button button alt wc-forward"></p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>

                            <div class="cart-collaterals">
                            <div class="cross-sells">
                                <h2>你也许还感兴趣的产品</h2>
                                <ul class="products">
                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="${pageContext.request.contextPath }/statics/img/ph2.png">
                                            <h3>Oppo A73</h3>
                                            <span class="price"><span class="amount">￥2500.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">了解产品</a>
                                    </li>

                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="${pageContext.request.contextPath }/statics/img/ph2.png">
                                            <h3>Oppo A73</h3>
                                            <span class="price"><span class="amount">￥2500.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">了解产品</a>
                                    </li>
                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="${pageContext.request.contextPath }/statics/img/ph2.png">
                                            <h3>Oppo A73</h3>
                                            <span class="price"><span class="amount">￥2500.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">了解产品</a>
                                    </li>
                                </ul>
                            </div>
                            </div>
                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>

    <%@ include file="publicPage/footer.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/cart.js"></script>
  </body>
</html>