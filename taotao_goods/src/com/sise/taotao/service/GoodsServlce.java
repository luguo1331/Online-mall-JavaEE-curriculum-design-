package com.sise.taotao.service;

import java.sql.SQLException;

import com.sise.taotao.dao.GoodsDao;
import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.PageBean;

/*
 * 类名称: GoodsServlce   
 * 类描述: 商品模块业务层             
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-24 上午10:54:41 
 * 修改备注:
 * @version 1.0.0
 */
public class GoodsServlce {
	private GoodsDao goodsDao = new GoodsDao();

	/**
	 * 根据cid,pc查询商品
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByCategory(String cid, int pc) {
		try {
			return goodsDao.findByCategory(cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

}
