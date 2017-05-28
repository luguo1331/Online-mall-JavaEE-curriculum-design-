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

<title>安全问题</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>

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

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">设置安全问题</strong> / <small>Set&nbsp;Safety&nbsp;Question</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em> </i>
							<p class="stage-name">设置安全问题</p> </span> <span class="step-2 step">
							<em class="u-progress-stage-bg"></em> <i
							class="u-stage-icon-inner">2<em class="bg"></em> </i>
							<p class="stage-name">完成</p> </span> <span
							class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal">
					<div class="am-form-group select">
						<label for="user-question1" class="am-form-label">问题一</label>
						<div class="am-form-content">
							<select data-am-selected>
								<option value="a" selected>请选择安全问题</option>
								<option value="b">您最喜欢的颜色是什么？</option>
								<option value="c">您的故乡在哪里？</option>
							</select>
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-answer1" class="am-form-label">答案</label>
						<div class="am-form-content">
							<input type="text" id="user-answer1" placeholder="请输入安全问题答案">
						</div>
					</div>
					<div class="am-form-group select">
						<label for="user-question2" class="am-form-label">问题二</label>
						<div class="am-form-content">
							<select data-am-selected>
								<option value="a" selected>请选择安全问题</option>
								<option value="b">您最喜欢的颜色是什么？</option>
								<option value="c">您的故乡在哪里？</option>
							</select>
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-answer2" class="am-form-label">答案</label>
						<div class="am-form-content">
							<input type="text" id="user-answer2" placeholder="请输入安全问题答案">
						</div>
					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger">保存修改</div>
					</div>

				</form>

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