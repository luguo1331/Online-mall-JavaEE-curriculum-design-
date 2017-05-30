package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.CartItem;
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

	public String pay(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
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
		return "f:/jsps/cart/list.jsp";
	}
}
