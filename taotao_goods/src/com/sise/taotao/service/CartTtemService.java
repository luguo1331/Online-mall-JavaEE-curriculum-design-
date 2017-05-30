package com.sise.taotao.service;

import java.sql.SQLException;
import java.util.List;

import com.sise.taotao.dao.CartItemDao;
import com.sise.taotao.domain.CartItem;

/*
 * 类名称: CartTtemService   
 * 类描述: 订单项模块业务层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-30 下午8:03:56 
 * 修改备注:
 * @version 1.0.0
 */
public class CartTtemService {
	private CartItemDao cartItemDao = new CartItemDao();

	/**
	 * 我的购物车
	 * @param uid
	 * @return
	 */
	public List<CartItem> myCart(String uid) {
		try {
			return cartItemDao.findByUid(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add(CartItem cartItem) {
		
	}

}
