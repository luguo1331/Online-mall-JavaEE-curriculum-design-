package com.sise.taotao.service;

import java.sql.SQLException;

import cn.itcast.jdbc.JdbcUtils;

import com.sise.taotao.dao.OrderDao;
import com.sise.taotao.domain.Order;
import com.sise.taotao.domain.PageBean;

/*
 * 类名称: OrderService   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-6-3 下午5:32:11 
 * 修改备注:
 * @version 1.0.0
 */
public class OrderService {
	private OrderDao orderDao = new OrderDao();

	/**
	 * 生成订单
	 * 
	 * @param order
	 */
	public void createOrder(Order order) {
		try {
			JdbcUtils.beginTransaction();
			orderDao.add(order);
			JdbcUtils.commitTransaction();
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				throw new RuntimeException(e1);
			}
		}
	}

	/**
	 * 我的订单
	 * 
	 * @param uid
	 * @param pc
	 * @return
	 */
	public PageBean<Order> myOrders(String uid, int pc) {
		try {
			JdbcUtils.beginTransaction();
			PageBean<Order> pb = orderDao.findByUser(uid, pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}
}
