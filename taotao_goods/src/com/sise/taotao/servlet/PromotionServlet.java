package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.Promotion;
import com.sise.taotao.service.PromotionService;

/*
 * 类名称: Promotion   
 * 类描述: 今日推荐模块WEB层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午5:29:49 
 * 修改备注:
 * @version 1.0.0
 */
public class PromotionServlet extends BaseServlet {

	/**
	 * 返回所有活动
	 * 
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public List<Promotion> FindAll() throws ServletException, IOException {
		return new PromotionService().findAll();
	}
}
