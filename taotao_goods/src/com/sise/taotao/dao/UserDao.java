package com.sise.taotao.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.sise.taotao.domain.Address;
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
		Map<String, Object> map = qr.query(sql, new MapHandler(), loginname,
				loginpass);
		User user = CommonUtils.toBean(map, User.class);
		sql = "SELECT * FROM t_address WHERE uid=?";
		String param = user.getUid();
		List<Address> addressList = qr.query(sql, new BeanListHandler<Address>(
				Address.class), param);
		user.setAddressList(addressList);
		return user;
	}

	/**
	 * 按uid和password查询
	 * 
	 * @param uid
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public boolean findByUidAndPassword(String uid, String password)
			throws SQLException {
		String sql = "select count(*) from t_user where uid=? and loginpass=?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), uid,
				password);
		return number.intValue() > 0;
	}

	/**
	 * 查找所有用户
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<User> findAll() throws SQLException {
		String sql = "SELECT * FROM t_user";
		return qr.query(sql, new BeanListHandler<User>(User.class));
	}

	/**
	 * 修改密码
	 * 
	 * @param uid
	 * @param password
	 * @throws SQLException
	 */
	public void updatePassword(String uid, String password) throws SQLException {
		String sql = "update t_user set loginpass=? where uid=?";
		qr.update(sql, password, uid);
	}

	/**
	 * 注册用户
	 * 
	 * @param user
	 * @throws SQLException
	 */
	public void regist(User user) throws SQLException {
		String sql = "INSERT INTO t_user(loginname,loginpass,uid,email) VALUES(?,?,?,?)";
		Object[] params = { user.getLoginname(), user.getLoginpass(),
				user.getUid(), user.getEmail() };
		qr.update(sql, params);
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @throws SQLException
	 */
	public void updateMessage(User user) throws SQLException {
		String sql = "UPDATE t_user SET nickname=?,birthday=?,email=?,phone=? WHERE uid=?";
		Object[] params = { user.getNickname(), user.getBirthday(),
				user.getEmail(), user.getPhone(), user.getUid() };
		qr.update(sql, params);
	}

}
