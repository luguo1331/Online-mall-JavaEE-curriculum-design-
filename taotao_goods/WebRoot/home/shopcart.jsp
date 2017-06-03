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
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>购物车页面</title>

<link href="<c:url value='/AmazeUI-2.4.2/assets/css/amazeui.css'/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/basic/css/demo.css" rel="stylesheet'/>"
	type="text/css" />
<link href="<c:url value='/css/cartstyle.css" rel="stylesheet'/>"
	type="text/css" />
<link href="<c:url value='/css/optstyle.css" rel="stylesheet'/>"
	type="text/css" />

<script type="text/javascript" src="<c:url value='/js/jquery.js'/>"></script>
<script type="text/javascript">
	/*
	 * 结算
	 */
	function jiesuan() {
		// 1. 获取所有被选择的条目的id，放到数组中
		var cartItemIdArray = new Array();
		$(":checkbox[id=J_CheckBox_170037950254][checked=checked]").each(
				function() {
					cartItemIdArray.push($(this).val());//把复选框的值添加到数组中

				});
		// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
		$("#cartItemIds").val(cartItemIdArray.toString());
		// 把总计的值，也保存到表单中
		$("#hiddenTotal").val($("#J_Total").text());
		// 3. 提交这个表单
		$("#jieSuanForm").submit();
	}
</script>
</head>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<c:import url="/head.jsp"></c:import>

		<!--购物车 -->
		<div class="concent">
			<div id="cartTable">
				<div class="cart-table-th">
					<div class="wp">
						<div class="th th-chk">
							<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
						</div>
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
						<div class="th th-op">
							<div class="td-inner">操作</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>

				<tr class="item-list">
					<div class="bundle  bundle-last ">
						<div class="bundle-hd">
							<div class="bd-promos">
								<div class="bd-has-promo">
									已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;
								</div>
								<div class="act-promo">
									<a href="#" target="_blank"><span class="gt">&gt;&gt;</span>
									</a>
								</div>
								<span class="list-change theme-login">编辑</span>
							</div>
						</div>
						<div class="clear"></div>
						<div class="bundle-main">
							<c:forEach items="${cartItemList}" var="cartItem">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="J_CheckBox_170037950254"
												value="${cartItem.cartItemId}" name="checkboxBtn"
												checked="checked" type="checkbox" /> <label
												for="J_CheckBox_170037950254"> </label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank"
												data-title="${cartItem.goods.gname}" class="J_MakePoint"
												data-point="tbcart.8.12"> <img
												src="<%=path %>/${cartItem.goods.image_4}"
												class="itempic J_ItemImg"> </a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a
													href="<c:url value='/GoodsServlet?method=findByGid&gid=${cartItem.goods.gid}'/> "
													target="_blank" title="${cartItem.goods.gname}"
													class="item-title J_MakePoint" data-point="tbcart.8.11">${cartItem.goods.gname}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line">${cartItem.cartItemId}</span> <span
												class="sku-line"></span> <span tabindex="0"
												class="btn-edit-sku theme-login"></span> <i
												class="theme-login am-icon-sort-desc"></i>
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${cartItem.goods.price}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${cartItem.goods.currPrice}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button" value="-" />
													<input class="text_box" name=""
														id="${cartItem.cartItemId}Quantity" type="text"
														value="${cartItem.quantity}" style="width:30px;" /> <input
														class="add am-btn" name="" type="button" value="+" />
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number"
												id="${cartItem.cartItemId}Subtotal">${cartItem.subtotal
												}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a title="移入收藏夹" class="btn-fav" href="#"> 移入收藏夹</a> <a
												href="javascript:;" data-point-url="#" class="delete">
												删除</a>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>
				</tr>
				<div class="clear"></div>
				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2"
								name="select-all" value="true" type="checkbox" checked="checked">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="operations">
						<a href="#" hidefocus="true" class="deleteAll">删除</a> <a href="#"
							hidefocus="true" class="J_BatchFav">移入收藏夹</a>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span
								class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span> <span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span> <strong class="price">¥<em
								id="J_Total">0.00</em> </strong>
						</div>
						<div class="btn-area">
							<form id="jieSuanForm" action="<c:url value='/CartItemServlet'/>"
								method="post">
								<input type="hidden" name="cartItemIds" id="cartItemIds" /> <input
									type="hidden" name="total" id="hiddenTotal" /> <input
									type="hidden" name="method" value="loadCartItems" /> <a
									href="javascript:jiesuan();" id="J_Go"
									class="submit-btn submit-btn-disabled"
									aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span> </a>
							</form>
						</div>
					</div>

				</div>

				<div class="footer">
					<!-- 底部导航栏 -->
					<c:import url="/footer.jsp"></c:import>

				</div>

				<!--操作页面-->

				<div class="theme-popover-mask"></div>

				<div class="theme-popover">
					<div class="theme-span"></div>
					<div class="theme-poptit h-title">
						<a href="javascript:;" title="关闭" class="close">×</a>
					</div>
					<div class="theme-popbod dform">
						<form class="theme-signin" name="loginform" action=""
							method="post">

							<div class="theme-signin-left">

								<li class="theme-options">
									<div class="cart-title">颜色：</div>
									<ul>
										<li class="sku-line selected">12#川南玛瑙<i></i></li>
										<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
									</ul>
								</li>
								<li class="theme-options">
									<div class="cart-title">包装：</div>
									<ul>
										<li class="sku-line selected">包装：裸装<i></i></li>
										<li class="sku-line">两支手袋装（送彩带）<i></i></li>
									</ul>
								</li>
								<div class="theme-options">
									<div class="cart-title number">数量</div>
									<dd>
										<input class="min am-btn am-btn-default" name="" type="button"
											value="-" /> <input class="text_box" name="" type="text"
											value="1" style="width:30px;" /> <input
											class="add am-btn am-btn-default" name="" type="button"
											value="+" /> <span class="tb-hidden">库存<span
											class="stock">1000</span>件</span>
									</dd>

								</div>
								<div class="clear"></div>
								<div class="btn-op">
									<div class="btn am-btn am-btn-warning">确认</div>
									<div class="btn close am-btn am-btn-warning">取消</div>
								</div>

							</div>
							<div class="theme-signin-right">
								<div class="img-info">
									<img src="../images/kouhong.jpg_80x80.jpg" />
								</div>
								<div class="text-info">
									<span class="J_Price price-now">¥39.00</span> <span id="Stock"
										class="tb-hidden">库存<span class="stock">1000</span>件</span>
								</div>
							</div>

						</form>
					</div>
				</div>
				<!--引导 -->
				<div class="navCir">
					<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
					<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
					<li class="active"><a href="shopcart.html"><i
							class="am-icon-shopping-basket"></i>购物车</a></li>
					<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a>
					</li>
				</div>
</body>

</html>