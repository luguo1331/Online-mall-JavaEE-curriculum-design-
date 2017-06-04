<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link href="<c:url value='/AmazeUI-2.4.2/assets/css/admin.css'/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/AmazeUI-2.4.2/assets/css/amazeui.css'/>"
	rel="stylesheet" type="text/css">

<link href="<c:url value='/css/personal.css" rel="stylesheet'/>"
	type="text/css">
<link href="<c:url value='/css/orstyle.css" rel="stylesheet'/>"
	type="text/css">

<script src="<c:url value='/AmazeUI-2.4.2/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/AmazeUI-2.4.2/assets/js/amazeui.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".orderNum").each(function() {
			$(this).text($(this).text().substring(0, 18));
		});

	});
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
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<c:import url="/head.jsp"></c:import>
			</div>
		</article>
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a>
				</li>
				<li class="qc"><a href="#">闪购</a>
				</li>
				<li class="qc"><a href="#">限时抢</a>
				</li>
				<li class="qc"><a href="#">团购</a>
				</li>
				<li class="qc last"><a href="#">大包装</a>
				</li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a>
							</li>
							<li><a href="#tab2">待付款</a>
							</li>
							<li><a href="#tab3">待发货</a>
							</li>
							<li><a href="#tab4">待收货</a>
							</li>
							<li><a href="#tab5">待评价</a>
							</li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<c:forEach items="${pb.beanList }" var="order">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">
														订单编号：<a href="javascript:;" class="orderNum">${order.oid
															}</a>
													</div>
													<span>成交时间：${order.ordertime}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<c:forEach items="${order.orderItemList }" var="orderItem">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint"> <img
																			src="${orderItem.goods.image_4}"
																			class="itempic J_ItemImg"> </a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>${orderItem.goods.gname}</p>
																				<p class="info-little">
																					<br />${orderItem.orderItemId}
																				</p> </a>
																		</div>
																	</div></li>
																<li class="td td-price">
																	<div class="item-price">${orderItem.goods.currPrice}</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${orderItem.quantity}
																	</div></li>
																<li class="td td-operation">
																	<div class="item-operation"></div></li>
															</ul>
														</c:forEach>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.total}
																<p>
																	含运费：<span>0.00</span>
																</p>
															</div></li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:choose>
																		<c:when test="${order.status eq 1 }">
																			<p class="Mystatus">等待付款</p>
																			<p class="order-info">
																				<a href="<c:url value='/OrderServlet?method=cancel&oid=${order.oid }'/>">取消订单</a>
																			</p>
																		</c:when>
																		<c:when test="${order.status eq 2 }">
																			<p class="Mystatus">准备发货</p>
																			<p class="order-info">
																				<a href="orderinfo.html">订单详情</a>
																			</p>
																			<p class="order-info">
																				<a href="logistics.html">查看物流</a>
																			</p>
																		</c:when>
																		<c:when test="${order.status eq 3 }">
																			<p class="Mystatus">等待确认</p>
																			<p class="order-info">
																				<a href="orderinfo.html">订单详情</a>
																			</p>
																			<p class="order-info">
																				<a href="logistics.html">查看物流</a>
																			</p>
																		</c:when>
																		<c:when test="${order.status eq 4 }">
																			<p class="Mystatus">交易成功</p>
																			<p class="order-info">
																				<a href="orderinfo.html">订单详情</a>
																			</p>
																			<p class="order-info">
																				<a href="logistics.html">查看物流</a>
																			</p>
																		</c:when>
																		<c:when test="${order.status eq 5 }">
																			<p class="Mystatus">已取消</p>
																		</c:when>
																	</c:choose>
																</div></li>
															<li class="td td-change"><c:choose>
																	<c:when test="${order.status eq 1 }">
																		<a href="#"><div
																				class="am-btn am-btn-danger anniu">一键支付</div> </a>
																	</c:when>
																	<c:when test="${order.status eq 2 }">
																		<a href="#"><div
																				class="am-btn am-btn-danger anniu">提醒发货</div> </a>
																	</c:when>
																	<c:when test="${order.status eq 3 }">
																		<a href="#"><div
																				class="am-btn am-btn-danger anniu">确认收货</div> </a>
																	</c:when>
																	<c:when test="${order.status eq 4 }">
																		<a href="#"><div
																				class="am-btn am-btn-danger anniu">评价商品</div> </a>
																	</c:when>
																	<c:when test="${order.status eq 5 }">
																		<a href="#"><div
																				class="am-btn am-btn-danger anniu">已经取消</div> </a>
																	</c:when>
																</c:choose></li>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>

							</div>
							<div class="am-tab-panel am-fade" id="tab2">

								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status1">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation"></div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation"></div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation"></div></li>
													</ul>
												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div></li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">等待买家付款</p>
																<p class="order-info">
																	<a href="#">取消订单</a>
																</p>

															</div></li>
														<li class="td td-change"><a href="pay.html">
																<div class="am-btn am-btn-danger anniu">一键支付</div> </a></li>
													</div>
												</div>

											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="am-tab-panel am-fade" id="tab3">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status2">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款</a>
															</div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款</a>
															</div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款</a>
															</div></li>
													</ul>
												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div></li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">买家已付款</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
															</div></li>
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu">提醒发货</div></li>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="am-tab-panel am-fade" id="tab4">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status3">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div></li>
													</ul>

												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div></li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">卖家已发货</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
																<p class="order-info">
																	<a href="logistics.html">查看物流</a>
																</p>
																<p class="order-info">
																	<a href="#">延长收货</a>
																</p>
															</div></li>
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu">确认收货</div></li>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="am-tab-panel am-fade" id="tab5">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<!--不同状态的订单	-->
										<div class="order-status4">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>

											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div></li>
													</ul>

												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div></li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">交易成功</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
																<p class="order-info">
																	<a href="logistics.html">查看物流</a>
																</p>
															</div></li>
														<li class="td td-change"><a href="commentlist.html">
																<div class="am-btn am-btn-danger anniu">评价商品</div> </a></li>
													</div>
												</div>
											</div>
										</div>


										<div class="order-status4">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div></li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg"> </a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p> </a>
																</div>
															</div></li>
														<li class="td td-price">
															<div class="item-price">333.00</div></li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div></li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div></li>
													</ul>


												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div></li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">交易成功</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
																<p class="order-info">
																	<a href="logistics.html">查看物流</a>
																</p>
															</div></li>
														<li class="td td-change"><a href="commentlist.html">
																<div class="am-btn am-btn-danger anniu">评价商品</div> </a></li>
													</div>
												</div>
											</div>
										</div>


									</div>

								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
			<!--底部-->
			<div class="footer">
				<!-- 底部导航栏 -->
				<c:import url="/footer.jsp"></c:import>
			</div>
		</div>
		<aside class="menu">
			<!-- 个人用户导航栏 -->
			<c:import url="/aside.jsp"></c:import>
		</aside>
	</div>

</body>

</html>