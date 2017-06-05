<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<ul>
	<li class="person"><a href="index.html">个人中心</a></li>
	<li class="person"><a href="#">个人资料</a>
		<ul>
			<li><a href="information.html">个人信息</a>
			</li>
			<li><a href="safety.html">安全设置</a>
			</li>
			<li class="active"><a href="address.html">收货地址</a>
			</li>
		</ul></li>
	<li class="person"><a href="#">我的交易</a>
		<ul>
			<li><a href="<c:url value='/OrderServlet?method=myOrders'/>">订单管理</a>
			</li>
			<li><a href="change.html">退款售后</a>
			</li>
		</ul></li>
	<li class="person"><a href="#">我的资产</a>
		<ul>
			<li><a href="coupon.html">优惠券 </a>
			</li>
			<li><a href="bonus.html">红包</a>
			</li>
			<li><a href="bill.html">账单明细</a>
			</li>
		</ul></li>

	<li class="person"><a href="#">我的小窝</a>
		<ul>
			<li><a href="collection.html">收藏</a>
			</li>
			<li><a href="foot.html">足迹</a>
			</li>
			<li><a href="comment.html">评价</a>
			</li>
			<li><a href="news.html">消息</a>
			</li>
		</ul></li>

</ul>
