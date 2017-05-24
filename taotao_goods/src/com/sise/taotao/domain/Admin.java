package com.sise.taotao.domain;

/*
 * 类名称: Admin   
 * 类描述:                
 * 创建人: 凌威     
 * 修改人:  
 * 修改时间:2017-5-4 下午6:02:57 
 * 修改备注:
 * @version 1.0.0
 */
public class Admin {
	private String adminId;// 主键
	private String adminname;// 管理员的登录名
	private String adminpwd;// 管理员的登录密码
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	
}
