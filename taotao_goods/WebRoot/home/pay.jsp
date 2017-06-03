<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>

<link
	href="<c:url value='/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet'/>"
	type="text/css" />
<link
	href="<c:url value='/basic/css/demo.css" rel="stylesheet" type="text/css'/>" />
<link
	href="<c:url value='/css/cartstyle.css" rel="stylesheet" type="text/css'/>" />

<link
	href="<c:url value='/css/jsstyle.css" rel="stylesheet" type="text/css'/>" />

<script type="text/javascript" src="<c:url value='/js/address.js'/>"></script>
<script src="<c:url value='/AmazeUI-2.4.2/assets/js/jquery.min.js'/>"></script>
<script type="text/javascript" >
 	/*
 	 * 结算
 	 */
 	function jiesuan() {
 		// 1. 获取所有的条目的id，放到数组中
 		var cartItemIdArray = new Array();
 		$(".sku-line").each(function() {
 			cartItemIdArray.push($(this).text());//把值添加到数组中		
 		});	
 		// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
 		$("#cartItemIds").val(cartItemIdArray.toString());
 		// 把详细位置的值，也保存到表单中
 		$("#addressDetail").val($("#address").text());
 		// 3. 提交这个表单
 		$("#jieSuanForm").submit();
 	}
 	</script>
</head>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<c:import url="/head.jsp"></c:import>
		<div class="concent">
			<!--地址 -->
			<div class="paycont">
				<div class="address">
					<h3>确认收货地址</h3>
					<div class="control">
						<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
					</div>
					<div class="clear"></div>
					<ul>
						<c:forEach items="${sessionScope.sessionUser.addressList}"
							var="address">
							<div class="per-border"></div>
							<li class="user-addresslist">
								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail"> <span
											class="buy-user">${sessionScope.sessionUser.loginname}
										</span> <span class="buy-phone">${sessionScope.sessionUser.phone}</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail"> <span
											class="province">${address.provincial }</span> <span
											class="city">${address.city }</span> <span class="dist">${address.distric
												}</span> <span class="street">${address.detailedAddress }</span> </span> </span>
									</div>
									<ins class="deftip hidden">默认地址</ins>
								</div>
								<div class="address-right">
									<span class="am-icon-angle-right am-icon-lg"></span>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="#">设为默认</a> <span class="new-addr-bar">|</span> <a
										href="#">编辑</a> <span class="new-addr-bar">|</span> <a
										href="javascript:void(0);" onclick="delClick(this);">删除</a>
								</div></li>
						</c:forEach>

					</ul>

					<div class="clear"></div>
				</div>
				<!--物流 -->
				<div class="logistics">
					<h3>选择物流方式</h3>
					<ul class="op_express_delivery_hot">
						<li data-value="yuantong" class="OP_LOG_BTN  "><i
							class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span>
						</li>
						<li data-value="shentong" class="OP_LOG_BTN  "><i
							class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span>
						</li>
						<li data-value="yunda" class="OP_LOG_BTN  "><i
							class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span>
						</li>
						<li data-value="zhongtong"
							class="OP_LOG_BTN op_express_delivery_hot_last "><i
							class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span>
						</li>
						<li data-value="shunfeng"
							class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i
							class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span>
						</li>
					</ul>
				</div>
				<div class="clear"></div>

				<!--支付方式-->
				<div class="logistics">
					<h3>选择支付方式</h3>
					<ul class="pay-list">
						<li class="pay card"><img src="<%=path%>/images/wangyin.jpg" />银联<span></span>
						</li>
						<li class="pay qq"><img src="<%=path%>/images/weizhifu.jpg" />微信<span></span>
						</li>
						<li class="pay taobao"><img
							src="<%=path%>/images/zhifubao.jpg" />支付宝<span></span></li>
					</ul>
				</div>
				<div class="clear"></div>

				<!--订单 -->
				<div class="concent">
					<div id="payTable">
						<h3>确认订单信息</h3>
						<div class="cart-table-th">
							<div class="wp">

								<div class="th th-item">
									<div class="td-inner">商品信息</div>
								</div>
								<div class="th th-price">
									<div class="td-inner">单价</div>
								</div>
								<div class="th th-amount">
									<div class="td-inner">数量</div>
								</div>
								<div class="th th-sum">
									<div class="td-inner">金额</div>
								</div>
								<div class="th th-oplist">
									<div class="td-inner">配送方式</div>
								</div>

							</div>
						</div>
						<div class="clear"></div>
						<c:forEach items="${cartItemList}" var="cartItem">
							<tr class="item-list">
								<div class="bundle  bundle-last">

									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint"> <img
															src="<%=path %>/${cartItem.goods.image_4}"
															class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a
																href="<c:url value='/GoodsServlet?method=findByGid&gid=${cartItem.goods.gid}'/> "
																class="item-title J_MakePoint" data-point="tbcart.8.11">${cartItem.goods.gname}</a>
														</div>
													</div></li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">${cartItem.cartItemId}</span>
													</div></li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">${cartItem.goods.currPrice}</em>
														</div>
													</div></li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															<input class="min am-btn" name="" type="button" value="-" />
															<input class="text_box" name="" type="text"
																id="${cartItem.cartItemId}Quantity"
																value="${cartItem.quantity}" style="width:30px;" /> <input
																class="add am-btn" name="" type="button" value="+" />
														</div>
													</div>
												</div></li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number" name="Subtotal"
														id="${cartItem.cartItemId}Subtotal">${cartItem.subtotal}</em>
												</div></li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">包邮</div>
												</div></li>

										</ul>
										<div class="clear"></div>

									</div>
							</tr>
							<div class="clear"></div>
					</div>
					</c:forEach>
					<div class="pay-total">
						<!--留言-->
						<div class="order-extra">
							<div class="order-user-info">
								<div id="holyshit257" class="memo">
									<label>买家留言：</label> <input type="text"
										title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
										placeholder="选填,建议填写和卖家达成一致的说明"
										class="memo-input J_MakePoint c2c-text-default memo-close">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
								</div>
							</div>

						</div>
						<!--优惠券 -->
						<div class="buy-agio">
							<li class="td td-coupon"><span class="coupon-title">优惠券</span>
								<select data-am-selected>
									<option value="a">
										<div class="c-price">
											<strong>￥8</strong>
										</div>
										<div class="c-limit">【消费满95元可用】</div>
									</option>
									<option value="b" selected>
										<div class="c-price">
											<strong>￥3</strong>
										</div>
										<div class="c-limit">【无使用门槛】</div>
									</option>
							</select></li>

							<li class="td td-bonus"><span class="bonus-title">红包</span>
								<select data-am-selected>
									<option value="a">
										<div class="item-info">
											¥50.00<span>元</span>
										</div>
										<div class="item-remainderprice">
											<span>还剩</span>10.40<span>元</span>
										</div>
									</option>
									<option value="b" selected>
										<div class="item-info">
											¥50.00<span>元</span>
										</div>
										<div class="item-remainderprice">
											<span>还剩</span>50.00<span>元</span>
										</div>
									</option>
							</select></li>

						</div>
						<div class="clear"></div>
					</div>
					<!--含运费小计 -->
					<div class="buy-point-discharge ">
						<p class="price g_price ">
							合计（含运费） <span>¥</span><em class="pay-sum" id="total">${total }</em>
						</p>
					</div>

					<!--信息 -->
					<div class="order-go clearfix">
						<div class="pay-confirm clearfix">
							<div class="box">
								<div tabindex="0" id="holyshit267" class="realPay">
									<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
										<em class="style-large-bold-red " id="J_ActualFee">244.00</em>
									</span>
								</div>

								<div id="holyshit268" class="pay-address">

									<p class="buy-footer-address">
										<span class="buy-line-title buy-line-title-type">寄送至：</span> 
										<span id="address" class="buy--address-detail"> ${sessionScope.sessionUser.addressList[0].provincial}
											${sessionScope.sessionUser.addressList[0].city}&nbsp;
											${sessionScope.sessionUser.addressList[0].distric}&nbsp;
											${sessionScope.sessionUser.addressList[0].detailedAddress} </span>
									</p>
									<p class="buy-footer-address">
										<span class="buy-line-title">收货人：</span> <span
											class="buy-address-detail"> <span class="buy-user">${sessionScope.sessionUser.loginname}
										</span> <span class="buy-phone">${sessionScope.sessionUser.phone}</span>
										</span>
									</p>
								</div>
							</div>

							<div id="holyshit269" class="submitOrder">
								<div class="go-btn-wrap">
								<form id="jieSuanForm" action="<c:url value='/OrderServlet'/>" method="post">
								<input type="hidden" name="cartItemIds" id="cartItemIds" />
								<input type="hidden" name="addressDetail" id="addressDetail" /> 
								<input type="hidden" name="method" value="createOrder" />
									<a id="J_Go" href="javascript:jiesuan();" class="btn-go" tabindex="0"
										title="点击此按钮，提交订单">提交订单</a>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>

				<div class="clear"></div>
			</div>
		</div>
		<div class="footer">
			<!-- 底部导航栏 -->
			<c:import url="/footer.jsp"></c:import>
		</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form class="am-form am-form-horizontal">

				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" placeholder="手机号必填" type="email">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						<select data-am-selected>
							<option value="a">浙江省</option>
							<option value="b">湖北省</option>
						</select> <select data-am-selected>
							<option value="a">温州市</option>
							<option value="b">武汉市</option>
						</select> <select data-am-selected>
							<option value="a">瑞安区</option>
							<option value="b">洪山区</option>
						</select>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div class="am-btn am-btn-danger">保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>
</body>

</html>