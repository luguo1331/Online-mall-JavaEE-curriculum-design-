package com.sise.taotao.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.Order;
import com.sise.taotao.domain.OrderItem;

/*
 * 类名称: OrderDao   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-30 下午9:07:59 
 * 修改备注:
 * @version 1.0.0
 */
public class OrderDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 生成订单
	 * @param order
	 * @throws SQLException
	 */
	public void add(Order order) throws SQLException {
		/*
		 * 1. 插入订单
		 */
		String sql = "INSERT INTO t_order VALUES(?,?,?,?,?,?)";
		Object[] params = { order.getOid(), order.getOrdertime(),
				order.getTotal(), order.getStatus(), order.getAddress(),
				order.getOwner().getUid() };
		qr.update(sql, params);

		/*
		 * 2. 循环遍历订单的所有条目,让每个条目生成一个Object[] 多个条目就对应Object[][] 执行批处理，完成插入订单条目
		 */
		sql = "INSERT INTO t_orderitem VALUES(?,?,?,?,?,?,?,?)";
		int len = order.getOrderItemList().size();
		Object[][] objs = new Object[len][];
		for (int i = 0; i < len; i++) {
			OrderItem item = order.getOrderItemList().get(i);
			objs[i] = new Object[] { item.getOrderItemId(), item.getQuantity(),
					item.getSubtotal(), item.getGoods().getGid(),
					item.getGoods().getGname(), item.getGoods().getCurrPrice(),
					item.getGoods().getImage_4(), order.getOid() };
		}
		qr.batch(sql, objs);
	}

}
