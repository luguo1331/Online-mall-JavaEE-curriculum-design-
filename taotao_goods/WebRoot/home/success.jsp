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
<title>付款成功页面</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='../AmazeUI-2.4.2/assets/css/amazeui.css'/>" />
<link
	href="<c:url value='../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet'/>"
	type="text/css">
<link
	href="<c:url value='../basic/css/demo.css" rel="stylesheet" type="text/css'/>" />

<link
	href="<c:url value='../css/sustyle.css" rel="stylesheet" type="text/css'/>" />
<script type="text/javascript"
	src="<c:url value='../basic/js/jquery-1.7.min.js'/>"></script>

</head>

<body>


	<!--顶部导航条 -->
	<div class="am-container header">
		<c:import url="/head.jsp"></c:import>
		<div class="take-delivery">
			<div class="status">
				<h2>您已成功付款</h2>
				<div class="successInfo">
					<ul>
						<li>付款金额<em>¥9.90</em>
						</li>
						<div class="user-info">
							<p>收货人：${sessionScope.sessionUser.loginname}</p>
							<p>联系电话：15871145629</p>
							<p>收货地址：湖北省 武汉市 武昌区 东湖路75号众环大厦</p>
						</div>
						请认真核对您的收货信息，如有错误请联系客服

					</ul>
					<div class="option">
						<span class="info">您可以</span> <a href="../person/order.html"
							class="J_MakePoint">查看<span>已买到的宝贝</span> </a> <a
							href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span>
						</a>
					</div>
				</div>
			</div>
		</div>


		<div class="footer">
			<!-- 底部导航栏 -->
			<c:import url="/footer.jsp"></c:import>
		</div>
</body>
</html>
