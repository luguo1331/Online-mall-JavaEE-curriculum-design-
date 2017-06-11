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
<title>用户管理</title>
<meta name="description" content="这是一个 index 页面">
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
					</button></li>
				<li><button type="button"
						class="am-btn am-btn-default am-radius am-btn-xs">
						奖金管理<a href="javascript: void(0)" class="am-close am-close-spin"
							data-am-modal-close="">×</a>
					</button></li>
				<li><button type="button"
						class="am-btn am-btn-default am-radius am-btn-xs">
						产品管理<a href="javascript: void(0)" class="am-close am-close-spin"
							data-am-modal-close="">×</a>
					</button></li>


			</ul>




		</div>


		<div class="am-popup am-popup-inner" id="my-popup">

			<div class="am-popup-hd">
				<h4 class="am-popup-title">添加商品一级分类</h4>
				<span data-am-modal-close class="am-close">&times;</span>
			</div>

			<div class="am-popup-bd">


				<form class="am-form tjlanmu">


					<div class="am-form-group">
						<div class="zuo">栏目名称：</div>
						<div class="you">
							<input type="email" class="am-input-sm" id="doc-ipt-email-1"
								placeholder="请输入标题">
						</div>
					</div>
					<div class="am-form-group">
						<div class="zuo">栏目关键词：</div>
						<div class="you">
							<input type="password" class="am-input-sm" id="doc-ipt-pwd-1"
								placeholder="请输入关键词">
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">栏目描述：</div>
						<div class="you">
							<textarea class="" rows="2" id="doc-ta-1"></textarea>
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">栏目图片：</div>
						<div class="you" style="height: 45px;">
							<input type="file" id="doc-ipt-file-1">
							<p class="am-form-help">请选择要上传的文件...</p>
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">简介：</div>
						<div class="you">
							<textarea class="" rows="2" id="doc-ta-1"></textarea>
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">状态：</div>
						<div class="you" style="margin-top: 3px;">
							<label class="am-checkbox-inline"> <input type="checkbox"
								value="option1"> 显示 </label> <label class="am-checkbox-inline">
								<input type="checkbox" value="option2"> 隐藏 </label>

						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="you">
							<p>
								<button type="submit" class="am-btn am-btn-success am-radius">提交</button>
							</p>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="am-popup am-popup-inner" id="my-popups">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">修改栏目名称</h4>
				<span data-am-modal-close class="am-close">&times;</span>
			</div>

			<div class="am-popup-bd">

				<form class="am-form tjlanmu">


					<div class="am-form-group">
						<div class="zuo">栏目名称：</div>
						<div class="you">
							<input type="email" class="am-input-sm" id="doc-ipt-email-1"
								placeholder="请输入标题">
						</div>
					</div>
					<div class="am-form-group">
						<div class="zuo">栏目关键词：</div>
						<div class="you">
							<input type="password" class="am-input-sm" id="doc-ipt-pwd-1"
								placeholder="请输入关键词">
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">栏目描述：</div>
						<div class="you">
							<textarea class="" rows="2" id="doc-ta-1"></textarea>
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">栏目图片：</div>
						<div class="you" style="height: 45px;">
							<input type="file" id="doc-ipt-file-1">
							<p class="am-form-help">请选择要上传的文件...</p>
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">简介：</div>
						<div class="you">
							<textarea class="" rows="2" id="doc-ta-1"></textarea>
						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="zuo">状态：</div>
						<div class="you" style="margin-top: 3px;">
							<label class="am-checkbox-inline"> <input type="checkbox"
								value="option1"> 显示 </label> <label class="am-checkbox-inline">
								<input type="checkbox" value="option2"> 隐藏 </label>

						</div>
					</div>
					<div class="am-form-group am-cf">
						<div class="you">
							<p>
								<button type="submit" class="am-btn am-btn-success am-radius">提交</button>
							</p>
						</div>
					</div>
				</form>

			</div>

		</div>

		<div class="admin-biaogelist">

			<div class="listbiaoti am-cf">
				<ul class="am-icon-users">用户管理
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置： 首页 >
					<a href="#">用户管理</a>
				</dl>

				<dl>
					<button type="button"
						class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">
						手动添加会员</button>
				</dl>
				<!--这里打开的是新页面-->

			</div>

			<form class="am-form am-g">
				<table width="100%"
					class="am-table am-table-bordered am-table-striped am-table-hover am-text-middle">
					<thead>
						<tr class="am-success">
							<th class="table-check"><input type="checkbox" /></th>
							<th class="table-id">ID</th>
							<th class="table-id">用户名称</th>
							<th class="table-type">用户邮箱</th>
							<th class="table-author am-hide-sm-only">用户手机</th>
							<th class="table-author am-hide-sm-only">性别</th>
							<th class="table-date am-hide-sm-only">用户状态</th>
							<th width="130px" class="table-set">操作</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${pb.beanList }" var="user">
							<tr>
								<td><input type="checkbox" /></td>
								<td>${user.uid}</td>
								<td><a href="#">${user.loginname}</a></td>
								<td>${user.email}</td>
								<td class="am-hide-sm-only">${user.phone}</td>
								<td class="am-hide-sm-only">${user.sex}</td>
								<td class="am-hide-sm-only"><c:choose>
										<c:when test="${user.status eq true }">
											<p class="Mystatus">已激活</p>
										</c:when>
										<c:when test="${user.status eq false }">
											<p class="Mystatus">未激活</p>
										</c:when>
									</c:choose>
								</td>
								<td>
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<button
												class="am-btn am-btn-default am-btn-xs am-text-success am-round">
												<span class="am-icon-search" title="查看订单详情"></span>
											</button>
											<button
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除订单">
												<span class="am-icon-trash-o"></span>
											</button>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="am-btn-group am-btn-group-xs">
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 删除
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 上架
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 下架
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 移动
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 新增
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 保存
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-archive"></span> 移动
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-trash-o"></span> 删除
					</button>
				</div>

				<c:import url="/pager.jsp"></c:import>

				<hr />
				<p>注：.....</p>
			</form>

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