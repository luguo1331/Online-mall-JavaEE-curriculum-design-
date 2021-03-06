package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.CartItem;
import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.User;
import com.sise.taotao.service.CartTtemService;

/*
 * 类名称: CartItemServlet   
 * 类描述: 订单项模块WEB层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-30 下午7:58:49 
 * 修改备注:
 * @version 1.0.0
 */
public class CartItemServlet extends BaseServlet {
	private CartTtemService cartTtemService = new CartTtemService();

	/**
	 * 立即购买
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String pay(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 得到表单数据并封装
		Map map = req.getParameterMap();
		CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
		System.out.println(cartItem);
		cartItem.setGoods(CommonUtils.toBean(map, Goods.class));
		cartItem.setUser((User) req.getSession().getAttribute("sessionUser"));
		cartTtemService.add(cartItem);
		return myCart(req, resp);
	}

	/**
	 * 加入购物车
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addShop(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 得到表单数据并封装
		Map map = req.getParameterMap();
		CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
		cartItem.setGoods(CommonUtils.toBean(map, Goods.class));
		cartItem.setUser((User) req.getSession().getAttribute("sessionUser"));
		cartTtemService.add(cartItem);
		return myCart2(req, resp);
	}

	/**
	 * 加载多个cartItem
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loadCartItems(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获得表单数据
		String cartItemIds = req.getParameter("cartItemIds");
		double total = Double.parseDouble(req.getParameter("total"));
		// 通过service得到当前用户的List<CartItem>
		List<CartItem> cartItemList = cartTtemService
				.loadCartItems(cartItemIds);
		// 保存到req中，然后转发到/home/payh.jsp
		req.setAttribute("cartItemList", cartItemList);
		req.setAttribute("total", total);
		req.setAttribute("cartItemIds", cartItemIds);
		return "f:/home/pay.jsp";
	}

	/**
	 * 我的购物车
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myCart(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到uid
		 */
		User user = (User) req.getSession().getAttribute("sessionUser");
		String uid = user.getUid();
		/*
		 * 2. 通过service得到当前用户的所有购物车条目
		 */
		List<CartItem> cartItemLIst = cartTtemService.myCart(uid);
		/*
		 * 3. 保存起来，转发到/cart/list.jsp
		 */
		req.setAttribute("cartItemList", cartItemLIst);
		return "f:/home/pay.jsp";
	}

	/**
	 * 购物车
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myCart2(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到uid
		 */
		User user = (User) req.getSession().getAttribute("sessionUser");
		String uid = user.getUid();
		/*
		 * 2. 通过service得到当前用户的所有购物车条目
		 */
		List<CartItem> cartItemLIst = cartTtemService.myCart(uid);
		/*
		 * 3. 保存起来，转发到/cart/shopcart.jsp
		 */
		req.setAttribute("cartItemList", cartItemLIst);
		return "f:/home/shopcart.jsp";
	}

	/**
	 * 删除订单项
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String batchDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取cartItemIds参数 2. 调用service方法完成工作 3. 返回到list.jsp
		 */
		String cartItemIds = req.getParameter("cartItemIds");
		cartTtemService.batchDelete(cartItemIds);
		return myCart(req, resp);
	}

	/**
	 * 异步查询库存
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateQuantity(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String cartItemId = req.getParameter("cartItemId");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		CartItem cartItem = cartTtemService
				.updateQuantity(cartItemId, quantity);

		// 给客户端返回一个json对象
		StringBuilder sb = new StringBuilder("{");
		sb.append("\"quantity\"").append(":").append(cartItem.getQuantity());
		sb.append(",");
		sb.append("\"subtotal\"").append(":").append(cartItem.getSubtotal());
		sb.append("}");

		resp.getWriter().print(sb);
		return null;
	}
}
