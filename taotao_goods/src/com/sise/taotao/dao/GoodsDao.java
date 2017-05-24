package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.Category;
import com.sise.taotao.domain.Goods;
import com.sun.org.apache.bcel.internal.generic.NEW;

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
}
