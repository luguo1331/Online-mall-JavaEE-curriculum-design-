<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<div class="nav-navicon admin-main admin-sidebar">


	<div class="sideMenu am-icon-dashboard"
		style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：清风抚雪</div>
	<div class="sideMenu">
		<h3 class="am-icon-flag">
			<em></em> <a href="<c:url value='/GoodsServlet?method=findAll'/>">商品管理</a>
		</h3>
		<ul>
			<li><a href="">商品列表</a>
			</li>
			<li class="func" dataType='html' dataLink='msn.htm'
				iconImg='images/msn.gif'></li>
			<li><a href="<c:url value='/GoodsServlet?method=add'/>">新增商品</a>
			</li>
			<li>用户评论</li>
			<li>商品回收站</li>
			<li>库存管理</li>
		</ul>
		<h3 class="am-icon-cart-plus">
			<em></em><a href="<c:url value='/OrderServlet?method=findAll'/>">订单管理</a>
		</h3>
		<ul>
			<li><a href="<c:url value='/OrderServlet?method=findAll'/>">订单列表</a></li>
			<li>合并订单</li>
			<li>订单打印</li>
			<li>添加订单</li>
			<li>发货单列表</li>
			<li>换货单列表</li>
		</ul>
		<h3 class="am-icon-users">
			<em></em> <a href="<c:url value='/UserServlet?method=findAll'/>">用户管理</a>
		</h3>
		<ul>
			<li><a href="<c:url value='/UserServlet?method=findAll'/>">用户列表</a></li>
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

