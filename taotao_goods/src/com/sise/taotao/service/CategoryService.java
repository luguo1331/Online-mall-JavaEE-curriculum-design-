package com.sise.taotao.service;

import java.sql.SQLException;
import java.util.List;

import com.sise.taotao.dao.CategoryDao;
import com.sise.taotao.domain.Category;

/*
 * 类名称: CategoryService   
 * 类描述: 分类模块业务层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-14 下午2:26:15 
 * 修改备注:
 * @version 1.0.0
 */
public class CategoryService {
	private CategoryDao categoryDao = new CategoryDao();

	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Category> findAll() {
		try {
			return categoryDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
