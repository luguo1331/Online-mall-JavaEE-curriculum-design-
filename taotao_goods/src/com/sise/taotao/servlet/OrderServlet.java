package com.sise.taotao.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.CartItem;
import com.sise.taotao.domain.Order;
import com.sise.taotao.domain.OrderItem;
import com.sise.taotao.domain.PageBean;
import com.sise.taotao.domain.User;
import com.sise.taotao.service.CartTtemService;
import com.sise.taotao.service.OrderService;

/*
 * 类名称: OrderServlet   
 * 类描述: 订单模块WEB层              
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-6-3 下午5:17:58 
 * 修改备注:
 * @version 1.0.0
 */
public class OrderServlet extends BaseServlet {
	private OrderService orderService = new OrderService();
	private CartTtemService cartTtemService = new CartTtemService();

	/**
	 * 生成订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String createOrder(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取cartItemIds，然后查询
		String cartItemIds = req.getParameter("cartItemIds");
		List<CartItem> cartItemList = cartTtemService
				.loadCartItems(cartItemIds);

		User owner = (User) req.getSession().getAttribute("sessionUser");

		// 创建Order
		Order order = new Order();
		order.setOid(CommonUtils.uuid());
		order.setStatus(1);// 订单状态：1未付款, 2已付款但未发货, 3已发货未确认收货, 4确认收货了交易成功,
		// 5已取消(只有未付款才能取消)
		order.setOrdertime(String.format("%tF %<tT", new Date()));
		order.setAddress(owner.getAddressList().get(0).getProvincial() + " "
				+ owner.getAddressList().get(0).getCity() + " "
				+ owner.getAddressList().get(0).getDistric() + " "
				+ owner.getAddressList().get(0).getDetailedAddress());
		order.setOwner(owner);
		BigDecimal total = new BigDecimal("0");
		for (CartItem cartItem : cartItemList) {
			total = total.add(new BigDecimal(cartItem.getSubtotal() + ""));
		}
		order.setTotal(total.doubleValue());// 设置总计

		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for (CartItem cartItem : cartItemList) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemId(CommonUtils.uuid());
			orderItem.setGoods(cartItem.getGoods());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setOrder(order);
			orderItemList.add(orderItem);
		}

		order.setOrderItemList(orderItemList);
		// 调用service完成添加
		orderService.createOrder(order);

		// 删除购物车条目
		cartTtemService.batchDelete(cartItemIds);
		req.setAttribute("order", order);
		return "f:/home/success.jsp";
	}

	/**
	 * 取消订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if (status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能取消！");
			return "f:/person/order.jsp";
		}
		orderService.updateStatus(oid, 5);// 设置状态为取消！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已取消，您不后悔吗！");
		return myOrders(req, resp);
	}

	/**
	 * 确认收货
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String confirm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if (status != 3) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能确认收货！");
			return "f:/jsps/msg.jsp";
		}
		orderService.updateStatus(oid, 4);// 设置状态为交易成功！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "恭喜，交易成功！");
		return myOrders(req, resp);
	}

	/**
	 * 我的订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myOrders(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 从当前session中获取User
		 */
		User user = (User) req.getSession().getAttribute("sessionUser");

		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		PageBean<Order> pb = orderService.myOrders(user.getUid(), pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/person/order.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/person/order.jsp";
	}

	/**
	 * 退款售后
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String refundOrders(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 从当前session中获取User
		 */
		User user = (User) req.getSession().getAttribute("sessionUser");

		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		PageBean<Order> pb = orderService.myOrders(user.getUid(), pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/person/order.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/person/change.jsp";
	}

	/**
	 * 获取当前页码
	 * 
	 * @param req
	 * @return
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if (param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch (RuntimeException e) {
			}
		}
		return pc;
	}

	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 * 
	 * @param req
	 * @return
	 */
	/*
	 * http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
	 * /goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index = url.lastIndexOf("&pc=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}

}
