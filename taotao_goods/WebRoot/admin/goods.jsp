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
<title>商品管理</title>
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

<link href="<c:url value='/css/personal.css" rel="stylesheet'/>"
	type="text/css">
<link href="<c:url value='/css/orstyle.css" rel="stylesheet'/>"
	type="text/css">
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
		说
		<div class=" admin-content">
			<div class="daohang"></div>
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
								<label class="am-checkbox-inline"> <input
									type="checkbox" value="option1"> 显示 </label> <label
									class="am-checkbox-inline"> <input type="checkbox"
									value="option2"> 隐藏 </label>
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
								<label class="am-checkbox-inline"> <input
									type="checkbox" value="option1"> 显示 </label> <label
									class="am-checkbox-inline"> <input type="checkbox"
									value="option2"> 隐藏 </label>
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






			<div class="am-popup am-popup-inner" id="my-popupss">
				<div class="am-popup-hd">
					<h4 class="am-popup-title">复制栏目</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>
				<div class="am-popup-bd">
					<form class="am-form tjlanmu">


						<div class="am-form-group">
							<div class="zuo">复制到：</div>
							<div class="you">

								<select
									data-am-selected="{btnWidth: 200, btnSize: 'sm', btnStyle: 'danger'}">
									<option value="a">Apple</option>
									<option value="b">Banana</option>
									<option value="o">Orange</option>
									<option value="m">Mango</option>
								</select> 顶级栏目选默认

							</div>
						</div>


						<div class="am-form-group">
							<div class="zuo">新栏目名称：</div>
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
								<label class="am-checkbox-inline"> <input
									type="checkbox" value="option1"> 显示 </label> <label
									class="am-checkbox-inline"> <input type="checkbox"
									value="option2"> 隐藏 </label>
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
					<ul class="am-icon-flag on">商品栏目管理
					</ul>
					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">商品列表</a>
					</dl>
					<dl>
						<button type="button"
							class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus"
							data-am-modal="{target: '#my-popup'}">添加商品一级分类</button>
					</dl>
					<!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束-->

				</div>
				<form class="am-form am-g">

					<div class="order-top">
						<div class="th th-item">
							<td class="td-inner">商品</td>
						</div>
						<div class="th th-price">
							<td class="td-inner">单价</td>
						</div>
						<div class="th th-number">
							<td class="td-inner">库存</td>
						</div>
						<div class="th th-number">
							<td class="td-inner">状态</td>
						</div>
						<div class="th th-change">
							<td class="td-inner">交易操作</td>
						</div>
					</div>

					<div class="order-main">
						<div class="order-list">
							<!--交易成功-->
							<div class="order-status5">
								<div class="order-content">
									<div class="order-left">
										<c:forEach items="${pb.beanList }" var="goods">
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint"> <img
															src="${goods.image_4}" class="itempic J_ItemImg"> </a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${goods.gname}</p>
																<p class="info-little">
																	<br />${goods.gid}
																</p> </a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">${goods.currPrice}0</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span></span>${goods.num}
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<c:choose>
															<c:when test="${goods.num <= 0 }">
																<p class="Mystatus">已下架</p>
															</c:when>
															<c:otherwise>
																<p class="Mystatus">在售</p>
															</c:otherwise>
														</c:choose>
													</div>
												</li>
												<li class="td td-operation">
													<div class="am-btn-group am-btn-group-xs">
														<c:choose>
															<c:when test="${goods.num <= 0 }">
																<button type="button" class="am-btn am-btn-default">
																	<span class="am-icon-save"></span> 上架
																</button>
															</c:when>
															<c:otherwise>
																<button type="button" class="am-btn am-btn-default">
																	<a class="am-icon-save" href="<c:url value='/GoodsServlet?method=updateNum&gid=${goods.gid}'/>"></a> 下架
																</button>
															</c:otherwise>
														</c:choose>
														<button type="button" class="am-btn am-btn-default">
															<span class="am-icon-trash-o"></span> 修改
														</button>
													</div></li>
											</ul>
										</c:forEach>
									</div>
								</div>
							</div>

						</div>
					</div>


					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-save"></span> 上架
						</button>
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-save"></span> 下架
						</button>
						<button type="button" class="am-btn am-btn-default">
							<a class="am-icon-plus" href="<c:url value='/GoodsServlet?method=add'/>">新增</a> 
						</button>
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-trash-o"></span> 删除
						</button>
					</div>
					<c:import url="/pager.jsp"></c:import>
					<hr />
					<p></p>
				</form>

				<div class="foods">
					<ul>版权所有@2015
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
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/amazeui.min.js"></script>
	<!--<![endif]-->

</body>
</html>