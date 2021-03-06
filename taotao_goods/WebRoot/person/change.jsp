<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>退换货管理</title>

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
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
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
							<strong class="am-text-danger am-text-lg">退换货管理</strong> / <small>Change</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">退款管理</a></li>
							<li><a href="#tab2">售后管理</a></li>

						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-orderprice th-price">
										<td class="td-inner">交易金额</td>
									</div>
									<div class="th th-changeprice th-price">
										<td class="td-inner">退款金额</td>
									</div>
									<div class="th th-status th-moneystatus">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change th-changebuttom">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<c:forEach items="${pb.beanList }" var="order">
											<c:choose>
												<c:when test="${order.status eq 5 }">
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
																<c:forEach items="${order.orderItemList }"
																	var="orderItem">
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
																			</div>
																		</li>
																		<li class="td td-price">
																			<div class="item-price">${orderItem.goods.currPrice}0</div>
																		</li>
																		<li class="td td-number">
																			<div class="item-number">
																				<span></span>${orderItem.goods.currPrice*orderItem.quantity}
																			</div>
																		</li>
																		<li class="td td-operation">
																			<div class="item-operation"></div>
																		</li>
																	</ul>
																</c:forEach>
															</div>
															<div class="change move-right">
																<li class="td td-moneystatus td-status">
																	<div class="item-status">
																		<p class="Mystatus">退款成功</p>
																	</div></li>
															</div>
															<li class="td td-change td-changebutton"><a
																href="record.html">
																	<div class="am-btn am-btn-danger anniu">钱款去向</div> </a></li>
														</div>
													</div>
												</c:when>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="am-tab-panel am-fade" id="tab2">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-orderprice th-price">
										<td class="td-inner">交易金额</td>
									</div>
									<div class="th th-changeprice th-price">
										<td class="td-inner">退款金额</td>
									</div>
									<div class="th th-status th-moneystatus">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change th-changebuttom">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-title">
											<div class="dd-num">
												退款编号：<a href="javascript:;">1601430</a>
											</div>
											<span>申请时间：2015-12-20</span>
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
														</div>
													</li>

													<ul class="td-changeorder">
														<li class="td td-orderprice">
															<div class="item-orderprice">
																<span>交易金额：</span>72.00
															</div>
														</li>
														<li class="td td-changeprice">
															<div class="item-changeprice">
																<span>退款金额：</span>70.00
															</div>
														</li>
													</ul>
													<div class="clear"></div>
												</ul>

												<div class="change move-right">
													<li class="td td-moneystatus td-status">
														<div class="item-status">
															<p class="Mystatus">退款成功</p>

														</div>
													</li>
												</div>
												<li class="td td-change td-changebutton"><a
													href="record.html">
														<div class="am-btn am-btn-danger anniu">钱款去向</div> </a>
												</li>

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