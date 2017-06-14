package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.Category;
import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.PageBean;
import com.sise.taotao.other.Expression;
import com.sise.taotao.other.PageConstants;

/*
 * 类名称: GoodsDao   
 * 类描述: 商品模块持久层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-24 上午10:56:07 
 * 修改备注:
 * @version 1.0.0
 */
public class GoodsDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 将一个Map中的数据映射到goods中
	 * 
	 * @param map
	 * @return
	 */
	private Goods toGoods(Map<String, Object> map) {
		Goods goods = CommonUtils.toBean(map, Goods.class);
		String cid = (String) map.get("cid");
		Category parent = new Category();
		parent.setCid(cid);
		goods.setCategory(parent);
		return goods;
	}

	/**
	 * 将多个Map中的数据映射到多个Category中
	 * 
	 * @param mapList
	 * @return
	 */
	private List<Goods> toGoodsList(List<Map<String, Object>> mapList) {
		List<Goods> goodsList = new ArrayList<Goods>();
		for (Map<String, Object> map : mapList) {
			Goods goods = toGoods(map);
			goodsList.add(goods);
		}
		return goodsList;
	}

	/**
	 * 按分类查询所有商品
	 * 
	 * @param cid
	 *            分类id
	 * @return 返回符合id的所有商品
	 * @throws SQLException
	 */
	public List<Goods> findByCategory(String cid) throws SQLException {
		String sql = "SELECT * FROM t_goods WHERE cid=?";// ORDER BY orderBy
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(),
				cid);
		return toGoodsList(mapList);
	}

	/**
	 * 按cid，pc查询
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByCategory(String cid, int pc)
			throws SQLException {
		List<Expression> expressList = new ArrayList<Expression>();
		expressList.add(new Expression("cid", "=", cid));
		return findByCriteria(expressList, pc);
	}

	/**
	 * 查询所有商品
	 * 
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findAll(int pc) throws SQLException {
		List<Expression> expressList = new ArrayList<Expression>();
		return findByCriteria(expressList, pc);
	}

	/**
	 * 按gname模糊查询
	 * 
	 * @param gname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByGname(String gname, int pc)
			throws SQLException {
		System.out.println(gname);
		ArrayList<Expression> expressList = new ArrayList<Expression>();
		expressList.add(new Expression("gname", "LIKE", "%" + gname + "%"));
		return findByCriteria(expressList, pc);
	}

	/**
	 * 通用的查询方法
	 * 
	 * @param expressList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Goods> findByCriteria(List<Expression> expressList, int pc)
			throws SQLException {
		// 得到每页记录数
		int ps = PageConstants.GOOD_PAGE_SIZE;// 12
		// 拼接查询语句
		StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
		List<Object> params = new ArrayList<Object>();
		for (Expression expression : expressList) {
			whereSql.append(" AND ").append(expression.getName()).append(" ")
					.append(expression.getOperator()).append(" ");
			if (expression.getOperator() != "IS NULL") {
				whereSql.append("?");
				params.add(expression.getValue());
			}
		}
		// 查询总记录数
		String sql = "SELECT count(*) FROM t_goods" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();

		// 查询beanList
		sql = "SELECT * FROM t_goods" + whereSql
				+ " ORDER BY orderBy LIMIT ?,?";
		params.add((pc - 1) * ps);
		params.add(ps);
		List<Goods> beanList = qr.query(sql, new BeanListHandler<Goods>(
				Goods.class), params.toArray());
		// 设置pageBean参数
		PageBean<Goods> pageBean = new PageBean<Goods>();
		pageBean.setPc(pc);
		pageBean.setPs(ps);
		pageBean.setTr(tr);
		pageBean.setBeanList(beanList);
		return pageBean;
	}

	/**
	 * 根据gid查询商品
	 * 
	 * @param gid
	 * @return
	 * @throws SQLException
	 */
	public Goods findByGid(String gid) throws SQLException {
		String sql = "SELECT * FROM t_goods g ,t_category c WHERE g.cid=c.cid AND g.gid=?";
		Map<String, Object> map = qr.query(sql, new MapHandler(), gid);
		Goods goods = CommonUtils.toBean(map, Goods.class);
		Category category = CommonUtils.toBean(map, Category.class);
		goods.setCategory(category);
		if (map.get("pid") != null) {
			Category parent = new Category();
			parent.setCid((String) map.get("pid"));
			category.setParent(parent);
		}
		return goods;
	}

	/**
	 * 更新库存
	 * 
	 * @param num
	 * @param gid
	 * @throws SQLException
	 */
	public void updateNum(int num, String gid) throws SQLException {
		String sql = "UPDATE t_goods SET num=? WHERE gid=? ";
		qr.update(sql, num, gid);
	}

	/**
	 * 添加图书
	 * 
	 * @param book
	 * @throws SQLException
	 */
	public void add(Goods goods) throws SQLException {
		String sql = "INSERT INTO t_goods(gid,gname,price,currPrice,"
				+ "discount,press,image_1,image_2,num,cid,type,image_3,image_4)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { goods.getGid(), goods.getGname(), goods.getPrice(),
				goods.getCurrPrice(), goods.getDiscount(), goods.getPress(),
				goods.getImage_1(), goods.getImage_2(), goods.getNum(),
				goods.getCategory().getCid(), goods.getType(),
				goods.getImage_3(), goods.getImage_4() };
		qr.update(sql, params);
	}
}
