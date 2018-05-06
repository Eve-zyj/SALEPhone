<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>产品列表</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

  </head>
  <body>
   
   <%@ include file="publicPage/top.jsp" %>
   <%@ include file="publicPage/mainmenu.jsp" %>
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>${categoryName }${search }</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                            
              <c:forEach items="${pros }" var ="pro">
              	<div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <img src="${pageContext.request.contextPath }/statics/img/${pro.filename}" alt="" style="width: 194px;height: 243px;">
                        </div>
                        <h2><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}">${pro.productName}</a></h2>
                        <div class="product-carousel-price">
                            <ins>${pro.nowPrice}</ins> <del>${pro.price}</del>
                        </div>                          
                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">加入购物车</a>
                        </div>                       
                    </div>
                </div>
              </c:forEach>                
                <%-- <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <img src="${pageContext.request.contextPath }/statics/img/ph1.png" alt="" style="width: 194px;height: 243px;">
                        </div>
                        <h2><a href=""> Oppo A1 深海蓝</a></h2>
                        <div class="product-carousel-price">
                            <ins>￥2899.00</ins> <del>￥3999.00</del>
                        </div>  
                        
                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">加入购物车</a>
                        </div>                       
                    </div>
                </div> --%>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>
                          <ul class="pagination">
                          <c:if test="${param.pageIndex==1 }">
                           	<li>
                              <a href="${pageContext.request.contextPath }/product/product.html?id=${ param.id}&categoryName=${ param.categoryName}&pageIndex=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                           </c:if>
                           <c:if test="${param.pageIndex!=1 }">
                           	 <li>
                              <a href="${pageContext.request.contextPath }/product/product.html?id=${ param.id}&categoryName=${ param.categoryName}&pageIndex=${param.pageIndex-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                           </c:if>
                           
                           <c:forEach begin="1" end="${pageCount }" varStatus="status">
                           	<li><a href="${pageContext.request.contextPath }/product/product.html?id=${ param.id}&categoryName=${ param.categoryName}&pageIndex=${status.index }">${status.index }</a></li>
                           </c:forEach>
                           <c:if test="${param.pageIndex==pageCount }">
                           	<li>
                              <a href="${pageContext.request.contextPath }/product/product.html?id=${ param.id}&categoryName=${ param.categoryName}&pageIndex=${pageCount}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                            </li>
                           </c:if>
                           <c:if test="${param.pageIndex!=pageCount }">
                            <li>
                              <a href="${pageContext.request.contextPath }/product/product.html?id=${ param.id}&categoryName=${ param.categoryName}&pageIndex=${param.pageIndex+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                            </li>
                            </c:if>
                          </ul>
                        </nav>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="publicPage/footer.jsp" %>
   
    
  </body>

</html>
