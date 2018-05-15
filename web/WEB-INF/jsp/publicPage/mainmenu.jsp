<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="${pageContext.request.contextPath }/statics/img/logo.png"></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
                        <a href="${pageContext.request.contextPath }/cart.html">购物车<span class="cart-amunt">￥100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath }/index.html">首页</a></li>
                        <c:forEach items="${productcategorys }" var="productcategory">
                        	<input type="hidden" name="id" value="${ productcategory.id}"/>
                        	<input type="hidden" name="categoryName" value="${ productcategory.categoryName}"/>
                        	<li><a href="${pageContext.request.contextPath }/product/product.html?id=${ productcategory.id}&categoryName=${ productcategory.categoryName}&pageIndex=1">${productcategory.categoryName }</a></li>                        
                        </c:forEach>
                        <li><a href="#">联系我们</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->