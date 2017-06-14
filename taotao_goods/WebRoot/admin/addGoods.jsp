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
<title>添加商品</title>
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
<script type="text/javascript">
	$(function() {

		$("#btn").click(
				function() {
					var gname = $("#gname").val();
					var currPrice = $("#currPrice").val();
					var price = $("#price").val();
					var discount = $("#discount").val();
					var author = $("#author").val();
					var press = $("#press").val();
					var pid = $("#pid").val();
					var cid = $("#cid").val();
					var image_w = $("#image_w").val();
					var image_b = $("#image_b").val();

					if (!bname || !currPrice || !price || !discount || !author
							|| !press || !pid || !cid || !image_w || !image_b) {
						alert("图名、当前价、定价、折扣、作者、出版社、1级分类、2级分类、大图、小图都不能为空！");
						return false;
					}

					if (isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
						alert("当前价、定价、折扣必须是合法小数！");
						return false;
					}
					$("#form").submit();
				});
	});

	function loadChildren() {
		/*
		1. 获取pid
		2. 发出异步请求，功能之：
		  3. 得到一个数组
		  4. 获取cid元素(<select>)，把内部的<option>全部删除
		  5. 添加一个头（<option>请选择2级分类</option>）
		  6. 循环数组，把数组中每个对象转换成一个<option>添加到cid中
		 */
		// 1. 获取pid
		var pid = $("#pid").val();
		// 2. 发送异步请求
		$.ajax({
			async : true,
			cache : false,
			url : "/taotao_goods/GoodsServlet",
			data : {
				method : "ajaxFindChildren",
				pid : pid
			},
			type : "POST",
			dataType : "json",
			success : function(arr) {
				// 3. 得到cid，删除它的内容
				$("#cid").empty();//删除元素的子元素
				$("#cid").append($("<option>====请选择2级分类====</option>"));//4.添加头
				// 5. 循环遍历数组，把每个对象转换成<option>添加到cid中
				for ( var i = 0; i < arr.length; i++) {
					var option = $("<option>").val(arr[i].cid).text(
							arr[i].cname);
					$("#cid").append(option);
				}
			}
		});
	}
</script>
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




			<div class="admin-biaogelist">

				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">栏目名称
					</ul>

					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">商品列表</a>
					</dl>



				</div>

				<div class="fbneirong">
					<form class="am-form" action="<c:url value=''/>">
						<div class="am-form-group am-cf">
							<div class="zuo">名字：</div>
							<div class="you">
								<input type="text" class="am-input-sm" id="gname" 
									name="gname" placeholder="请输入名字">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">大图：</div>
							<div class="you">
								<input id="image_1" type="file" name="image_1" />
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">小图1：</div>
							<div class="you">
								<input id="image_2" type="file" name="image_2" />
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">小图2：</div>
							<div class="you">
								<input id="image_3" type="file" name="image_3" />
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">小图3：</div>
							<div class="you">
								<input id="image_4" type="file" name="image_4" />
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">当前价格：</div>
							<div class="you">
								<input type="text" class="am-input-sm" id="doc-ipt-pwd-1"
									name="price" placeholder="请输入当前价">
							</div>
						</div>


						<div class="am-form-group am-cf">
							<div class="zuo">定价：</div>
							<div class="you">
								<input type="text" class="am-input-sm" id="doc-ipt-pwd-1"
									name="currPrice" placeholder="请输入定价">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">折扣：</div>
							<div class="you">
								<input type="text" class="am-input-sm" id="doc-ipt-pwd-1"
									name="discount" placeholder="请输入折扣">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">库存：</div>
							<div class="you">
								<input type="text" class="am-input-sm" id="doc-ipt-pwd-1"
									name="num" placeholder="请输入库存">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">描述：</div>
							<div class="you">
								<textarea class="" rows="2" id="doc-ta-1" name="press"></textarea>
							</div>
						</div>

						<hr data-am-widget="divider" style=""
							class="am-divider am-divider-default" />

						<div class="am-form-group am-cf">
							<div class="zuo">一级分类：</div>
							<div class="you">
								<select name="cname" id="pid" onchange="loadChildren()">
									<option value="">==请选择1级分类==</option>
									<c:forEach items="${parents }" var="parent">
										<option value="${parent.cid }">${parent.cname }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">二级分类：</div>
							<div class="you">
								<select name="cid" id="cid">
									<option value="">==请选择2级分类==</option>
								</select>
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">产品类型：</div>
							<div class="you">
								<select>
									<option value="1" selected='selected'>中式糕点</option>
									<option value="2">西式糕点</option>
								</select>
							</div>
						</div>


						<div class="am-form-group am-cf">
							<div class="you" style="margin-left: 11%;">
								<button type="submit"  id="btn"class="am-btn am-btn-success am-radius">
									&nbsp; &nbsp;&nbsp; &nbsp;发布 &nbsp; &nbsp;&nbsp; &nbsp;</button>
								&nbsp; &raquo; &nbsp;
							</div>
						</div>
					</form>
				</div>


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