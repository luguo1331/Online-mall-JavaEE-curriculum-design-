package com.sise.taotao.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.sise.taotao.domain.Category;
import com.sise.taotao.servlet.ActivityServlet;
import com.sise.taotao.servlet.CategoryServlet;
import com.sise.taotao.servlet.NewServlet;
import com.sise.taotao.servlet.PromotionServlet;
import com.sun.org.apache.bcel.internal.generic.NEW;

/*
 * 类名称: HomeFilter   
 * 类描述: 主页过滤器               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-18 下午5:23:21 
 * 修改备注:
 * @version 1.0.0
 */
public class HomeFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		// 加载目录
		req.setAttribute("parents", new CategoryServlet().FindAll());
		// 加载今日推荐
		req.setAttribute("promotion", new PromotionServlet().FindAll());
		// 加载活动
		req.setAttribute("activity", new ActivityServlet().FindAll());
		// 加载新闻
		req.setAttribute("new", new NewServlet().FindAll());
		req.getRequestDispatcher("/home/home.jsp").forward(req, response);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
