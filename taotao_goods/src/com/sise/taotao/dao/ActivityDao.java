package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sise.taotao.domain.Activity;

import cn.itcast.jdbc.TxQueryRunner;

/*
 * 类名称: ActivityDao   
 * 类描述: 活动模块持久层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午6:18:09 
 * 修改备注:
 * @version 1.0.0
 */
public class ActivityDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 返回所有活动
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Activity> findAll() throws SQLException {
		return qr.query("SELECT * FROM t_activity",
				new BeanListHandler<Activity>(Activity.class));
	}
}
