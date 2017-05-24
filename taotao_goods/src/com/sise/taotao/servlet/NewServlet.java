package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import com.sise.taotao.domain.Category;
import com.sise.taotao.domain.New;
import com.sise.taotao.service.NewService;

import cn.itcast.servlet.BaseServlet;

/*
 * 类名称: NewServlet   
 * 类描述: 新闻模块WEB层              
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午11:49:52 
 * 修改备注:
 * @version 1.0.0
 */
public class NewServlet extends BaseServlet {
	private NewService newService = new NewService();

	/**
	 * 返回所有新闻
	 * 
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public List<New> FindAll() throws ServletException, IOException {
		return newService.findAll();
	}
	
	public List<New> load() throws ServletException, IOException {
		return null;
	}
}
