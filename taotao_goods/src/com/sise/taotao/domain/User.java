package com.sise.taotao.domain;

import java.util.List;

/*
 * 类名称: User   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-4 下午6:07:44 
 * 修改备注:
 * @version 1.0.0
 */
public class User {
	// 对应数据库表
	private String uid;// 主键
	private String loginname;// 登录名
	private String loginpass;// 登录密码
	private String nickname;// 昵称
	private String sex;// 性别
	private String birthday;// 生日
	private String email;// 邮箱
	private String phone;// 电话
	private boolean status;// 状态，true表示已激活，或者未激活
	private String activationCode;// 激活码，它是唯一值！即每个用户的激活码是不同的！
	private List<Address> addressList;// 地址
	// 注册表单
	private String reloginpass;// 确认密码
	private Boolean rememb;// 记住密码

	// 修改密码表单
	private String newpass;// 新密码

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpass() {
		return loginpass;
	}

	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public String getReloginpass() {
		return reloginpass;
	}

	public void setReloginpass(String reloginpass) {
		this.reloginpass = reloginpass;
	}

	public Boolean getRememb() {
		return rememb;
	}

	public void setRememb(Boolean rememb) {
		this.rememb = rememb;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

}
