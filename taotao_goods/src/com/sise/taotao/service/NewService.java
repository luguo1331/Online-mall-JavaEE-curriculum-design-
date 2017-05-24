package com.sise.taotao.service;

import java.sql.SQLException;
import java.util.List;

import com.sise.taotao.dao.NewDao;
import com.sise.taotao.domain.New;

/*
 * 类名称: NewService   
 * 类描述: 新闻模块业务层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午11:49:15 
 * 修改备注:
 * @version 1.0.0
 */
public class NewService {
	private NewDao newDao = new NewDao();

	/**
	 * 返回所有新闻
	 * 
	 * @return
	 */
	public List<New> findAll() {
		try {
			return newDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
