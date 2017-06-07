package com.sise.taotao.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.sise.taotao.domain.Category;
import com.sise.taotao.domain.User;
import com.sise.taotao.exception.UserException;
import com.sise.taotao.service.UserService;

/*
 * 类名称: UserServlet   
 * 类描述: 用户模块WEB层               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-14 上午9:55:58 
 * 修改备注:
 * @version 1.0.0
 */
public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();

	/**
	 * 登录功能
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 封装表单数据到user中
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		// 校验表单数据
		Map<String, String> errors = validateLogin(formUser, req.getSession());
		if (errors.size() != 0) {
			req.setAttribute("user", formUser);
			req.setAttribute("msg", "密码或用户名错误");
			return "f:/home/login.jsp";
		}
		// 调用UserService的login方法
		User user = userService.login(formUser);
		// 判断用户
		if (user == null) {
			req.setAttribute("user", formUser);
			req.setAttribute("msg", "密码或用户名错误");
			return "f:/home/login.jsp";
		} else {
			if (!user.isStatus()) {
				req.setAttribute("user", formUser);
				req.setAttribute("msg", "您还没有激活");
				return "f:/home/login.jsp";
			} else {
				// 保存用户到session
				req.getSession().setAttribute("sessionUser", user);
				// 保存用户到cookie中
				String loginname = user.getLoginname();
				loginname = URLEncoder.encode(loginname, "UTF-8");
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 10);// 保存十天
				resp.addCookie(cookie);
				return "r:/home/home.jsp";
			}
		}
	}

	/**
	 * 查询所有用户
	 * 
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public List<User> findAll() throws ServletException, IOException {
		return userService.findAll();
	}

	public String regist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 将表单数据封装到bean中
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		// 校验表单数据
		Map<String, String> errors = validateRegist(formUser, req.getSession());
		if (errors.size() != 0) {
			req.setAttribute("user", formUser);
			req.setAttribute("errors", "用户名已被注册");
			return "f:/home/login.jsp";
		}
		// 调用service完成业务
		userService.regist(formUser);
		// 跳转到登陆页面
		return "f:/home/login.jsp";
	}

	/**
	 * 校验登陆表单数据
	 * 
	 * @param formUser
	 * @param session
	 * @return
	 */
	private Map<String, String> validateLogin(User formUser, HttpSession session) {
		HashMap<String, String> errors = new HashMap<String, String>();
		// 校验表单数据
		return errors;
	}

	/**
	 * 校验注册表单数据
	 * 
	 * @param formUser
	 * @param session
	 * @return
	 */
	private Map<String, String> validateRegist(User formUser,
			HttpSession session) {
		HashMap<String, String> errors = new HashMap<String, String>();
		// 校验表单数据
		return errors;
	}

	/**
	 * 修改用户信息
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateMessage(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		User user = (User) req.getSession().getAttribute("sessionUser");
		formUser.setUid(user.getUid());
		formUser.setLoginname(user.getLoginname());
		formUser.setLoginpass(user.getLoginpass());
		user = userService.updateMessage(formUser);
		req.getSession().setAttribute("sessionUser", user);
		return "f:/person/index.jsp";
	}

	/**
	 * 修改用户密码
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updatePassword(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		User user = (User) req.getSession().getAttribute("sessionUser");
		if (user == null) {
			return "f:/home/login.jsp";
		}
		try {
			userService.updatePassword(user.getUid(), formUser.getNewpass(),
					formUser.getLoginpass());
			return "f:/person/index.jsp";
		} catch (UserException e) {
			req.setAttribute("msg", e.getMessage());// 保存异常信息到request
			req.setAttribute("user", formUser);// 为了回显
			return "f:/person/password.jsp";
		}
	}
}
