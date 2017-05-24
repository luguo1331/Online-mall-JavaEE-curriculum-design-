package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sise.taotao.domain.Promotion;
import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.itcast.jdbc.TxQueryRunner;

/*
 * 类名称: PromotionDao   
 * 类描述: 今日推荐模块持久层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午5:32:24 
 * 修改备注:
 * @version 1.0.0
 */
public class PromotionDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 返回所有推荐
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Promotion> findAll() throws SQLException {
		String sql = "SELECT * FROM t_promotion";
		return qr.query(sql, new BeanListHandler<Promotion>(Promotion.class));
	}
}
