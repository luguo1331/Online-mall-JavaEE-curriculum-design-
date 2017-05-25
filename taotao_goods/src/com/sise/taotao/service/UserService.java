package com.sise.taotao.service;

import java.sql.SQLException;

import cn.itcast.commons.CommonUtils;

import com.sise.taotao.dao.UserDao;
import com.sise.taotao.domain.User;

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
	 * 登陆功能
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
}
