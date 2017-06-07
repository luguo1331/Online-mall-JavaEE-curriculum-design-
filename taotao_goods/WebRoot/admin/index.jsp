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

		<div class="nav-navicon admin-main admin-sidebar">


			<div class="sideMenu am-icon-dashboard"
				style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：清风抚雪</div>
			<div class="sideMenu">
				<h3 class="am-icon-flag">
					<em></em> <a href="#">商品管理</a>
				</h3>
				<ul>
					<li><a href="">商品列表</a>
					</li>
					<li class="func" dataType='html' dataLink='msn.htm'
						iconImg='images/msn.gif'>添加新商品</li>
					<li>商品分类</li>
					<li>用户评论</li>
					<li>商品回收站</li>
					<li>库存管理</li>
				</ul>
				<h3 class="am-icon-cart-plus">
					<em></em> <a href="#"> 订单管理</a>
				</h3>
				<ul>
					<li>订单列表</li>
					<li>合并订单</li>
					<li>订单打印</li>
					<li>添加订单</li>
					<li>发货单列表</li>
					<li>换货单列表</li>
				</ul>
				<h3 class="am-icon-users">
					<em></em> <a href="#">会员管理</a>
				</h3>
				<ul>
					<li>会员列表</li>
					<li>未激活会员</li>
					<li>团队系谱图</li>
					<li>会员推荐图</li>
					<li>推荐列表</li>
				</ul>
				<h3 class="am-icon-volume-up">
					<em></em> <a href="#">信息通知</a>
				</h3>
				<ul>
					<li>站内消息 /留言</li>
					<li>短信</li>
					<li>邮件</li>
					<li>微信</li>
					<li>客服</li>
				</ul>
				<h3 class="am-icon-gears">
					<em></em> <a href="#">系统设置</a>
				</h3>
				<ul>
					<li>数据备份</li>
					<li>邮件/短信管理</li>
					<li>上传/下载</li>
					<li>权限</li>
					<li>网站设置</li>
					<li>第三方支付</li>
					<li>提现 /转账 出入账汇率</li>
					<li>平台设置</li>
					<li>声音文件</li>
				</ul>
			</div>
			<!-- sideMenu End -->

			<script type="text/javascript">
				jQuery(".sideMenu").slide({
					titCell : "h3", //鼠标触发对象
					targetCell : "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
					effect : "slideDown", //targetCell下拉效果
					delayTime : 300, //效果时间
					triggerTime : 150, //鼠标延迟触发时间（默认150）
					defaultPlay : true,//默认是否执行效果（默认true）
					returnDefault : true
				//鼠标从.sideMen移走后返回默认状态（默认false）
				});
			</script>








		</div>

		<div class=" admin-content">

			<div class="daohang">
				<ul>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">首页
					</li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							帮助中心<a href="javascript: void(0)" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button>
					</li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							奖金管理<a href="javascript: void(0)" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button>
					</li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							产品管理<a href="javascript: void(0)" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button>
					</li>


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