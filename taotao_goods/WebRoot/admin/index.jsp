<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>管理员页面</title>
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="icon" type="image/png"
	href="<c:url value='/assets/i/favicon.png'/>">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value='/assets/i/app-icon72x72@2x.png'/>">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="<c:url value='/assets/css/amazeui.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/js/app.js'/>"></script>
</head>
<body>
	<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
</head>

<body>

	<header class="am-topbar admin-header">
		<!--顶部导航条 -->
		<c:import url="/admin/header.jsp"></c:import>
	</header>

	<div class="am-cf admin-main">
		<!--侧边导航条 -->
		<c:import url="/admin/aside.jsp"></c:import>

		<div class=" admin-content">

			<div class="daohang">
				<ul>
				</ul>
			</div>

			<div class="admin">

				<div class="admin-index">
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
						<dt class="qs">
							<i class="am-icon-users"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">团队数量</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
						<dt class="cs">
							<i class="am-icon-area-chart"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">今日收入</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
						<dt class="hs">
							<i class="am-icon-shopping-cart"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">商品数量</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 900}">
						<dt class="ls">
							<i class="am-icon-cny"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">全部收入</dd>
					</dl>
				</div>
				<div class="admin-biaoge">
					<div class="xinxitj">信息概况</div>
					<table class="am-table">
						<thead>
							<tr>
								<th>团队统计</th>
								<th>全部会员</th>
								<th>全部未激活</th>
								<th>今日新增</th>
								<th>今日未激活</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>普卡</td>
								<td>普卡</td>
								<td><a href="#">4534</a>
								</td>
								<td>+20</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>银卡</td>
								<td>银卡</td>
								<td>4534</td>
								<td>+2</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>金卡</td>
								<td>金卡</td>
								<td>4534</td>
								<td>+10</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>钻卡</td>
								<td>钻卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>合计</td>
								<td>合计</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
						</tbody>
					</table>
					<table class="am-table">
						<thead>
							<tr>
								<th>团队统计</th>
								<th>全部会员</th>
								<th>全部未激活</th>
								<th>今日新增</th>
								<th>今日未激活</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>普卡</td>
								<td>普卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>银卡</td>
								<td>银卡</td>
								<td>4534</td>
								<td>+2</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>金卡</td>
								<td>金卡</td>
								<td>4534</td>
								<td>+10</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>钻卡</td>
								<td>钻卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>合计</td>
								<td>合计</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
						</tbody>
					</table>
					<table class="am-table">
						<thead>
							<tr>
								<th>资金统计</th>
								<th>账户总收入</th>
								<th>账户总支出</th>
								<th>账户余额</th>
								<th>今日收入</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>普卡</td>
								<td>普卡</td>
								<td>4534</td>
								<td>+20</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>银卡</td>
								<td>银卡</td>
								<td>4534</td>
								<td>+2</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>金卡</td>
								<td>金卡</td>
								<td>4534</td>
								<td>+10</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>钻卡</td>
								<td>钻卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>合计</td>
								<td>合计</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="shuju">
					<div class="shujuone">
						<dl>
							<dt>全盘收入： 1356666</dt>
							<dt>全盘支出： 5646465.98</dt>
							<dt>全盘利润： 546464</dt>
						</dl>
						<ul>
							<h2>26.83%</h2>
							<li>全盘拨出</li>
						</ul>
					</div>
					<div class="shujutow">
						<dl>
							<dt>全盘收入： 1356666</dt>
							<dt>全盘支出： 5646465.98</dt>
							<dt>全盘利润： 546464</dt>
						</dl>
						<ul>
							<h2>26.83%</h2>
							<li>全盘拨出</li>
						</ul>
					</div>
					<div class="slideTxtBox">
						<div class="hd">
							<ul>
								<li>其他信息</li>
								<li>工作进度表</li>
							</ul>
						</div>
						<div class="bd">
							<ul>
								<table width="100%" class="am-table">
									<tbody>
										<tr>
											<td width="7%" align="center">1</td>
											<td width="83%">工作进度名称</td>
											<td width="10%" align="center"><a href="#">10%</a>
											</td>
										</tr>
										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>
										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>
										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

									</tbody>
								</table>
							</ul>
							<ul>
								<table class="am-table">
									<tbody>
										<tr>
											<td>普卡</td>
											<td>普卡</td>
											<td><a href="#">4534</a>
											</td>
											<td>+20</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>银卡</td>
											<td>银卡</td>
											<td>4534</td>
											<td>+2</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>金卡</td>
											<td>金卡</td>
											<td>4534</td>
											<td>+10</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>钻卡</td>
											<td>钻卡</td>
											<td>4534</td>
											<td>+50</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>合计</td>
											<td>合计</td>
											<td>4534</td>
											<td>+50</td>
											<td>4534</td>
										</tr>
									</tbody>
								</table>
							</ul>
						</div>
					</div>
					<script type="text/javascript">
						jQuery(".slideTxtBox").slide();
					</script>


				</div>

				<div class="foods">
					<ul>版权所有@2017
					</ul>
					<dl>
						<a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
					</dl>
				</div>

			</div>

		</div>
	</div>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<c:url value='/assets/js/polyfill/rem.min.js'/>"></script>
<script src="<c:url value='/assets/js/polyfill/respond.min.js'/>"></script>
<script src="<c:url value='/assets/js/amazeui.legacy.js'/>"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="<c:url value='/assets/js/amazeui.min.js'/>"></script>
	<!--<![endif]-->



</body>
</html>