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
<title>产品细节</title>
</head>
<body>

	<%@ include file="publicPage/top.jsp"%>
	<%@ include file="publicPage/mainmenu.jsp"%>

	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<%@ include file="publicPage/leffter.jsp"%>

				<div class="col-md-8">
					<div class="product-content-right">
						<div class="product-breadcroumb">
							<a href="${pageContext.request.contextPath }/index.html"> 首页 </a> <a href="${pageContext.request.contextPath }/product/product.html?id=${ pro.category}&categoryName=${ pro.categoryName}">${pro.categoryName } </a> <a href="">${pro.productName
								} </a>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="product-images">
									<div class="product-main-img">
										<img
											src="${pageContext.request.contextPath }/statics/img/${pro.filename }"
											alt="">
									</div>

									<div class="product-gallery">
										<img
											src="${pageContext.request.contextPath }/statics/img/${pro.filename }"
											alt=""> <img
											src="${pageContext.request.contextPath }/statics/img/${pro.filename }"
											alt=""> <img
											src="${pageContext.request.contextPath }/statics/img/${pro.filename }"
											alt="">
									</div>
								</div>
							</div>
							<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
							<div class="col-sm-6">
								<div class="product-inner">
									<h2 class="product-name">${pro.productName }</h2>
									<div class="product-inner-price">
										<ins>${pro.nowPrice }</ins>
										<del>${pro.price }</del>
									</div>
									<form class="cart">
										<div class="quantity">
											<input type="number" size="4" id="quantity" class="input-text qty text pronum quantity"
												title="Qty"  value="1"  price="${pro.nowPrice}" name="quantity" min="1" step="1"/>
										</div>
										<input name="productId" value="${pro.id}" class="productId" type="hidden">
										<input name="cost" value="${pro.price}" class="cost" type="hidden">
										<button class="add_to_cart_button"  type="button">加入购物车</button>
									</form>

									<div class="product-inner-category">
										<p>
											种类: <a href=""> ${pro.categoryName } </a>. 标签: <a href="">拍照</a>, <a href="">最佳</a>,
											<a href="">性能比高</a>, <a href="">合适</a>.
										</p>
									</div>

									<div role="tabpanel">
										<ul class="product-tab" role="tablist">
											<li role="presentation" class="active"><a href="#home"
												aria-controls="home" role="tab" data-toggle="tab">产品描述</a></li>
											<li role="presentation"><a href="#profile"
												aria-controls="profile" role="tab" data-toggle="tab">参数</a></li>
										</ul>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane fade in active"
												id="home">
												<h2>产品描述</h2>
												<p>${pro.describe1 }</p>
												<p>${pro.describe2 }</p>
											</div>
											<div role="tabpanel" class="tab-pane fade" id="profile">
												<h2> 规格参数 </h2>
												<p><strong>辅助功能：</strong><span> 常用功能</span></p>
												<p><strong>主体：</strong> <span>  ${pro.categoryName} ${pro.productName } 2017年上市</span></p>
												<p><strong>手机特性： </strong><span> 支持GPS</span></p>
												<p><strong>基本信息：</strong> <span> 机身宽度７０.９</span><span>机身厚度 7.7</span></p>
												<p><strong>数据接口：</strong> <span> 蓝牙  WiFi</span></p>
												<p><strong>电池信息： </strong><span> 6500mAh</span></p>
												<p><strong>前置摄像头： </strong><span> 700万像素</span></p>
												<p><strong>后置摄像头：</strong> <span> 1200万像素</span></p>
												<p><strong>存储：</strong> <span> 64GB</span></p>
												<p><strong>网络支持：</strong> <span> 4G电信|联通|移动</span></p>
												<p><strong>主芯片：</strong><span> 其他</span></p>
												<p><strong>操作系统：</strong> <span> iOS</span></p>
												<p><strong>屏幕：</strong> <span> 5.8英寸</span></p>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>


						<div class="related-products-wrapper">
							<h2 class="related-products-title">相似产品</h2>
							<div class="related-products-carousel">
								
								<c:forEach items="${pros3 }" var="pro">
								<div class="single-product">
									<div class="product-f-image">
										<img
											src="${pageContext.request.contextPath }/statics/img/${pro.filename}"
											alt="">
										<div class="product-hover">
											<a href="" class="add-to-cart-link"><i
												class="fa fa-shopping-cart"></i> 加入购物车 </a> <a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}"
												class="view-details-link"><i class="fa fa-link"></i>
												了解产品 </a>
										</div>
									</div>

									<h2>
										<a href="${pageContext.request.contextPath }/product/detail.html?id=${pro.id}"> ${pro.productName } </a>
									</h2>

									<div class="product-carousel-price">
										<ins>${pro.nowPrice }</ins>
										<del>${pro.price }</del>
									</div>
								</div>
								</c:forEach>
								
								<%-- <div class="single-product">
									<div class="product-f-image">
										<img
											src="${pageContext.request.contextPath }/statics/img/ph4.png"
											alt="">
										<div class="product-hover">
											<a href="" class="add-to-cart-link"><i
												class="fa fa-shopping-cart"></i> 加入购物车 </a> <a href=""
												class="view-details-link"><i class="fa fa-link"></i>
												了解产品 </a>
										</div>
									</div>

									<h2>
										<a href=""> Oppo A73 - 2018 </a>
									</h2>

									<div class="product-carousel-price">
										<ins>￥3700.00</ins>
										<del>￥4100.00</del>
									</div>
								</div> --%>
								<div class="single-product">
									<div class="product-f-image">
										<img
											src="${pageContext.request.contextPath }/statics/img/ph4.png"
											alt="">
										<div class="product-hover">
											<a href="" class="add-to-cart-link"><i
												class="fa fa-shopping-cart"></i> 加入购物车 </a> <a href=""
												class="view-details-link"><i class="fa fa-link"></i>
												了解产品 </a>
										</div>
									</div>

									<h2>
										<a href=""> Oppo A73 - 2018 </a>
									</h2>

									<div class="product-carousel-price">
										<ins>￥3700.00</ins>
										<del>￥4100.00</del>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="publicPage/footer.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/cart.js"></script>

</body>
</html>