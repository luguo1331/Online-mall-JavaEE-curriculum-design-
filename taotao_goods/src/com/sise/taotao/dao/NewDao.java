package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
/*
 * 类名称: NewDao   
 * 类描述: 新闻模块持久层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午11:49:00 
 * 修改备注:
 * @version 1.0.0
 */

import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.New;

public class NewDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 返回所有新闻
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<New> findAll() throws SQLException {
		return qr.query("SELECT * FROM t_new LIMIT 5",
				new BeanListHandler<New>(New.class));
	}
}
