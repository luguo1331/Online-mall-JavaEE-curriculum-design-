package com.sise.taotao.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.User;
import com.sun.org.apache.bcel.internal.generic.NEW;

/*
 * 类名称: UserDao   
 * 类描述: 用户模块持久层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-14 上午11:21:09 
 * 修改备注:
 * @version 1.0.0
 */
public class UserDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 通过用户名和密码查询用户
	 * 
	 * @param loginname
	 *            用户名
	 * @param loginpass
	 *            登陆密码
	 * @return 返回一个User对象
	 * @throws SQLException
	 */
	public User findByLoginnameAndLoginpass(String loginname, String loginpass)
			throws SQLException {
		String sql = "SELECT * FROM t_user WHERE loginname=? AND loginpass=?";
		return qr.query(sql, new BeanHandler<User>(User.class), loginname,
				loginpass);
	}

}
