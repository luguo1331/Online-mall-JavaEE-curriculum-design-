package com.sise.taotao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.Category;
import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.PageBean;
import com.sise.taotao.service.CategoryService;
import com.sise.taotao.service.GoodsServlce;

/*
 * 类名称: GoodsServlst   
 * 类描述: 商品模块WEB层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-24 上午10:52:58 
 * 修改备注:
 * @version 1.0.0
 */
public class GoodsServlet extends BaseServlet {
	private GoodsServlce goodsService = new GoodsServlce();
	private CategoryService categoryService = new CategoryService();

	/**
	 * 获取当前页码，默认值是1
	 * 
	 * @param request
	 * @return
	 */
	private int getPc(HttpServletRequest request) {
		int pc = 1;
		String param = request.getParameter("pc");
		if (param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch (RuntimeException e) {
			}
		}
		return pc;
	}

	/**
	 * 截取当前url
	 * 
	 * @param request
	 * @return
	 */
	private String getUrl(HttpServletRequest request) {
		String url = request.getRequestURI() + "?" + request.getQueryString();
		int index = url.lastIndexOf("&pc=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}

	/**
	 * 根据cid,pc查询商品
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategory(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// 获取当前页码
		int pc = getPc(req);
		// 获取当前url
		String url = getUrl(req);
		// 获取当前插叙条件
		String cid = req.getParameter("cid");
		// 使用cid与pc查询
		PageBean<Goods> pageBean = goodsService.findByCategory(cid, pc);
		// 设置pageBean参数
		pageBean.setUrl(url);
		req.setAttribute("pagebean", pageBean);
		return "f:/home/search.jsp";
	}

	/**
	 * 按cid查找商品
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategoryAmdin(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// 获取当前页码
		int pc = getPc(req);
		// 获取当前url
		String url = getUrl(req);
		// 获取当前插叙条件
		String cid = req.getParameter("cid");
		// 使用cid与pc查询
		PageBean<Goods> pb = goodsService.findByCategory(cid, pc);
		// 设置pageBean参数
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/admin/goods.jsp";
	}

	/**
	 * 查询所有商品
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取当前页码
		int pc = getPc(req);
		// 获取当前url
		String url = getUrl(req);
		// 使用pc查询
		PageBean<Goods> pb = goodsService.findAll(pc);
		// 设置pageBean参数
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/admin/goods.jsp";
	}

	/**
	 * 根据gname查询商品
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByGname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		// 获取当前页码
		int pc = getPc(req);
		// 获取当前url
		String url = getUrl(req);
		// 获取当前插叙条件
		// String(req.getParameter("index_none_header_sysc").getBytes("GBK"),"utf-8");
		String gname = req.getParameter("index_none_header_sysc");
		// 使用cid与pc查询
		PageBean<Goods> pageBean = goodsService.findByGname(gname, pc);
		// 设置pageBean参数
		pageBean.setUrl(url);
		req.setAttribute("pagebean", pageBean);
		System.out.println(pageBean.getBeanList());
		return "f:/home/search.jsp";
	}

	/**
	 * 修改库存
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateNum(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取当前页码
		int pc = getPc(req);
		// 获取当前url
		String url = getUrl(req);
		// 获取当前插叙条件
		String gid = req.getParameter("gid");
		int num = 0;
		// 修改库存
		goodsService.updateNum(num, gid);
		// 使用pc查询
		PageBean<Goods> pb = goodsService.findAll(pc);
		// 设置pageBean参数
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/admin/goods.jsp";
	}

	/**
	 * 跳转添加商品页面
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		return "f:/admin/addGoods.jsp";
	}

	/**
	 * 异步查询二级分类
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxFindChildren(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 1. 获取pid 2. 通过pid查询出所有2级分类 3. 把List<Category>转换成json，输出给客户端
		 */
		String pid = req.getParameter("pid");
		List<Category> children = categoryService.findByParent(pid);
		String json = toJson(children);
		resp.getWriter().print(json);
		return null;
	}

	// {"cid":"fdsafdsa", "cname":"fdsafdas"}
	private String toJson(Category category) {
		StringBuilder sb = new StringBuilder("{");
		sb.append("\"cid\"").append(":").append("\"").append(category.getCid())
				.append("\"");
		sb.append(",");
		sb.append("\"cname\"").append(":").append("\"")
				.append(category.getCname()).append("\"");
		sb.append("}");
		return sb.toString();
	}

	// [{"cid":"fdsafdsa", "cname":"fdsafdas"}, {"cid":"fdsafdsa",
	// "cname":"fdsafdas"}]
	private String toJson(List<Category> categoryList) {
		StringBuilder sb = new StringBuilder("[");
		for (int i = 0; i < categoryList.size(); i++) {
			sb.append(toJson(categoryList.get(i)));
			if (i < categoryList.size() - 1) {
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}

	/**
	 * 根据gid查询商品
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByGid(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取gid
		String gid = req.getParameter("gid");
		Goods goods = goodsService.findByGid(gid);
		req.setAttribute("goods", goods);
		return "f:/home/introduction.jsp";
	}

}
