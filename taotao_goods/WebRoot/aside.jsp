<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<ul>
	<li class="person"><a href="<c:url value='/person/index.jsp'/>">个人中心</a></li>
	<li class="person"><a href="#">个人资料</a>
		<ul>
			<li><a href="<c:url value='/person/information.jsp'/>">个人信息</a>
			</li>
			<li><a href="<c:url value='/person/safety.jsp'/>">安全设置</a>
			</li>
			<li class="active"><a href="<c:url value='/person/address.jsp'/>">收货地址</a>
			</li>
		</ul></li>
	<li class="person"><a href="#">我的交易</a>
		<ul>
			<li><a href="<c:url value='/OrderServlet?method=myOrders'/>">订单管理</a>
			</li>
			<li><a href="<c:url value='/OrderServlet?method=refundOrders'/>">退款售后</a>
			</li>
		</ul></li>
	<li class="person"><a href="#">我的资产</a>
		<ul>
			<li><a href="<c:url value='/person/coupon.jsp'/>">优惠券 </a>
			</li>
			<li><a href="<c:url value='/person/bonus.jsp'/>">红包</a>
			</li>
			<li><a href="<c:url value='/person/bill.jsp'/>">账单明细</a>
			</li>
		</ul></li>

	<li class="person"><a href="#">我的小窝</a>
		<ul>
			<li><a href="<c:url value='/person/collection.jsp'/>">收藏</a>
			</li>
			<li><a href="<c:url value='/person/foot.jsp'/>">足迹</a>
			</li>
			<li><a href="<c:url value='/person/comment.jsp'/>">评价</a>
			</li>
			<li><a href="<c:url value='/person/news.jsp'/>">消息</a>
			</li>
		</ul></li>

</ul>
