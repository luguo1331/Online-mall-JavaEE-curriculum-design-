<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="am-topbar-brand">
	<img src="<c:url value='/assets/i/logo.png'/>">
</div>
<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
	<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
		<li class="am-dropdown tognzhi" data-am-dropdown>
			<button
				class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o"
				data-am-dropdown-toggle>
				消息管理<span class="am-badge am-badge-danger am-round">6</span>
			</button>
			<ul class="am-dropdown-content">
				<li class="am-dropdown-header">所有消息都在这里</li>
				<li><a href="#">未激活会员 <span
						class="am-badge am-badge-danger am-round">556</span> </a></li>
				<li><a href="#">未激活代理 <span
						class="am-badge am-badge-danger am-round">69</span> </a></a></li>
				<li><a href="#">未处理汇款</a></li>
				<li><a href="#">未发放提现</a></li>
				<li><a href="#">未发货订单</a></li>
				<li><a href="#">低库存产品</a></li>
				<li><a href="#">信息反馈</a></li>
			</ul>
		</li>
		<li class="kuanjie"><a
			href="<c:url value='/UserServlet?method=findAll'/>">用户管理</a> <a
			href="<c:url value='/OrderServlet?method=findAll'/>">订单管理</a> <a
			href="<c:url value='/GoodsServlet?method=findAll'/>">商品管理</a> <a
			href="<c:url value='/CategoryServlet?method=findAll'/>">分类管理</a>
		</li>
		<li class="soso">
			<p>
				<select
					data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
					<option value="b">全部</option>
					<option value="o">产品</option>
					<option value="o">会员</option>
				</select>
			</p>

			<p class="ycfg">
				<input type="text" class="am-form-field am-input-sm"
					placeholder="圆角表单域" />
			</p>
			<p>
				<button class="am-btn am-btn-xs am-btn-default am-xiao">
					<i class="am-icon-search"></i>
				</button>
			</p>
		</li>
		<li class="am-hide-sm-only" style="float: right;"><a
			href="javascript:;" id="admin-fullscreen"><span
				class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span>
		</a></li>
	</ul>
</div>
