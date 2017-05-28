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

<title>实名认证</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
	<!--头 -->
	<header>
		<article>
			<div class="hmtop">
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

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em>
						</i>
							<p class="stage-name">实名认证</p> </span> <span class="step-2 step">
							<em class="u-progress-stage-bg"></em> <i
							class="u-stage-icon-inner">2<em class="bg"></em>
						</i>
							<p class="stage-name">完成</p> </span> <span
							class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal">
					<div class="am-form-group bind">
						<label for="user-info" class="am-form-label">账户名</label>
						<div class="am-form-content">
							<span id="user-info">186XXXX0531</span>
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-name" class="am-form-label">真实姓名</label>
						<div class="am-form-content">
							<input type="text" id="user-name" placeholder="请输入您的真实姓名">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-IDcard" class="am-form-label">身份证号</label>
						<div class="am-form-content">
							<input type="tel" id="user-IDcard" placeholder="请输入您的身份证信息">
						</div>
					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger">保存修改</div>
					</div>

				</form>

			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
					</p>
				</div>
			</div>
		</div>

		<aside class="menu">
			<ul>
				<li class="person"><a href="index.html">个人中心</a></li>
				<li class="person"><a href="#">个人资料</a>
					<ul>
						<li><a href="information.html">个人信息</a>
						</li>
						<li><a href="safety.html">安全设置</a>
						</li>
						<li><a href="address.html">收货地址</a>
						</li>
					</ul></li>
				<li class="person"><a href="#">我的交易</a>
					<ul>
						<li><a href="order.html">订单管理</a>
						</li>
						<li><a href="change.html">退款售后</a>
						</li>
					</ul></li>
				<li class="person"><a href="#">我的资产</a>
					<ul>
						<li><a href="coupon.html">优惠券 </a>
						</li>
						<li><a href="bonus.html">红包</a>
						</li>
						<li><a href="bill.html">账单明细</a>
						</li>
					</ul></li>

				<li class="person"><a href="#">我的小窝</a>
					<ul>
						<li><a href="collection.html">收藏</a>
						</li>
						<li><a href="foot.html">足迹</a>
						</li>
						<li><a href="comment.html">评价</a>
						</li>
						<li><a href="news.html">消息</a>
						</li>
					</ul></li>

			</ul>

		</aside>
	</div>

</body>

</html>