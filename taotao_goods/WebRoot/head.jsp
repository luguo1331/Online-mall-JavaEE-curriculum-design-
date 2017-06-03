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
<head lang="en">
<meta charset="UTF-8">
</head>



<%-- 根据用户是否登录，显示不同的链接 --%>

<c:choose>
	<c:when test="${empty sessionScope.sessionUser }">
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="<c:url value='/home/login.jsp'/>" target="_top" class="h">亲，请登录
							&nbsp;|&nbsp; </a> <a href="<c:url value='/home/register.jsp'/>"
							target="_top">免费注册</a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="<c:url value='/home/home.jsp'/>" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="<c:url value='/home/login.jsp'/>" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="<c:url value='/home/login.jsp'/>"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h"></strong> </a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="<c:url value='/home/login.jsp'/>" target="_top"><i
							class="am-icon-heart am-icon-fw"></i><span>收藏夹</span> </a>
					</div>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						淘淘会员:${sessionScope.sessionUser.loginname}&nbsp;&nbsp;</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="<c:url value='/home/home.jsp'/>" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="<c:url value='/person/index.jsp'/>" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="<c:url value='/CartItemServlet?method=myCart2'/>"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h"></strong> </a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="<c:url value='/person/collection.jsp'/>" target="_top"><i
							class="am-icon-heart am-icon-fw"></i><span>收藏夹</span> </a>
					</div>
			</ul>
		</div>
	</c:otherwise>
</c:choose>
<!--悬浮搜索框-->

<div class="nav white">
	<div class="logoBig">
		<li><img src="<%=path%>/images/logobig.png" />
		</li>
	</div>

	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form action="<c:url value='/GoodsServlet'/>" method="post">
			<input type="hidden" name="method" value="findByGname" /> <input
				id="searchInput" name="index_none_header_sysc" type="text"
				placeholder="搜索" autocomplete="off"> <input
				id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
				type="submit">
		</form>
	</div>
</div>

<div class="clear"></div>
</html>
