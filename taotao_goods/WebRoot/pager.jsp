<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<ul class="am-pagination am-fr">
	<%--上一页 --%>
	<c:choose>
		<c:when test="${pb.pc eq 1 }">
			<span class="am-disabled">«</span>
		</c:when>
		<c:otherwise>
			<a href="${pb.url }&pc=${pb.pc-1}" class="aBtn bold">«</a>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${pb.tp <= 6 }">
			<c:set var="begin" value="1" />
			<c:set var="end" value="${pb.tp }" />
		</c:when>
		<c:otherwise>
			<c:set var="begin" value="${pb.pc-2 }" />
			<c:set var="end" value="${pb.pc + 3}" />
			<c:if test="${begin < 1 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="6" />
			</c:if>
			<c:if test="${end > pb.tp }">
				<c:set var="begin" value="${pb.tp-5 }" />
				<c:set var="end" value="${pb.tp }" />
			</c:if>
		</c:otherwise>
	</c:choose>

	<c:forEach begin="${begin }" end="${end }" var="i">
		<c:choose>
			<c:when test="${i eq pb.pc }">
				<li class="am-active">${i }</li>
			</c:when>
			<c:otherwise>
				<li><a href="${pb.url }&pc=${i}" class="aBtn">${i }</a></li>
			</c:otherwise>
		</c:choose>


	</c:forEach>

	<%--下一页 --%>
	<c:choose>
		<c:when test="${pb.pc eq pb.tp }">
			<li>»</li>
		</c:when>
		<c:otherwise>
			<li><a href="${pb.url }&pc=${pb.pc+1}" >»</a></li>
		</c:otherwise>
	</c:choose>
</ul>
