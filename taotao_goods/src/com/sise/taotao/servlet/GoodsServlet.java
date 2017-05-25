package com.sise.taotao.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.Goods;
import com.sise.taotao.domain.PageBean;
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
