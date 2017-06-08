package com.sise.taotao.service;

import java.sql.SQLException;
import java.util.List;

import cn.itcast.commons.CommonUtils;

import com.sise.taotao.dao.UserDao;
import com.sise.taotao.domain.PageBean;
import com.sise.taotao.domain.User;
import com.sise.taotao.exception.UserException;

/*
 * 类名称: UserService   
 * 类描述: 用户模块业务层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-14 上午11:20:16 
 * 修改备注:
 * @version 1.0.0
 */
public class UserService {
	private UserDao userDao = new UserDao();

	/**
	 * 登陆
	 * 
	 * @param user
	 * @return
	 */
	public User login(User user) {
		try {
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(),
					user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 查找所有用户
	 * 
	 * @return
	 */
	public PageBean<User> findAll(int pc) {
		try {
			return userDao.findAll(pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 注册用户
	 * 
	 * @param user
	 */
	public void regist(User user) {
		// 数据补齐
		user.setUid(CommonUtils.uuid());
		user.setEmail(user.getLoginname());
		// 插入数据库
		try {
			userDao.regist(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 */
	public User updateMessage(User user) {
		try {
			userDao.updateMessage(user);
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(),
					user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 修改密码
	 * 
	 * @param uid
	 * @param newPass
	 * @param oldPass
	 * @throws UserException
	 */
	public void updatePassword(String uid, String newPass, String oldPass)
			throws UserException {

		try {
			boolean bool = userDao.findByUidAndPassword(uid, oldPass);
			if (!bool) {// 如果老密码错误
				throw new UserException("老密码错误！");
			}
			userDao.updatePassword(uid, newPass);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
