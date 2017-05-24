package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.Activity;
import com.sise.taotao.service.ActivityService;

/*
 * 类名称: ActivityServlet   
 * 类描述: 活动模块WEB层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午6:17:18 
 * 修改备注:
 * @version 1.0.0
 */
public class ActivityServlet extends BaseServlet {

	/**
	 * 返回所有活动
	 * 
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public List<Activity> FindAll() throws ServletException, IOException {
		return new ActivityService().findAll();
	}
}
