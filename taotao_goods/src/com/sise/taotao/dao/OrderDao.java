package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.Order;
import com.sise.taotao.domain.OrderItem;
import com.sise.taotao.domain.PageBean;
import com.sise.taotao.domain.User;
import com.sise.taotao.other.Expression;
import com.sise.taotao.other.PageConstants;

/*
 * 类名称: OrderDao   
 * 类描述: 订单模块持久层              
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-30 下午9:07:59 
 * 修改备注:
 * @version 1.0.0
 */
public class OrderDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 根据oid查询订单状态
	 * 
	 * @param oid
	 * @return
	 * @throws SQLException
	 */
	public int findStatus(String oid) throws SQLException {
		String sql = "SELECT status FROM t_order WHERE oid=?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), oid);
		return number.intValue();
	}

	/**
	 * 修改订单状态
	 * 
	 * @param oid
	 * @param status
	 * @throws SQLException
	 */
	public void updateStatus(String oid, int status) throws SQLException {
		String sql = "UPDATE t_order SET status=? WHERE oid=?";
		qr.update(sql, status, oid);
	}

	/**
	 * 生成订单
	 * 
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

	/**
	 * 通用的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Order> findByCriteria(List<Expression> exprList, int pc)
			throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.ORDER_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		List<Object> params = new ArrayList<Object>();// SQL中有问号，它是对应问号的值
		for (Expression expr : exprList) {
			/*
			 * 添加一个条件上， 1) 以and开头 2) 条件的名称 3) 条件的运算符，可以是=、!=、>、< ... is null，is
			 * null没有值 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" AND ").append(expr.getName()).append(" ")
					.append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if (!expr.getOperator().equals("IS NULL")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String sql = "SELECT COUNT(*) FROM t_order" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "SELECT * FROM t_order" + whereSql
				+ " ORDER BY ordertime DESC LIMIT ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数

		List<Order> beanList = qr.query(sql, new BeanListHandler<Order>(
				Order.class), params.toArray());

		// 虽然已经获取所有的订单，但每个订单中并没有订单条目。
		// 遍历每个订单，为其加载它的所有订单条目
		for (Order order : beanList) {
			loadOrderItem(order);
		}

		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Order> pb = new PageBean<Order>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}

	/**
	 * 详细内容的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Order> findByCriteria2(List<Expression> exprList, int pc)
			throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.ORDER_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		List<Object> params = new ArrayList<Object>();// SQL中有问号，它是对应问号的值
		for (Expression expr : exprList) {
			/*
			 * 添加一个条件上， 1) 以and开头 2) 条件的名称 3) 条件的运算符，可以是=、!=、>、< ... is null，is
			 * null没有值 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName()).append(" ")
					.append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if (!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String sql = "select count(*) from t_order" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from t_order" + whereSql
				+ " order by ordertime desc limit ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数

		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(),
				params.toArray());
		System.out.println(mapList);
		List<Order> orderList = toOrderList(mapList);

		// 虽然已经获取所有的订单，但每个订单中并没有订单条目。
		// 遍历每个订单，为其加载它的所有订单条目
		for (Order order : orderList) {
			loadOrderItem(order);
			loadUser(order);
		}
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Order> pb = new PageBean<Order>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(orderList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}

	/**
	 * 为指定的oder加载他的用户信息
	 * 
	 * @param order
	 * @throws SQLException
	 */
	private void loadUser(Order order) throws SQLException {
		String sql = "select * from t_user where uid=?";
		User user = qr.query(sql, new BeanHandler<User>(User.class), order
				.getOwner().getUid());
		order.setOwner(user);
	}

	/**
	 * 把多个Map转换成多个Order
	 * 
	 * @param mapList
	 * @return
	 */
	private List<Order> toOrderList(List<Map<String, Object>> mapList) {
		List<Order> orderList = new ArrayList<Order>();
		for (Map<String, Object> map : mapList) {
			Order order = toOrder(map);
			orderList.add(order);
		}
		return orderList;
	}

	/**
	 * 把一个Map转换成一个Order
	 * 
	 * @param map
	 * @return
	 */
	private Order toOrder(Map<String, Object> map) {
		Order order = CommonUtils.toBean(map, Order.class);
		User user = CommonUtils.toBean(map, User.class);
		System.out.println(user.getUid());
		order.setOwner(user);
		return order;
	}

	/**
	 * 查询所有订单
	 * 
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findAll(int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		return findByCriteria2(exprList, pc);
	}

	/**
	 * 为指定的order载它的所有OrderItem
	 * 
	 * @param order
	 * @throws SQLException
	 */
	private void loadOrderItem(Order order) throws SQLException {
		/*
		 * 1. 给sql语句select * from t_orderitem where oid=? 2.
		 * 执行之，得到List<OrderItem> 3. 设置给Order对象
		 */
		String sql = "SELECT * FROM t_orderitem WHERE oid=?";
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(),
				order.getOid());
		List<OrderItem> orderItemList = toOrderItemList(mapList);

		order.setOrderItemList(orderItemList);
	}

	/**
	 * 把多个Map转换成多个OrderItem
	 * 
	 * @param mapList
	 * @return
	 */
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for (Map<String, Object> map : mapList) {
			OrderItem orderItem = toOrderItem(map);
			orderItemList.add(orderItem);
		}
		return orderItemList;
	}

	/**
	 * 把一个Map转换成一个OrderItem
	 * 
	 * @param map
	 * @return
	 */
	private OrderItem toOrderItem(Map<String, Object> map) {
		OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
		Goods goods = CommonUtils.toBean(map, Goods.class);
		orderItem.setGoods(goods);
		return orderItem;
	}

	/**
	 * 按用户查询订单
	 * 
	 * @param uid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByUser(String uid, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		return findByCriteria(exprList, pc);
	}
}
