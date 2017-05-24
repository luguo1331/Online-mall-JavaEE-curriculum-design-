package com.sise.taotao.service;

import java.sql.SQLException;
import java.util.List;

import com.sise.taotao.dao.ActivityDao;
import com.sise.taotao.domain.Activity;
import com.sun.org.apache.bcel.internal.generic.NEW;

/*
 * 类名称: ActivityService   
 * 类描述: 活动模块业务层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午6:17:40 
 * 修改备注:
 * @version 1.0.0
 */
public class ActivityService {
	private ActivityDao activityDao = new ActivityDao();

	/**
	 * 返回所有活动
	 * @return
	 */
	public List<Activity> findAll() {
		try {
			return activityDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
