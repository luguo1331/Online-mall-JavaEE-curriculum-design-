package com.sise.taotao.domain;

import java.util.List;

/*
 * 类名称: PageBean   
 * 类描述: 分页Bean               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-25 下午2:25:55 
 * 修改备注:
 * @version 1.0.0
 */
public class PageBean<T> {
	private int pc;// 当前页码
	private int tr;// 总记录数
	private int ps;// 每页记录数
	private String url;// 请求路径和参数
	private List<T> beanList;

	// 计算总页数
	public int getTp() {
		int tp = tr / ps;
		return tr % ps == 0 ? tp : tp + 1;
	}

	public int getPc() {
		return pc;
	}

	public void setPc(int pc) {
		this.pc = pc;
	}

	public int getTr() {
		return tr;
	}

	public void setTr(int tr) {
		this.tr = tr;
	}

	public int getPs() {
		return ps;
	}

	public void setPs(int ps) {
		this.ps = ps;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

}
