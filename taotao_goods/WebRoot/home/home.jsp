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

<title>首页</title>

<link
	href="<c:url value='../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css'/>" />
<link
	href="<c:url value='../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css'/>" />

<link
	href="<c:url value='../basic/css/demo.css" rel="stylesheet" type="text/css'/>" />

<link
	href="<c:url value='../css/hmstyle.css" rel="stylesheet" type="text/css'/>" />
<link
	href="<c:url value='../css/skin.css" rel="stylesheet" type="text/css'/>" />
<script src="<c:url value='/AmazeUI-2.4.2/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/AmazeUI-2.4.2/assets/js/amazeui.min.js'/>"></script>

</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<c:import url="/head.jsp"></c:import>
	</div>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.html"><img
						src="../images/ad1.jpg" /> </a>
				</li>
				<li class="banner2"><a><img src="../images/ad2.jpg" /> </a>
				</li>
				<li class="banner3"><a><img src="../images/ad3.jpg" /> </a>
				</li>
				<li class="banner4"><a><img src="../images/ad4.jpg" /> </a>
				</li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">

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
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">
								<c:forEach items="${parents}" var="parent">
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../${parent.image}"> </i><a class="ml-22"
													title="点心">${parent.cname }</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side">

															<dl class="dl-sort">
																<c:forEach items="${parent.cname}" var="parentCname">
																	<dt>
																		<span title="蛋糕">${parentCname}</span>
																	</dt>
																	<c:forEach items="${parent.children}" var="child">
																		<dd>
																			<a title="蒸蛋糕"
																				href="<c:url value='/GoodsServlet?method=findByCategory&cid=${child.cid }'/>"><span>${
																					child.cname}</span> </a>
																		</dd>
																	</c:forEach>
																</c:forEach>
															</dl>

														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="呵官方旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">呵官方旗舰店</span>
																	</a>
																</dd>
																<dd>
																	<a rel="nofollow" title="格瑞旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>格瑞旗舰店</span> </a>
																</dd>
																<dd>
																	<a rel="nofollow" title="飞彦大厂直供" target="_blank"
																		href="#" rel="nofollow"><span class="red">飞彦大厂直供</span>
																	</a>
																</dd>
																<dd>
																	<a rel="nofollow" title="红e·艾菲妮" target="_blank"
																		href="#" rel="nofollow"><span>红e·艾菲妮</span> </a>
																</dd>
																<dd>
																	<a rel="nofollow" title="本真旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">本真旗舰店</span>
																	</a>
																</dd>
																<dd>
																	<a rel="nofollow" title="杭派女装批发网" target="_blank"
																		href="#" rel="nofollow"><span class="red">杭派女装批发网</span>
																	</a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b></li>
								</c:forEach>

							</ul>
						</div>
					</div>

				</div>
			</div>


			<!--轮播-->

			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>



			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img src="../images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

			<!--走马灯 -->

			<div class="marqueen">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">

					<ul>
						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="../person/index.html"> <img
									src="../images/getAvatar.do.jpg"> </a> <em> Hi,<span
									class="s-name"> <c:choose>
											<c:when test="${empty sessionScope.sessionUser }">小叮当</c:when>
											<c:otherwise>${sessionScope.sessionUser.loginname }</c:otherwise>
										</c:choose> </span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="login.html">登录</a> <a
									class="am-btn-warning btn" href="register.html">注册</a>
							</div>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>
						</div>
						<c:forEach items="${new }" var="new" end="4">
							<li><a target="_blank"
								href="<c:url value='/NewServlet?method=load&nid=${new.nid }'/>"><span>[${new.ntype
										}]</span>${new.desc }</a>
							</li>
						</c:forEach>
					</ul>
					<div class="advTip">
						<img src="../images/advTip.jpg" />
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="../images/2016.png "></img>
					<p>
						今日<br>推荐
					</p>
				</div>

				<c:forEach items="${promotion}" var="promotion">
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>${promotion.h1}</h3>
							<h4>${promotion.h2}</h4>
						</div>
						<div class="recommendationMain one">
							<a href="introduction.html"><img src="../${promotion.image} "></img>
							</a>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="clear "></div>
			<!--热门活动 -->

			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>活动</h4>
					<h3>每期活动 优惠享不停</h3>
					<span class="more "> <a href="# ">全部活动<i
							class="am-icon-angle-right" style="padding-left:10px ;"></i> </a> </span>
				</div>
				<div class="am-g am-g-fixed ">
					<c:forEach items="${activity}" var="activity">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>${activity.title}</h4>
							<div class="activityMain ">
								<img src="../${activity.image}"></img>
							</div>
							<div class="info ">
								<h3>${activity.press}</h3>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
			<div class="clear "></div>


			<c:forEach items="${parents}" var="parent">
				<div id="f${parent.orderBy-1 }">
					<!--甜点-->

					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${parent.cname }</h4>
							<h3>${parent.desc }</h3>
							<div class="today-brands ">
								<c:forEach items="${parent.children}" var="child">
									<a title="蒸蛋糕"
										href="<c:url value='/GoodsServlet?method=findByCategory&cid=${child.cid }'/>">${child.cname}</a>
								</c:forEach>
							</div>
							<span class="more "> <a href="# ">更多美味<i
									class="am-icon-angle-right" style="padding-left:10px ;"></i> </a> </span>
						</div>
					</div>

					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
								<c:forEach items="${parent.children}" var="child" end="5">
									<a class="outer" href="#"><span class="inner"><b
											class="text">${child.cname}</b> </span> </a>
								</c:forEach>

							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">开抢啦！</div>
									<div class="sub-title ">零食大礼包</div>
								</div> <img src="../${parent.image_b } " /> </a>
							<div class="triangle-topright"></div>
						</div>

						<div class="am-u-sm-7 am-u-md-4 text-two sug">
							<div class="outer-con ">
								<div class="title ">${parent.children[0].goods[1].gname}</div>
								<div class="sub-title ">¥${parent.children[0].goods[1].price}</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a
								href="<c:url value='/GoodsServlet?method=findByGid&gid=${parent.children[0].goods[1].gid}'/> "><img 
								src="../${parent.children[0].goods[1].image_1}" /> </a>
						</div>

						<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">${parent.children[0].goods[0].gname}</div>
								<div class="sub-title ">¥${parent.children[0].goods[0].price}</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a
								href="<c:url value='/GoodsServlet?method=findByGid&gid=${parent.children[0].goods[0].gid}'/> "><img
								src="../${parent.children[0].goods[0].image_1}" /> </a>
						</div>


						<div class="am-u-sm-3 am-u-md-2 text-three big">
							<div class="outer-con ">
								<div class="title ">${parent.children[0].goods[2].gname}</div>
								<div class="sub-title ">¥${parent.children[0].goods[2].price}</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a
								href="<c:url value='/GoodsServlet?method=findByGid&gid=${parent.children[0].goods[2].gid}'/> "><img
								src="../${parent.children[0].goods[2].image_1}" /> </a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three sug">
							<div class="outer-con ">
								<div class="title ">${parent.children[0].goods[3].gname}</div>
								<div class="sub-title ">¥${parent.children[0].goods[3].price}</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a
								href="<c:url value='/GoodsServlet?method=findByGid&gid=${parent.children[0].goods[3].gid}'/> "><img
								src="../${parent.children[0].goods[3].image_1}" /> </a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three ">
							<div class="outer-con ">
								<div class="title ">${parent.children[0].goods[4].gname}</div>
								<div class="sub-title ">¥${parent.children[0].goods[4].price}</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a
								href="<c:url value='/GoodsServlet?method=findByGid&gid=${parent.children[0].goods[4].gid}'/> "><img
								src="../${parent.children[0].goods[4].image_1}" /> </a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three last big ">
							<div class="outer-con ">
								<div class="title ">${parent.children[0].goods[5].gname}</div>
								<div class="sub-title ">¥${parent.children[0].goods[5].price}</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a
								href="<c:url value='/GoodsServlet?method=findByGid&gid=${parent.children[0].goods[5].gid}'/> "><img
								src="../${parent.children[0].goods[5].image_1}" /> </a>
						</div>

					</div>
					<div class="clear "></div>
				</div>
			</c:forEach>


			<div class="footer ">
				<!-- 底部导航栏 -->
				<c:import url="/footer.jsp"></c:import>
			</div>

		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home.html"><i
				class="am-icon-home "></i>首页</a>
		</li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a>
		</li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a>
		</li>
		<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a>
		</li>
	</div>


	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<c:choose>
					<c:when test="${empty sessionScope.sessionUser }">
						<div id="prof" class="item ">
							<a href="# "> <span class="setting "></span> </a>
							<div class="ibar_login_box status_login ">
								<div class="avatar_box ">
									<p class="avatar_imgbox ">
										<img src="../images/no-img_mid_.jpg " />
									</p>
									<ul class="user_info ">

										<a href="<c:url value='/home/login.jsp'/>" target="_top"
											class="h">登录</a>
										<a href="<c:url value='/home/register.jsp'/>" target="_top">注册</a>

									</ul>
								</div>
								<div class="login_btnbox ">
									<a href="<c:url value='/home/login.jsp'/> "
										class="login_order ">我的订单</a> <a
										href="<c:url value='/home/login.jsp'/>"
										class="login_favorite ">我的收藏</a>
								</div>
								<i class="icon_arrow_white "></i>
							</div>

						</div>
						<div id="shopCart " class="item ">
							<a href="<c:url value='/home/login.jsp'/>"> <span
								class="message "></span> </a>
							<p>购物车</p>
							<p class="cart_num ">0</p>
						</div>
						<div id="asset " class="item ">
							<a href="<c:url value='/home/login.jsp'/>"> <span
								class="view "></span> </a>
							<div class="mp_tooltip ">
								我的资产 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="foot " class="item ">
							<a href="<c:url value='/home/login.jsp'/>"> <span
								class="zuji "></span> </a>
							<div class="mp_tooltip ">
								我的足迹 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="brand " class="item ">
							<a href="<c:url value='/home/login.jsp'/>"> <span
								class="wdsc "><img src="../images/wdsc.png " /> </span> </a>
							<div class="mp_tooltip ">
								我的收藏 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="broadcast " class="item ">
							<a href="<c:url value='/home/login.jsp'/>"> <span
								class="chongzhi "><img src="../images/chongzhi.png " />
							</span> </a>
							<div class="mp_tooltip ">
								我要充值 <i class="icon_arrow_right_black "></i>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="prof" class="item ">
							<a href="# "> <span class="setting "></span> </a>
							<div class="ibar_login_box status_login ">
								<div class="avatar_box ">
									<p class="avatar_imgbox ">
										<img src="../images/no-img_mid_.jpg " />
									</p>
									<ul class="user_info ">
										<li>用户名${sessionScope.sessionUser.loginname }</li>
										<li>级&nbsp;别:普通会员</li>
									</ul>
								</div>
								<div class="login_btnbox ">
									<a href="# " class="login_order ">我的订单</a> <a href="# "
										class="login_favorite ">我的收藏</a>
								</div>
								<i class="icon_arrow_white "></i>
							</div>

						</div>
						<div id="shopCart " class="item ">
							<a href="# "> <span class="message "></span> </a>
							<p>购物车</p>
							<p class="cart_num ">0</p>
						</div>
						<div id="asset " class="item ">
							<a href="# "> <span class="view "></span> </a>
							<div class="mp_tooltip ">
								我的资产 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="foot " class="item ">
							<a href="# "> <span class="zuji "></span> </a>
							<div class="mp_tooltip ">
								我的足迹 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="brand " class="item ">
							<a href="#"> <span class="wdsc "><img
									src="../images/wdsc.png " /> </span> </a>
							<div class="mp_tooltip ">
								我的收藏 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="broadcast " class="item ">
							<a href="# "> <span class="chongzhi "><img
									src="../images/chongzhi.png " /> </span> </a>
							<div class="mp_tooltip ">
								我要充值 <i class="icon_arrow_right_black "></i>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span>
					</a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span> </a>
						<div class="mp_qrcode " style="display:none; ">
							<img src="../images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span> </a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div> </a> <a href="# " target="_blank "
					class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div> </a> <a href="# " target="_blank "
					class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div> </a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
		</div>
	</div>
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="../basic/js/quick_links.js "></script>
</body>

</html>