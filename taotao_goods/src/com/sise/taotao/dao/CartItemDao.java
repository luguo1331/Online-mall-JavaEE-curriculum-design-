package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.CartItem;
import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.User;

/*
 * 类名称: CartItemDao   
 * 类描述: 订单项模块持久层              
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-30 下午9:07:45 
 * 修改备注:
 * @version 1.0.0
 */
public class CartItemDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 加载多个cartItem
	 * 
	 * @param cartItemIds
	 * @return
	 * @throws SQLException
	 */
	public List<CartItem> loadCartItems(String cartItemIds) throws SQLException {
		// 将cartItemIds转换成数组
		Object[] cartItemIdsArray = cartItemIds.split(",");
		// 生成where子句
		String whereSql = toWhereSql(cartItemIdsArray.length);
		// 生成sql语句
		String sql = "SELECT * FROM t_goods g, t_cartitem c WHERE g.gid=c.gid AND "
				+ whereSql;
		return toCartItems(qr
				.query(sql, new MapListHandler(), cartItemIdsArray));
	}

	/**
	 * 删除订单项
	 * 
	 * @param cartItemIds
	 * @throws SQLException
	 */
	public void batchDelete(String cartItemIds) throws SQLException {
		Object[] cartItemIdArray = cartItemIds.split(",");
		String whereSql = toWhereSql(cartItemIdArray.length);
		String sql = "DELETE FROM t_cartitem WHERE " + whereSql;
		qr.update(sql, cartItemIdArray);
	}

	/**
	 * 根据uid,gid 查询订单项
	 * 
	 * @param uid
	 * @param gid
	 * @return
	 * @throws SQLException
	 */
	public CartItem findByUidAndBid(String uid, String gid) throws SQLException {
		String sql = "SELECT * FROM t_cartitem WHERE uid=? AND gid=?";
		return toCartItem(qr.query(sql, new MapHandler(), uid, gid));
	}

	/**
	 * 根据uid查询订单项
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public List<CartItem> findByUid(String uid) throws SQLException {
		String sql = "SELECT * FROM t_goods g, t_cartitem c WHERE g.gid=c.gid AND c.uid=?";
		return toCartItems(qr.query(sql, new MapListHandler(), uid));
	}

	/**
	 * 添加订单项
	 * 
	 * @param cartItem
	 * @throws SQLException
	 */
	public void addCartItem(CartItem cartItem) throws SQLException {
		String sql = "INSERT INTO t_cartitem(cartItemId, quantity, gid, uid)"
				+ " values(?,?,?,?)";
		System.out.println(cartItem);
		Object[] params = { cartItem.getCartItemId(), cartItem.getQuantity(),
				cartItem.getGoods().getGid(), cartItem.getUser().getUid() };
		qr.update(sql, params);
	}

	/**
	 * 根据cartItemId查询订单项
	 * 
	 * @param cartItemId
	 * @return
	 * @throws SQLException
	 */
	public CartItem findByCartItemId(String cartItemId) throws SQLException {
		String sql = "SELECT * FROM t_cartitem c,t_goods g WHERE g.gid=c.gid AND c.cartItemId=?";
		return toCartItem(qr.query(sql, new MapHandler(), cartItemId));
	}

	/**
	 * 修改指定id的订单项数目
	 * 
	 * @param cartItemId
	 * @param quantity
	 * @throws SQLException
	 */
	public void updateQuantity(String cartItemId, int quantity)
			throws SQLException {
		String sql = "UPDATE t_cartitem SET quantity=? WHERE cartItemId=?";
		Integer num = findByCartItemId(cartItemId).getGoods().getNum();
		if (num < quantity) {
			quantity = num;
		} else {
			qr.update(sql, quantity, cartItemId);
		}
	}

	/**
	 * 将一个Map映射成CartItem
	 * 
	 * @param map
	 * @return
	 */
	private CartItem toCartItem(Map<String, Object> map) {
		if (map == null || map.size() == 0) {
			return null;
		} else {
			CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
			cartItem.setGoods(CommonUtils.toBean(map, Goods.class));
			cartItem.setUser(CommonUtils.toBean(map, User.class));
			return cartItem;
		}
	}

	/**
	 * 把多个Map(List<Map>)映射成多个CartItem(List<CartItem>)
	 * 
	 * @param mapList
	 * @return
	 */
	private List<CartItem> toCartItems(List<Map<String, Object>> mapList) {
		List<CartItem> cartItems = new ArrayList<CartItem>();
		for (Map<String, Object> map : mapList) {
			CartItem cartItem = toCartItem(map);
			cartItems.add(cartItem);
		}
		return cartItems;

	}

	/**
	 * 拼接where子句
	 * 
	 * @param len
	 * @return
	 */
	private String toWhereSql(int len) {
		StringBuffer sb = new StringBuffer("cartItemId in(");
		for (int i = 0; i < len; i++) {
			sb.append("?");
			if (i < len - 1) {
				sb.append(",");
			}
		}
		sb.append(")");
		return sb.toString();
	}
}
