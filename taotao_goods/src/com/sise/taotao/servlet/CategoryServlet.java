package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.Category;
import com.sise.taotao.service.CategoryService;

/*
 * 类名称: CategoryServlet   
 * 类描述: 分类模块WEB层              
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-14 下午2:30:44 
 * 修改备注:
 * @version 1.0.0
 */
public class CategoryServlet extends BaseServlet {
	private CategoryService categoryService = new CategoryService();

	/**
	 * 查询所有分类
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public List<Category> FindAll() throws ServletException, IOException {
		return categoryService.findAll();
	}

	/**
	 * 查找一级分类
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> categoryList = categoryService.findAll();
		req.setAttribute("categoryList", categoryList);
		return "f:/admin/category.jsp";
	}

	/**
	 * 查找二级分类
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findSecondCategory(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String cid = (String) req.getParameter("cid");
		List<Category> categoryList = categoryService.findByParent(cid);
		req.setAttribute("categoryList", categoryList);
		return "f:/admin/category.jsp";
	}
}
