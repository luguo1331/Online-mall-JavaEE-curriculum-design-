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

<title>修改密码</title>

<link
	href="<c:url value='/AmazeUI-2.4.2/assets/css/admin.css'/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/AmazeUI-2.4.2/assets/css/amazeui.css'/>"
	rel="stylesheet" type="text/css">

<link href="<c:url value='/css/personal.css" rel="stylesheet'/>"
	type="text/css">
<link href="<c:url value='/css/stepstyle.css" rel="stylesheet'/>"
	type="text/css">

<script type="text/javascript"
	src="<c:url value='/js/jquery-1.7.2.min.js'/>"></script>
<script src="<c:url value='/AmazeUI-2.4.2/assets/js/amazeui.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#submit').click(function() {
			$('#form1').submit();
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
						<strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em> </i>
							<p class="stage-name">重置密码</p> </span> <span class="step-2 step">
							<em class="u-progress-stage-bg"></em> <i
							class="u-stage-icon-inner">2<em class="bg"></em> </i>
							<p class="stage-name">完成</p> </span> <span
							class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal" id="form1"
					action="<c:url value='/UserServlet'/>" method="post" >
					<input type="hidden" name="method" value="updatePassword"
						id="method" />
					<div class="am-form-group">
						<label for="user-old-password" class="am-form-label">原密码</label>
						<div class="am-form-content">
							<input type="password" id="user-old-password" name="loginpass"
								placeholder="请输入原登录密码">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-new-password" class="am-form-label">新密码</label>
						<div class="am-form-content">
							<input type="password" id="user-new-password" name="newpass"
								placeholder="由数字、字母组合">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-confirm-password" class="am-form-label">确认密码</label>
						<div class="am-form-content">
							<input type="password" id="user-confirm-password"
								name="reloginpass" placeholder="请再次输入上面的密码">
						</div>
					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger" id="submit">保存修改</div>
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