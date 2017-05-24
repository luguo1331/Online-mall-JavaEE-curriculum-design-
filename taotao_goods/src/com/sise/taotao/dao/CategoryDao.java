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

/*
 * 类名称: CategoryDao   
 * 类描述: 分类模块持久层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-14 下午1:44:51 
 * 修改备注:
 * @version 1.0.0
 */
public class CategoryDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 将一个Map中的数据映射到category中
	 * 
	 * @param map
	 * @return
	 */
	private Category toCategory(Map<String, Object> map) {
		Category category = CommonUtils.toBean(map, Category.class);
		String pid = (String) map.get("pid");
		if (pid != null) {
			Category parent = new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}

	/**
	 * 将多个Map中的数据映射到多个Category中
	 * 
	 * @param mapList
	 * @return
	 */
	private List<Category> toCategoryList(List<Map<String, Object>> mapList) {
		List<Category> categoryList = new ArrayList<Category>();
		for (Map<String, Object> map : mapList) {
			Category category = toCategory(map);
			categoryList.add(category);
		}
		return categoryList;
	}

	/**
	 * 返回所有分类
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Category> findAll() throws SQLException {
		String sql = "SELECT * FROM t_category WHERE pid IS NULL ORDER BY orderBy";
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler());

		List<Category> parents = toCategoryList(mapList);

		for (Category parent : parents) {
			parent.setChildren(findByParent(parent.getCid()));
			for (Category child : parent.getChildren()) {
				child.setGoods(new GoodsDao().findByCategory(child.getCid()));
			}
		}
		return parents;
	}

	/**
	 * 通过父分类查询子分类
	 * 
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	private List<Category> findByParent(String pid) throws SQLException {
		String sql = "SELECT * FROM t_category WHERE pid=? ORDER BY orderBy";
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(),
				pid);
		return toCategoryList(mapList);
	}

}
