package com.sise.taotao.service;

import java.sql.SQLException;
import java.util.List;

import com.sise.taotao.dao.PromotionDao;
import com.sise.taotao.domain.Promotion;

/*
 * 类名称: PromotionService   
 * 类描述: 今日推荐模块业务层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午5:33:23 
 * 修改备注:
 * @version 1.0.0
 */
public class PromotionService {
	private PromotionDao promotionDao = new PromotionDao();

	/**
	 * 返回所有推荐
	 * @return
	 */
	public List<Promotion> findAll() {
		try {
			return promotionDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
