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

<title>个人资料</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$('#doc-datepicker').datepicker().on('changeDate.datepicker.amui',
				function(event) {
					console.log(event.date);
				});
	});
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

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic">

						<div class="filePic">
							<input type="file" class="inputPic"
								allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"> <img
								class="am-circle am-img-thumbnail"
								src="../images/getAvatar.do.jpg" alt="" />
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>用户名：<i>${sessionScope.sessionUser.loginname}</i> </b>
							</div>
							<div class="u-level">
								<span class="rank r2"> <s class="vip1"></s><a
									class="classes" href="#">铜牌会员</a> </span>
							</div>
							<div class="u-safety">
								<a href="safety.html"> 账户安全 <span class="u-profile"><i
										class="bc_ee0000" style="width: 60px;" width="0">60分</i> </span> </a>
							</div>
						</div>
					</div>

					<!--个人信息 -->
					<div class="info-main">
						<form class="am-form am-form-horizontal"
							action="<c:url value='/UserServlet'/>" method="post" id="form1">
							<input type="hidden" name="method" value="updateMessage"
								id="method" />
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">昵称</label>
								<div class="am-form-content">
									<c:choose>
										<c:when test="${empty sessionScope.sessionUser.nickname}">
											<input type="text" id="user-name2" placeholder="昵称"
												name="nickname">
										</c:when>
										<c:otherwise>
											<input type="text" id="user-name2"
												placeholder="${sessionScope.sessionUser.nickname}"
												name="nickname" value="${sessionScope.sessionUser.nickname}"/>
										</c:otherwise>
									</c:choose>

								</div>
							</div>

							<div class="am-form-group">
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<label class="am-radio-inline"> <input type="radio"
										name="radio10" value="male" data-am-ucheck checked="checked">
										男 </label> <label class="am-radio-inline"> <input type="radio"
										name="radio10" value="female" data-am-ucheck> 女 </label> <label
										class="am-radio-inline"> <input type="radio"
										name="radio10" value="secret" data-am-ucheck> 保密 </label>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-birth" class="am-form-label">生日</label>
								<div class="am-form-content birth">
									<c:choose>
										<c:when test="${empty sessionScope.sessionUser.birthday}">
											<input type="text" class="am-form-field" placeholder="生日"
												id="doc-datepicker" name="birthday">
										</c:when>
										<c:otherwise>
											<input type="text" class="am-form-field"
												placeholder="${sessionScope.sessionUser.birthday}"
												name="birthday" value="${sessionScope.sessionUser.birthday}" />
										</c:otherwise>
									</c:choose>

								</div>

							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">电话</label>
								<div class="am-form-content">
									<c:choose>
										<c:when test="${empty sessionScope.sessionUser.phone}">
											<input id="user-phone" placeholder="电话号码" name="phone"
												type="tel">
										</c:when>
										<c:otherwise>
											<input id="user-phone"
												placeholder="${sessionScope.sessionUser.phone}" name="phone"
												type="tel" value="${sessionScope.sessionUser.phone}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<c:choose>
										<c:when test="${empty sessionScope.sessionUser.email}">
											<input id="user-email" placeholder="邮箱" type="email"
												name="email">
										</c:when>
										<c:otherwise>
											<input id="user-email"
												placeholder="${sessionScope.sessionUser.email}" type="email"
												name="email" value="${sessionScope.sessionUser.email}">
										</c:otherwise>
									</c:choose>


								</div>
							</div>
							<div class="am-form-group address">
								<label for="user-address" class="am-form-label">收货地址</label>
								<div class="am-form-content address">
									<a href="address.html">
										<p class="new-mu_l2cw">
											<span class="province">湖北</span>省 <span class="city">武汉</span>市
											<span class="dist">洪山</span>区 <span class="street">雄楚大道666号(中南财经政法大学)</span>
											<span class="am-icon-angle-right"></span>
										</p> </a>

								</div>
							</div>
							<div class="am-form-group safety">
								<label for="user-safety" class="am-form-label">账号安全</label>
								<div class="am-form-content safety">
									<a href="safety.html"> <span class="am-icon-angle-right"></span>

									</a>

								</div>
							</div>
							<div class="info-btn">
								<div class ="am-btn am-btn-danger" id="submit">保存修改
							</div>
					</div>

					</form>
				</div>

			</div>

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