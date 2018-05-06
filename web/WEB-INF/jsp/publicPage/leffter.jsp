<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <c:forEach items="${pros2 }" var="pro">
                        	<li><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}"> ${pro.productName } </a></li>
                       </c:forEach>
                        </ul>
                    </div>
                </div>