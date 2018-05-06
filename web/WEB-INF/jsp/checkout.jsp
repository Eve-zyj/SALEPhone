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
<title>结算</title>

<!-- Google Fonts -->
<!-- <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
     -->


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	 <%@ include file="publicPage/top.jsp" %>
   <%@ include file="publicPage/mainmenu.jsp" %>

	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>购物车——结算</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<%@ include file="publicPage/leffter.jsp" %>

				<div class="col-md-8">
					<div class="product-content-right">
						<div class="woocommerce">					
							
							<form id="coupon-collapse-wrap" method="post"
								class="checkout_coupon collapse">

								<p class="form-row form-row-first">
									<input type="text" value="" id="coupon_code" placeholder="优惠码"
										class="input-text" name="coupon_code">
								</p>

								<p class="form-row form-row-last">
									<input type="submit" value="使用优惠" name="apply_coupon"
										class="button">
								</p>

								<div class="clear"></div>
							</form>

							<form enctype="multipart/form-data" action="#" class="checkout"
								method="post" name="checkout">

								<div id="customer_details" class="col2-set">
									<div class="col-1">
										<div class="woocommerce-billing-fields">
											<h3>订单详情</h3>


											<p id="billing_first_name_field"
												class="form-row form-row-first validate-required">
												<label class="" for="billing_first_name">收货人姓名 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_first_name" name="billing_first_name"
													class="input-text ">
											</p>

											<div class="clear"></div>
											<p id="billing_country_field"
												class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
												<label class="" for="billing_country">地址 <abbr
													title="required" class="required">*</abbr>
												</label> <select class="country_to_state country_select"
													id="billing_country" name="billing_country">
													<option value="">选择地址...</option>
													<option value="CX">Christmas Island</option>
													<option value="CC">Cocos (Keeling) Islands</option>
													<option value="CO">Colombia</option>
													<option value="KM">Comoros</option>
													<option value="CG">Congo (Brazzaville)</option>
													<option value="CD">Congo (Kinshasa)</option>													
												</select>
											</p>
											<p id="billing_address_1_field"
												class="form-row form-row-wide address-field validate-required">
												<label class="" for="billing_address_1">详细地址 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_address_1" name="billing_address_1"
													class="input-text ">
											</p>										

											<div class="clear"></div>
											<p id="billing_phone_field"
												class="form-row form-row-last validate-required validate-phone">
												<label class="" for="billing_phone">联系方式 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_phone" name="billing_phone" class="input-text ">
											</p>
											<p id="billing_email_field"
												class="form-row form-row-first validate-required validate-email">
												<label class="" for="billing_email">电子邮箱 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_email" name="billing_email" class="input-text ">
											</p>


											<div class="clear"></div>


			

										</div>
									</div>

									<div class="col-2">
										<div class="woocommerce-shipping-fields">
											<h3 id="ship-to-different-address">
												<label class="checkbox"
													for="ship-to-different-address-checkbox">选择新收货人</label> <input type="checkbox" value="1"
													name="ship_to_different_address" checked="checked"
													class="input-checkbox"
													id="ship-to-different-address-checkbox">
											</h3>
											<p id="billing_first_name_field"
												class="form-row form-row-first validate-required">
												<label class="" for="billing_first_name">收货人姓名 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_first_name" name="billing_first_name"
													class="input-text ">
											</p>

											<div class="clear"></div>
											<p id="billing_country_field"
												class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
												<label class="" for="billing_country">地址 <abbr
													title="required" class="required">*</abbr>
												</label> <select class="country_to_state country_select"
													id="billing_country" name="billing_country">
													<option value="">选择地址...</option>
													<option value="CX">Christmas Island</option>
													<option value="CC">Cocos (Keeling) Islands</option>
													<option value="CO">Colombia</option>
													<option value="KM">Comoros</option>
													<option value="CG">Congo (Brazzaville)</option>
													<option value="CD">Congo (Kinshasa)</option>													
												</select>
											</p>
											<p id="billing_address_1_field"
												class="form-row form-row-wide address-field validate-required">
												<label class="" for="billing_address_1">详细地址 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_address_1" name="billing_address_1"
													class="input-text ">
											</p>										

											<div class="clear"></div>
											<p id="billing_phone_field"
												class="form-row form-row-last validate-required validate-phone">
												<label class="" for="billing_phone">联系方式 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_phone" name="billing_phone" class="input-text ">
											</p>
											<p id="billing_email_field"
												class="form-row form-row-first validate-required validate-email">
												<label class="" for="billing_email">电子邮箱 <abbr
													title="required" class="required">*</abbr>
												</label> <input type="text" value="" placeholder=""
													id="billing_email" name="billing_email" class="input-text ">
											</p>
											<div class="clear"></div></div>
											<p id="order_comments_field" class="form-row notes">
												<label class="" for="order_comments">备注：</label>
												<textarea cols="5" rows="2"
													placeholder="请输入您的留言..."
													id="order_comments" class="input-text "
													name="order_comments"></textarea>
											</p>


										</div>

									</div>
</form>
								</div>

								<h3 id="order_review_heading">您的订单</h3>

								<div id="order_review" style="position: relative;">
									<table class="shop_table">
										<thead>
											<tr>
												<th class="product-name">产品</th>
												<th class="product-total">总计</th>
											</tr>
										</thead>
										<tbody>
											<tr class="cart_item">
												<td class="product-name">Vivo Y66<strong
													class="product-quantity"> 1</strong>
												</td>
												<td class="product-total"><span class="amount">￥2666.00</span>
												</td>
											</tr>
											<tr class="cart_item">
												<td class="product-name"> Vivo Y66 <strong
													class="product-quantity"> 5</strong>
												</td>
												<td class="product-total"><span class="amount"> ￥2666.00 </span>
												</td>
											</tr>
										</tbody>
										<tfoot>

											<tr class="cart-subtotal">
												<th> 小计 </th>
												<td><span class="amount"> ￥2666.00 </span></td>
											</tr>

											<tr class="shipping">
												<th> 运费 </th>
												<td> 包邮 <input type="hidden"
													class="shipping_method" value="free_shipping"
													id="shipping_method_0" data-index="0"
													name="shipping_method[0]">
												</td>
											</tr>


											<tr class="order-total">
												<th> 总计 </th>
												<td><strong><span class="amount"> ￥6666.00 </span></strong>
												</td>
											</tr>

										</tfoot>
									</table>


									
										<div class="form-row place-order">

											<input type="submit" data-value="Place order"
												value="提交订单" id="place_order"
												name="woocommerce_checkout_place_order" class="button alt">


										</div>

										<div class="clear"></div>

									</div>
								</div>

						</div>
					</div>
				</div>
			</div>

<%@ include file="publicPage/footer.jsp" %>

	
</body>
</html>