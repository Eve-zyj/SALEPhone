<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>



</head>
<body>
	<%@ include file="publicPage/top.jsp"%>
	<%@ include file="publicPage/mainmenu.jsp"%>
	<input type="hidden" id="path"
		value="${pageContext.request.contextPath }" />
	<div class="slider-area">
		<!-- Slider -->
		<div class="block-slider block-slider4">
			<ul class="" id="bxslider-home4">
				<li><img
					src="${pageContext.request.contextPath }/statics/img/nav3.jpg"
					alt="Slide"></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/img/nav3.jpg"
					alt="Slide"></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/img/nav3.jpg"
					alt="Slide"></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/img/nav3.jpg"
					alt="Slide"></li>
			</ul>
		</div>
		<!-- ./Slider -->
	</div>
	<!-- End slider area -->

	<div class="promo-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="single-promo promo1">
						<i class="fa fa-refresh"></i>
						<p>退还无忧</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="single-promo promo2">
						<i class="fa fa-truck"></i>
						<p>免费配送</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="single-promo promo3">
						<i class="fa fa-lock"></i>
						<p>安全支付</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="single-promo promo4">
						<i class="fa fa-gift"></i>
						<p>最新产品</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End promo area -->

	<div class="maincontent-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="latest-product">
						<h2 class="section-title">火爆热售</h2>
						<div class="product-carousel">
							<c:forEach items="${productsHot5 }" var="pro">
								<div class="single-product">
									<div class="product-f-image">
										<img
											src="${pageContext.request.contextPath }/statics/img/${pro.filename}"
											alt="" style="width: 195px;height: 243px;">
										<div class="product-hover">
											<a href="#" class="add-to-cart-link"><i
												class="fa fa-shopping-cart"></i> 立即购买</a> <a
												href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}" class="view-details-link"><i
												class="fa fa-link"></i> 了解产品</a>
										</div>
									</div>
									<h2>
										<a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}">${pro.productName}</a>
									</h2>
									<div class="product-carousel-price">
										<ins>${pro.nowPrice}</ins>
										<del>${pro.price}</del>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main content area -->

	<div class="brands-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="brand-wrapper">
						<div class="brand-list">
							<img
								src="${pageContext.request.contextPath }/statics/img/brand1.png"
								alt=""> <img
								src="${pageContext.request.contextPath }/statics/img/brand2.png"
								alt=""> <img
								src="${pageContext.request.contextPath }/statics/img/brand3.png"
								alt=""> <img
								src="${pageContext.request.contextPath }/statics/img/brand4.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End brands area -->

	<div class="product-widget-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="single-product-widget hot3">
						<h2 class="product-wid-title">最热</h2>
						<a href="#" class="wid-view-more">more</a>
						<c:forEach items="${productsHot3 }" var="pro3">
						<div class="single-wid-product">
                            <a href="${pageContext.request.contextPath }/product/detail.html?id=${pro3.id}"><img src="${pageContext.request.contextPath }/statics/img/${pro3.filename}" alt="" class="product-thumb"></a>
                            <h2><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro3.id}">${pro3.productName}</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>${pro3.nowPrice}</ins> <del>${pro3.price}</del>
                            </div>                            
                        </div> 
						</c:forEach>
						<%-- <div class="single-wid-product">
                            <a href="single-product.html"><img src="${pageContext.request.contextPath }/statics/img/ph3.png" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">Vivo Xplay5旗舰版</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>￥2400.00</ins> <del>￥2425.00</del>
                            </div>                            
                        </div> --%>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-product-widget">
						<h2 class="product-wid-title">最近浏览</h2>
						<a href="#" class="wid-view-more">more</a>
						<c:forEach items="${prolists}" var="pro">
							<div class="single-wid-product">
								<a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}"><img src="${pageContext.request.contextPath }/statics/img/${pro.filename}" alt="" class="product-thumb"></a>
								<h2><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}">${pro.productName}</a></h2>
								<div class="product-wid-rating">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								<div class="product-wid-price">
									<ins>${pro.nowPrice}</ins> <del>${pro.price}</del>
								</div>
							</div>
						</c:forEach>
						<%--<div class="single-wid-product">
							<a href="single-product.html"><img
								src="${pageContext.request.contextPath }/statics/img/ph3.png"
								alt="" class="product-thumb"></a>
							<h2>
								<a href="single-product.html">Vivo Xplay5旗舰版</a>
							</h2>
							<div class="product-wid-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<div class="product-wid-price">
								<ins>￥2400.00</ins>
								<del>￥2425.00</del>
							</div>
						</div>--%>
					</div>
				</div>
				<div class="col-md-4">
					<div class="single-product-widget new3">
						<h2 class="product-wid-title">最 新</h2>
						<a href="#" class="wid-view-more">more</a>
						<c:forEach items="${productsNew3 }" var="pro3">
						<div class="single-wid-product">
                            <a href="${pageContext.request.contextPath }/product/detail.html?id=${pro3.id}"><img src="${pageContext.request.contextPath }/statics/img/${pro3.filename}" alt="" class="product-thumb"></a>
                            <h2><a href="${pageContext.request.contextPath }/product/detail.html?id=${pro3.id}">${pro3.productName}</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>${pro3.nowPrice}</ins> <del>${pro3.price}</del>
                            </div>                            
                        </div> 
						</c:forEach>
						<%-- <div class="single-wid-product">
                            <a href="single-product.html"><img src="${pageContext.request.contextPath }/statics/img/ph4.png" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">Oppo A73</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>￥2400.00</ins> <del>￥2425.00</del>
                            </div>                            
                        </div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End product widget area -->

	<%@ include file="publicPage/footer.jsp"%>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/statics/js/index.js"></script>

</body>
</html>